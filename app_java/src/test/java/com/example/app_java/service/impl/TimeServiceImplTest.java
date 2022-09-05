package com.example.app_java.service.impl;

import static org.junit.jupiter.api.Assertions.*;

import com.example.app_java.util.TimeConstants;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class TimeServiceImplTest {

    @InjectMocks
    private TimeServiceImpl timeService;

    @Test
    void moscowTime() {
        var beforeTime = LocalTime.now(ZoneId.of(TimeConstants.MOSCOW_TIMEZONE))
            .minusSeconds(1L);
        var moscowTime = LocalTime.parse(timeService.moscowTime(),
                                         DateTimeFormatter.ofPattern(TimeConstants.TIME_FORMAT));
        var afterTime = LocalTime.now(ZoneId.of(TimeConstants.MOSCOW_TIMEZONE))
            .plusSeconds(1L);
        assertTrue(moscowTime.isAfter(beforeTime));
        assertTrue(moscowTime.isBefore(afterTime));
    }
}