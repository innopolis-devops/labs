package ru.bkmceh.lab1.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.bkmceh.lab1.view.View;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;


@RestController
@RequiredArgsConstructor
public class Controller {
    private static final String TIME_PATTERN = "yyyy/MM/dd HH:mm:ss";

    private final View view;

    @GetMapping
    public String getTime() {
        DateTimeFormatter timeColonFormatter = DateTimeFormatter.ofPattern(TIME_PATTERN);
        return view.getView(timeColonFormatter.format(LocalDateTime.now(ZoneId.of("UTC+3"))));
    }
}
