class MockRedis:
    def __init__(self):
        self.data = dict()

    async def get(self, key: str) -> str | None:
        return self.data.get(key)

    async def incr(self, key: str) -> None:
        self.data[key] = self.data.get(key, 0) + 1
