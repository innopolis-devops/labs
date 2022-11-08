from typing import Any

from app_python.api.schemas import APIHTTPError


def generate_responses_docs(responses: dict[int | str, Any]) -> dict[int | str, dict[str, Any]]:
    """
    Generates docs for swagger.

    :param responses: A dict with http statuses as keys and a dict with keys
        'description' and 'examples' as value.
    :return: Generated doc.
    """
    return {
        status: {
            'description': response['description'],
            'model': APIHTTPError,
            'content': {
                'application/json': {
                    'examples': {
                        name: {
                            'value': {'detail': detail}
                        } for name, detail in response['examples'].items()
                    }
                }
            }
        } for status, response in responses.items()
    }
