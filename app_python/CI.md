# CI Best Practices

1) **Use dependencies for stages**. It should be not possible to push image to docker
hub until lint, test and snyk are succeeded.
2) **Use build cache**
3) **Split CI into different parts** so that it is clearly understandable for what each part
is responsible to.
4) **Add default timeout for workflows**. This will save you from situations 
when the action will be running for hours
