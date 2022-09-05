package controller;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.json.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@RestController
public class HelloController {

    public Double getConvertFromUSD(String url, String to) throws IOException {
        HttpClient client = new DefaultHttpClient();
        HttpGet request = new HttpGet(url);
        HttpResponse response = client.execute(request);

        String json = "";
        BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
        String line = "";
        while ((line = rd.readLine()) != null) {
            json += line;
        }
        JSONObject object = new JSONObject(json);
        return object.getJSONObject("rates").getJSONObject(to).getDouble("rate");
    }

    public String getCurrencyListRequest() throws IOException {
        String apiKey = "api_key=1da08dc09ff99d41a15402978e940ae7531c8484";
        String to1 = "RUB";
        String to2 = "KZT";
        String to3 = "JPY";

        Double rub = getConvertFromUSD("https://api.getgeoapi.com/v2/currency/convert" + "?" + apiKey + "&from=USD" + "&" + "to=" + to1 + "&amount=1&format=json", to1);
        Double kzt = getConvertFromUSD("https://api.getgeoapi.com/v2/currency/convert" + "?" + apiKey + "&from=USD" + "&" + "to=" + to2 + "&amount=1&format=json", to2);
        Double jpy = getConvertFromUSD("https://api.getgeoapi.com/v2/currency/convert" + "?" + apiKey + "&from=USD" + "&" + "to=" + to3 + "&amount=1&format=json", to3);

        return "RUB - " + rub.toString() + "$<br>" + "KZT - " + kzt.toString() + "$<br>" + "JPY - " + jpy.toString() + "$";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String doSomething() throws IOException {
        return getCurrencyListRequest();
    }
}