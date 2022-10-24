package ru.innopolis.devops.appkotlin

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class AppKotlinApplication

var startTime = System.currentTimeMillis()

@Suppress("SpreadOperator")
fun main(args: Array<String>) {
    runApplication<AppKotlinApplication>(*args)
}
