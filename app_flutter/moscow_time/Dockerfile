FROM glebosotov/app_flutter_web:latest as flutter
# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter upgrade
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx:latest
COPY --from=flutter /app/build/web /usr/share/nginx/html
