from aiohttp import web
from app import make_app
from config import default_config


def main():
    config = default_config
    app = make_app(config.app_name)
    web.run_app(app, port=config.port)


if __name__ == "__main__":
    main()
