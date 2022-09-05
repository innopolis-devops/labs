package com.example.app_java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@Controller
public class TimeController {

    @GetMapping
    public String getMoscowTime(Model model) {
        String time = LocalDateTime.now(ZoneId.of("Europe/Moscow")).format(DateTimeFormatter.ofPattern("HH:mm:ss"));
        model.addAttribute("time", time);
        return "index";
    }

}
