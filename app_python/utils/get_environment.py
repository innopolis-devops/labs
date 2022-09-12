import json
import subprocess
from typing import Any, Optional
from argparse import ArgumentParser


def get_environment(service_name: str, tag: str, *, namespace: Optional[str] = None) -> None:
    secret_id = f'{service_name}-{namespace}-{tag}' if namespace is not None else f'{service_name}-{tag}'

    # Request.
    result = subprocess.run(f'aws secretsmanager get-secret-value --secret-id {secret_id}'.split(), capture_output=True)

    if result.returncode != 0:
        raise ValueError(f'Bad return code: {result.returncode}. {result.stdout.decode()} {result.stderr.decode()}')

    secret_data: dict[str, Any] = json.loads(result.stdout)
    variables: dict[str, Any] = json.loads(secret_data['SecretString'])

    for name, value in variables.items():
        print(f'{name}={value}')


def main(*, attempts: int = 3) -> None:
    parser = ArgumentParser()
    parser.add_argument('service_name', type=str)
    parser.add_argument('tag', type=str)
    parser.add_argument('namespace', type=str, nargs='?')

    args = parser.parse_args()

    for attempt in range(attempts):
        try:
            get_environment(args.service_name, args.tag, namespace=args.namespace)
            break

        except Exception as exception:
            if attempt + 1 == attempts:
                raise exception


if __name__ == '__main__':
    main()
