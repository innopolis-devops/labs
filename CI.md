# CI Best Practices

___

- Use lib actions
- Do multiple actions for parallelism if pissible (not for dart since tests does not compile during docker build for some reason)
- Run actions only if there are changes in corresponding folder
