package com.timeapp.timeapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;

@RestController
public class VisitorsController {

    private static String VISITORS_PATH = "data/visitors.txt";
    private static File VISITORS_FILE = new File(VISITORS_PATH);

    @GetMapping("/")
    public String countVisitors() {
        verifyVisitorsCounterFile();

        int n = extractVisitorsCounter(getVisitorsNumber());
        n += 1;
        return writeVisitorsNumber(n);
    }

    @GetMapping("/visits")
    public String getVisitorsCounter() {
        verifyVisitorsCounterFile();

        return String.valueOf(extractVisitorsCounter(getVisitorsNumber()));
    }


    private void verifyVisitorsCounterFile() {
        if (!VISITORS_FILE.isFile()) {
            try {
                VISITORS_FILE.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private String getVisitorsNumber() {
        try (BufferedReader bis = new BufferedReader(new FileReader(VISITORS_FILE))) {
            return bis.readLine();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    private String writeVisitorsNumber(int n) {
        try(BufferedWriter bos = new BufferedWriter(new FileWriter(VISITORS_FILE))) {
            bos.write(String.valueOf(n));
            return "OK";
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    private int extractVisitorsCounter(String str) {
        int n;
        if (str == null) {
            n = 0;
        } else {
            n = Integer.parseInt(str);
        }
        return n;
    }
}
