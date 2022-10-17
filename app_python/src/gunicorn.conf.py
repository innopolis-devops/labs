from os import cpu_count

bind = 'unix:///tmp/app/app.sock'
worker_class = 'uvicorn.workers.UvicornWorker'
workers = cpu_count()
if workers is None:
    workers = 1

# Connection to nginx.
keepalive = 64

logconfig_dict = {
    'version': 1,
    'disable_existing_loggers': True,
    'loggers': {
        'gunicorn.access': {'handlers': ['console', 'file'], 'level': 'INFO'},
        'gunicorn.error': {'handlers': ['console', 'file'], 'level': 'INFO'}
    },
    'handlers': {
        'console': {
            'formatter': 'default',
            'class': 'logging.StreamHandler',
            'level': 'INFO'
        },
        'file': {
            'formatter': 'default',
            'class': 'logging.handlers.RotatingFileHandler',
            'level': 'INFO',
            'filename': '../logs/main.log',
            'maxBytes': 50 * 1024 * 1024,
            'backupCount': 10
        }
    },
    'formatters': {
        'default': {
            'format': r'%(asctime)s %(levelname)s %(module)s:%(funcName)s:%(lineno)d %(message)s',
        }
    }
}
