package com.example.app_java.service.impl;

import com.example.app_java.model.Visit;
import com.example.app_java.service.TimeService;
import com.example.app_java.util.TimeConstants;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TimeServiceImpl implements TimeService {

    private final ObjectMapper objectMapper;

    private final DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern(TimeConstants.TIME_FORMAT);

    @Override
    public String moscowTime() {
        var zone = ZoneId.of(TimeConstants.MOSCOW_TIMEZONE);
        var time = LocalTime.now(zone);
        return time.format(timeFormat);
    }

    @Override
    @SneakyThrows
    public void logVisits() {
        File logFile = new File("visits.json");
        if (!logFile.exists()) {
            logFile.createNewFile();
        }
        List<String> records = objectMapper.readValue(logFile, Visit.class).getRecords();
        records.add("Moscow time: " + moscowTime());
        objectMapper.writeValue(logFile, new Visit(records));
    }

    @Override
    @SneakyThrows
    public List<String> getVisits() {
        File logFile = new File("visits.json");
        return objectMapper.readValue(logFile, Visit.class).getRecords();
    }
}
