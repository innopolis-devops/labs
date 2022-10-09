package com.timeapp.timeapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MonitoringController {

    @GetMapping("/healthcheck")
    public String getHealthcheck() {
        return "OK";
    }
}
