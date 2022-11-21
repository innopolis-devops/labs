package com.example.app_java.model;

import lombok.Data;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;

@Getter
public class Visits {
    private List<String> visits;

    public Visits() {
        visits = new ArrayList<>();
    }
}
