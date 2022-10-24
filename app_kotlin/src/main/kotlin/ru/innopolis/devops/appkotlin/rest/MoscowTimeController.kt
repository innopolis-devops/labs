package ru.innopolis.devops.appkotlin.rest

import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController
import ru.innopolis.devops.appkotlin.service.TimeService
import ru.innopolis.devops.appkotlin.startTime

@RestController
@RequestMapping("/")
class MoscowTimeController(
    private val service: TimeService
) {

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    fun index(): String {
        println("request GET `/`")
        val res = service.showMoscowTime()
        println("res = $res")
        return res
    }

    @GetMapping("/metrics")
    @ResponseStatus(HttpStatus.OK)
    fun metrics(): String {
        println("request GET `/metrics`")
        val res = System.currentTimeMillis() - startTime
        println("res = $res")
        return res.toString()
    }
}
