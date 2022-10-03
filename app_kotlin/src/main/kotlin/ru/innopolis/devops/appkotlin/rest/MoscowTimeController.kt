package ru.innopolis.devops.appkotlin.rest

import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController
import ru.innopolis.devops.appkotlin.service.TimeService

@RestController
@RequestMapping("/")
class MoscowTimeController(
    private val service: TimeService
) {

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    fun index() = service.showMoscowTime()
}
