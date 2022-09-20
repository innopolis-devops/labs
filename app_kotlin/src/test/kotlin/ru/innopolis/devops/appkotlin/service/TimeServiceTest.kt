package ru.innopolis.devops.appkotlin.service

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

@SpringBootTest
class TimeServiceTest {

    @Autowired
    private lateinit var timeService: TimeService

    @Test
    fun `Header is Moscow test`() {
        val page = timeService.showMoscowTime()
        Assertions.assertTrue(page.contains("Moscow"))
    }

    @Test
    fun `Time changes each second test`() {
        val time1 = timeService.getMoscowTime()
        Thread.sleep(1000L)
        val time2 = timeService.getMoscowTime()

        val dateTime1 = stringToLocalDateTime(time1)
        val dateTime2 = stringToLocalDateTime(time2)

        Assertions.assertTrue(dateTime2.minusSeconds(1) == dateTime1)
    }

    private fun stringToLocalDateTime(time: String) =
        LocalDateTime.parse(time, DateTimeFormatter.ofPattern("HH:mm:ss dd.MM.yyyy"))
}
