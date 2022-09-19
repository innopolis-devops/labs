# Best practices applied:

1. **Commit early, commit often.**
2. **Keep the builds green.** By building the solution and running a set of
automated tests each time a change is committed, a CI/CD pipeline
provides rapid feedback to developers about their changes.
3. **Build only once.** A common misstep is to create a new build for each stage. Rebuilding the software for different environments risks
inconsistencies being introduced and means you cannot be confident that all previous tests have passed. Instead, the
same build artifact should be promoted through each stage of the CI/CD pipeline and ultimately released to live.
4. **Clean your environments.**
5. **Monitor and measure your pipeline.** Alert about troubles with CI.
6. Include Snyk for automatic vulnerability checking.

sources: https://www.jetbrains.com/teamcity/ci-cd-guide/ci-cd-best-practices/
