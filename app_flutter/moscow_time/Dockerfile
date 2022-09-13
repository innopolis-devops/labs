FROM debian:stable AS build-env
# Install flutter dependencies
RUN apt-get update \
&& apt-get install -y --no-install-recommends curl=7.74.0-1.3+deb11u3 git=1:2.30.2-1 wget=1.21-1+deb11u1 unzip=6.0-26+deb11u1 libgconf-2-4=3.2.6-7 gdb=10.1-1.7 libstdc++6=10.2.1-6 libglu1-mesa=9.0.1-1 fonts-droid-fallback=1:6.0.1r16-1.1 python3=3.9.2-3 sed=4.7-1 ca-certificates=20210119 \
&& apt-get clean
# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
# Set flutter path
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"

# Copy source code and build

RUN mkdir /app/
COPY . /app/
RUN adduser flutteruser && chown -R flutteruser /app/ && chown -R flutteruser /usr/local/flutter/
USER flutteruser
WORKDIR /app/
RUN flutter channel master
RUN flutter upgrade
RUN flutter doctor -v
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx:stable
COPY --from=build-env /app/build/web /usr/share/nginx/html
