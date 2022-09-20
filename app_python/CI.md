## CI best practices and what i applied
tbh that was the first time i made CI after i heard of it so i might not apply all the suitable techniques but i really tried!

1. i used only trusted third-party apps (docker and snyk)
2. didn't install unnecessary dependancies
3. didn't harcode secrets (except my docker hub nickname tho it's not a secret)
4. i used docker cache to speed up pipeline
5. implemented snyk!
6. i put a pretty badge about workflow passing
