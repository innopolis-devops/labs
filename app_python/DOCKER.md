## Docker Best Practices

______________________________________________________________________

- **Use Multi-stage Builds**. Breaking up Dockerfile into
  several stages make images leaner and more secure.(*Can't be used
  by me right now, since image is small*)
- **Order Dockerfile Commands Appropriately**. Pay close attention to the
  order of your Dockerfile commands to leverage layer caching. It can
  help to speed up subsequent builds.
- **Use Small Docker Base Images**. Building,pushing and pulling faster.
- **Minimize the Number of Layers**. Combine some similar commands
  such as ADD, RUN or COPY to one layer. F.e:

```
RUN apt-get update
RUN apt-get install -y netcat

|
V

RUN apt-get update && apt-get install -y netcat
```

- **Prefer COPY Over ADD**.
- **Prefer Array Over String Syntax**. F.e.:

```
# array (exec)
CMD ["flask", "run"]

# string (shell)
CMD "flask run"
```

### Linter for Dockerfile

______________________________________________________________________

[Hadolint](https://github.com/hadolint/hadolint) linter was used for Dockerfile

**Reasons to use it:**

- Good repo with understandable documentation
- Easy to use:

```
hadolint <Dockerfile>
```

- You can ignore some rules:

```
hadolint --ignore DL3003 --ignore DL3006 <Dockerfile> # exclude specific rules
```
