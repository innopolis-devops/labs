FROM python:3.10-alpine

WORKDIR app

# Install python requirements and creating admin for rootless container
COPY app_python/* .
RUN pip install --no-cache-dir -r requirements.txt && \
    addgroup -S admins && \
    adduser -S admin -G admins

USER admin

EXPOSE 5000

CMD python main.py