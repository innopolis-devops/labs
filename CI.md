# CI best practicies

## 1. Commit early, commit often

It is better to commit more often and earlier
because in that case it is much simpler
to identify and fix bugs than in the
futher stages.

## 2. Make builds fast and simple

Workflows contain only those staps those are
necessary to check and build the application.
They should not take a lot of time.

## 3. Use caches

Use caches in order to save time on builds.

## 4. Build only if it makes sense

Trigger checks and builds only if something
in the app was changed.
