package ru.innopolis.devops.app_kotlin

import org.springframework.stereotype.Service

@Service
class HtmlService {
    fun renderHtml(zone: String, time: String) = """
    <html>
        <head>
            <title>$zone time</title>
        </head>
        <body>
            <h3>$zone time is $time</h3>
        </body>
    </html>
    """
}
