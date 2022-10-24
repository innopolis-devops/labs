package ru.innopolis.devops.appkotlin.service

import org.springframework.stereotype.Service

@Service
class HtmlRendererService {
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
