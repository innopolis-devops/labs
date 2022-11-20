## Applied CI best practices

1) Split the CI into different stages which depend on each other
2) Cache usage to reduce the build time
3) Timeout usage
4) Keeping secrets in github repo securely so that no one can access them
5) vulnerabilities check up before the docker image publishing