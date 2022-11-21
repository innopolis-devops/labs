package com.example.app_java.service;

import java.util.List;

public interface TimeService {

    /**
     *
     * @return String with current time in Moscow
     */
    String moscowTime();

    /**
     * logs visit to main endpoint
     */
    void logVisits();

    /**
     *
     * @return list of all logged visits
     */
    List<String> getVisits();

}
