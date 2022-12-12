## Best practices
- I'm using status badge so it's noticeable if CI does not pass
- I restrict CI on branches so that it does not run when not necessary
- I cache docker builds so that it builds faster
- Using matrix to test it on different python versions
- Using secrets environments to protect different things separated