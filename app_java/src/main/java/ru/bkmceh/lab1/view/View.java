package ru.bkmceh.lab1.view;

import org.springframework.stereotype.Component;


@Component
public class View {

    public String getView(final String time) {
        return """
                <body>
                <h2>Hello there, my user</h2>
                <img src="https://media.giphy.com/media/Nx0rz3jtxtEre/giphy.gif" width="250" />
                <h3>By the way, the time in Moscow during the last update was: %s</h3>
                </body>
                """.formatted(time);
    }
}
