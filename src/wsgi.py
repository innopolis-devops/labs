'''
Module imports this app file to serve as our app gateway.
'''
from src.app import create_app


app = create_app()

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8000, debug=True)
