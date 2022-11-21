package com.example.app_java.controller;

import com.example.app_java.model.Visits;
import com.example.app_java.service.VisitsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@RequiredArgsConstructor
@Controller
public class TimeController {
    private final VisitsService visitsService;

    @GetMapping
    public String getMoscowTime(Model model) throws IOException {
        String time = LocalDateTime.now(ZoneId.of("Europe/Moscow")).format(DateTimeFormatter.ofPattern("HH:mm:ss"));
        visitsService.appendVisit(time);
        model.addAttribute("time", time);
        return "index";
    }

    @GetMapping("/visits")
    @ResponseBody
    public Visits getVisits(Model model) throws IOException {
        return visitsService.readVisits();
    }
}
