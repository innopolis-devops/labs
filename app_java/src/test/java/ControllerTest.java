import org.junit.Before;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import ru.bkmceh.lab1.controller.Controller;
import ru.bkmceh.lab1.view.View;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


public class ControllerTest {

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.standaloneSetup(new Controller(new View())).build();
    }

    @Test
    public void testGetResponse() throws Exception {
        this.mockMvc.perform(get("/"))
                .andExpect(status().isOk());
    }
}
