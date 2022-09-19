FROM cirrusci/flutter:stable as build

WORKDIR /app_dart

COPY ./ ./

RUN flutter create . --platforms web  \
    && flutter pub get \
    && rm -f ./test/widget_test.dart \
    && flutter analyze . \
    && flutter build web --release


FROM python:3.10

RUN adduser user

WORKDIR /app

COPY --from=build /app_dart/build/web/ ./
COPY ./data/latest.tzf ./packages/timezone/data/latest.tzf

RUN chown -R user /app

USER user

CMD ["python", "-m", "http.server", "5000"] 
