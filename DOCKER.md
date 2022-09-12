# Dockerfile best practices

* Use rootless containers. It's recommended to specify own user in Dockerfile because root user may lead to higher security flaws. Also, set corresponding safe permissions in file system if needed

* Use multi-stage builds. It reduces the size of the final image and excludes some tools that may be used at build stage only. But for this task it doesn't make much sense to use separate stage on requirements installing phase because we do not use any additional tools during installation, and it would be useless just to copy installed packages to the similar image

* Use alpine image. It contains only minimal set of needed tools and reduces the size of final image significantly. Also, it takes much less time to download the image and increases security

* Use official and trusted images. In case of custom images, check base ones and Dockerfiles

* Expose only needed ports

* Do not put credentials to the Dockerfile. Use environments functionality

* Use `.dockerignore` to avoid copying unnecessary files

* Take care on the grouping of instructions in Dockerfile. For example, group similar RUN instructions to save time during the building

* Take care on the order of instructions. Place at the end instructions like copying app files to do not build whole image again during updates

* Scan images on vulnerabilities

* Use linter to keep the instructions in Dockerfiles clean and follow best practices

## Linter

I used [https://github.com/hadolint/hadolint](hadolint) linter
