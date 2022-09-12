#Dockerfile best practices

1. Use Exposed ports in dockerfile.
2. Use ```COPY``` instead of ```ADD```.
3. Remove all ```"."``` uses.
4. Use specific folder in docker for python application, instead of using root directory.
5. Use [Haskell Dockerfile Linter(hadolint)](https://github.com/hadolint/hadolint), it also have [online](https://hadolint.github.io/hadolint/) linter.
6. At the Java Application used multi-stage build.