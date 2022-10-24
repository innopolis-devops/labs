package ru.innopolis.devops.appkotlin.rest

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController
import ru.innopolis.devops.appkotlin.AppKotlinApplication
import ru.innopolis.devops.appkotlin.service.TimeService

@RestController
@RequestMapping("/")
class MoscowTimeController(
    private val service: TimeService
) {

    val logger: Logger = LoggerFactory.getLogger(AppKotlinApplication::class.java)

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    fun index(): String {
        logger.info("request GET `/`")
        val res = service.showMoscowTime()
        logger.info("res = $res")
        return res
    }
}
