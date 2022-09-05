package com.timeapp.timeapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.ZoneId;

@RestController
@RequestMapping("/time")
public class TimeController {

    @GetMapping("/now")
    public LocalDateTime getCurrentTime() {
        return LocalDateTime.now(ZoneId.of("Europe/Moscow"));
    }
}
