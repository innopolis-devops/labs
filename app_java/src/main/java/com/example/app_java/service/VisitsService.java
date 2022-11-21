package com.example.app_java.service;

import com.example.app_java.model.Visits;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;

@Service
public class VisitsService {
    private final ObjectMapper objectMapper = new ObjectMapper();

    public void appendVisit(String time) throws IOException {
        File file = new File("visits.json");
        Visits visits;
        if (file.createNewFile()) {
            visits = new Visits();
        } else {
            visits = objectMapper.readValue(file, Visits.class);
        }
        visits.getVisits().add(time);
        objectMapper.writeValue(file, visits);
    }

    public Visits readVisits() throws IOException {
        File file = new File("visits.json");
        Visits visits;
        if (file.createNewFile()) {
            visits = new Visits();
        } else {
            visits = objectMapper.readValue(file, Visits.class);
        }
        return visits;
    }
}
