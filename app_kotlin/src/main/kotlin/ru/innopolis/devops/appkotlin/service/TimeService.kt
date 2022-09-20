package ru.innopolis.devops.appkotlin.service

import org.springframework.stereotype.Service
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter

@Service
class TimeService(
    private val htmlService: HtmlRendererService
) {
    fun showMoscowTime(): String {
        val zone = "Moscow"
        val time = getMoscowTime()
        return htmlService.renderHtml(zone, time)
    }

    fun getMoscowTime(): String {
        return getTime("Europe/Moscow")
    }

    private fun getTime(zone: String) = LocalDateTime.now(ZoneId.of(zone))
        .format(DateTimeFormatter.ofPattern("HH:mm:ss dd.MM.yyyy"))
}
