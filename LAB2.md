# 2

## Containerization

**To get 6/10**:

1. Create a `Dockerfile` for your application in the `app_python` folder.
2. Build an image and test it, make sure it works!
3. Create a public `docker hub` account if you don't have. Push your image there.
4. Run the image from your account and test it.
5. Create a commit with your changes and push it to your repository.
6. Update README.md in your root folder. Add the `Docker` section that describes your changes.
7. Review PRs of your teammates. Check if it works. Provide your suggestions.

To get **4 more points** you need to make your app production ready:

1. Follow suitable in your case Dockerfile best practices. [The guide with explanation](https://sysdig.com/blog/dockerfile-best-practices/)
2. Create a `DOCKER.md` file and describe all best practices that you applied.
3. Make sure that the docker part in your `README.md` file is clear and contains all required info. You can also check for a better `README.md` template regarding your new changes.
4. Use linter for the `Dockerfile`. Describe in the `DOCKER.md` file which linter did you use.

## Bonus

To get **4 extra points**:

1. Create a `Dockerfile` for the app that you created in the previous lab.
2. Follow all steps and suggestions from the main task.
3. Read about `Docker multi-stage builds`. Implement, if it makes a sense only. If you want to try it anyway you can contact the Professor of Practice.
