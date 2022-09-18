# About CI best practices

I used GitHub Actions as a tool for setting up CI, so here are some best practices I applied to that:

- Set timeouts for workflows.

- Consider which triggers are really needed.

- Never hardcode secrets.

- Limit environment variables to the narrowest possible scope.

- Do not install dependencies unnecessarily (use caching).
