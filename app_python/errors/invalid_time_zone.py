class InvalidTimeZoneError(ValueError):
    def __init__(self, invalid_name: str):
        self.invalid_name = invalid_name

    def __str__(self):
        return f"Invalid IANA time zone name: {self.invalid_name}"
