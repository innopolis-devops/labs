# Best Docker practises

1. Use slim images, if it's possible, this will reduce you image size.

2. If you use `alpine` then be careful, this can increase you build time a lot.

3. Setup locales, this will provide correct settings for console etc.

4. Reduce number of layers, so if it's possible initialize environment with one `RUN` command.

5. Make sure, that all frequently changing and heavy layers are the last. So, first initialize environment and only 
then copy source code.

6. Do not use `root` user.

7. Sometimes it's better do not provide an entrypoint command in dockerfile and use it inside docker-compose instead.
In this way you can use same image for different entrypoints.
