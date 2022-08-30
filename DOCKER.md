# Docker best practices I used

## `root` = bad

I am not running the `ENTRYPOINT` from `root`.

I created user `floppa` and group `cats` just for that purpose.

## `EXPOSE` = bad

I know I will have to expose a port so that I can use my application.
However, I am doing this with `docker run` command instead of doing it in `Dockerfile`.

## `cd` is confusing

Instead of using `cd` in `Dockerfile`, it's better to change the `WORKDIR`.

I didn't have to move between directories, though,
but I would prefer specifying full path to any other directory/file I need.

## Build context

I _despise_ the `..` thing in any paths. 

Instead of going up, and then to some neighbor directory,
I think it's better to go from root directory.

Thus, the build context I went for is the root of the repository.
From there it's easy to access any folder, be it `docker` with everything to build the image,
or `app_python` with the application itself.

If there were some secret settings like passwords to databased,
I would definitely create `.env` file in the root, too.

## `.dockerignore`

This comes from the previous point directly.

When specifying build context, we might add some directories that we don't need.
Even though we won't use them, it'll still take a while to process them.

Therefore, it's better to `.dockerignore` them.

## Caching

If we look at `requirements.txt` and `app_python`,
the former changes much rarely than the latter.
Thus, `requirements.txt` should be handled first in `Dockerfile`.
By doing so, we cache what changes rarely, and speed up the building process.

Technically, users should be handled even earlier,
but these commands are very lightweight and won't severely affect performance.

## Linter

I used a `Docker` plugin for PyCharm. It supports basic error checks, which was enough to build and run the app.

## Problems I faced

The only problem I had was choosing the base image.

I wanted to go for `python:3.10-alpine` because it takes less disk space,
but it failed installation unexpectedly ~~even though it used to work with my other project.~~

Switching to just `python:3.10` and writing command options more explicitly solved all issues.
