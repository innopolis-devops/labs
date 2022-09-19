from app import app


def main():
    app.run(debug=True, port=5000, host='0.0.0.0')


if __name__ == '__main__':
    main()
