package com.example.app_java.service.impl;

import com.example.app_java.service.TimeService;
import com.example.app_java.util.TimeConstants;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import org.springframework.stereotype.Service;

@Service
public class TimeServiceImpl implements TimeService {

    private final DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern(TimeConstants.TIME_FORMAT);

    @Override
    public String moscowTime() {
        var zone = ZoneId.of(TimeConstants.MOSCOW_TIMEZONE);
        var time = LocalTime.now(zone);
        return time.format(timeFormat);
    }
}
