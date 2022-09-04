package com.example.demo.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class GreetingsController {

    @GetMapping("/hello/{name}")
    public String sayHi(@PathVariable String name) {
        log.info("Received request for name: {}", name);
        return "Hello, " + name;
    }

}
