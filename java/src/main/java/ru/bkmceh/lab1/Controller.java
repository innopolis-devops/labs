package ru.bkmceh.lab1;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;


@RestController
public class Controller {
    private static final String TIME_PATTERN = "HH:mm:ss";

    @GetMapping
    public String getTime() {
        DateTimeFormatter timeColonFormatter = DateTimeFormatter.ofPattern(TIME_PATTERN);
        return wrapTime(timeColonFormatter.format(LocalDateTime.now(ZoneId.of("UTC+3"))));
    }

    private String wrapTime(final String time) {
        return """
                <body>
                <h2>Hello, my user</h2>
                <h3>Time in Moscow: %s</h3>
                </body>
                """.formatted(time);
    }
}
