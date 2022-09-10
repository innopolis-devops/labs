package com.app.kotlin.service

import java.time.Instant
import java.time.ZoneOffset
import java.time.format.DateTimeFormatter

class GetTimeService {

    private companion object {
        private val ISO_STANDARD_FORMATTER = DateTimeFormatter.ISO_OFFSET_DATE_TIME
        private const val MOSCOW_TIME_ZONE_OFFSET = 3
    }

    fun getMoscowTime(): String {
        return getTimeWithOffsetHours(MOSCOW_TIME_ZONE_OFFSET)
    }

    private fun getTimeWithOffsetHours(hours: Int): String {
        return Instant.now().atOffset(ZoneOffset.ofHours(hours)).format(ISO_STANDARD_FORMATTER)
    }
}
