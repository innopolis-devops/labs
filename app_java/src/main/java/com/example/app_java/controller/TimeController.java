package com.example.app_java.controller;

import com.example.app_java.service.TimeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class TimeController {

    private final TimeService timeService;

    @GetMapping
    public String moscowTime(Model model) {
        var time = timeService.moscowTime();
        model.addAttribute("moscowTime", time);
        return "index";
    }

}
