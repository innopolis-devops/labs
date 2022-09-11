# Best practices applied:

### ADD, COPY

ADD is known to transform the file in some cases (if it's a .tar.gz archive, for example), so
COPY is safer to use in general.

### MAINTAINER

I used maintainer command to let people know of my contact information.

Upd: After running linter, I found out that the MAINTAINER command is deprecated, so I substituted it with
`LABEL maintainer` instead

### ENTRYPOINT, CMD

[Source](https://www.youtube.com/watch?v=ZB8JBWriDVo)

We make ENTRYPOINT["/usr/bin/python3", "./hello.py"] launching the main script with all the default parameters.

And then we make CMD with all the different parameters that other people in the team are allowed to experiment with.

As I don't have any other external parameters for my app, I don't have CMD but I have ENTRYPOINT, not CMD which
is considered good practice.

### Layer sanity

For the first version of Dockerfile (I have left it in the form of a comment there) I used
ubuntu and just `apt-get install`'ed python3 and other tools.
Each RUN command creates a new layer so in order to optimize resource usage,
it's best to do RUNs in one command if possible and suitable.
So, I used to do this: `RUN apt-get update && apt-get install -y python3-pip` instead of
this:
`RUN apt-get update` and then
`RUN apt-get install -y python3-pip`

### Use trusted base images

Building on top of untrusted or unmaintained images will inherit all
of the problems and vulnerabilities from that image into your containers.

### Exposed ports

Every opened port in your container is an open door to your system.
Expose only the ports that your application needs and avoid exposing ports like SSH (22).
Also, I used EXPOSE command to indicate the person working with my Dockerfile which port to forward.

### Linting

I used [hadolint](https://github.com/hadolint/hadolint)

When installed, navigate to the root of the project, then run this:
`hadolint Dockerfile`

This is what I got when I first ran the linter: ![img.png](img.png)