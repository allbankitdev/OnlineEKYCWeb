/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author vgponciano
 */
public class google {

    public static final String SITE_VERIFY_URL
            = //
            "https://www.google.com/recaptcha/api/siteverify";

    public static boolean verify(String gRecaptchaResponse) {
        boolean success = false;//jsonObject.getBoolean("success");
        if (gRecaptchaResponse == null || gRecaptchaResponse.length() == 0) {
            return false;
        }

        try {
            URL verifyUrl = new URL(SITE_VERIFY_URL);

            // Open a Connection to URL above.
            HttpsURLConnection conn = (HttpsURLConnection) verifyUrl.openConnection();

            // Add the Header informations to the Request to prepare send to the server.
            conn.setRequestMethod("POST");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            conn.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

            // Data will be sent to the server.
            String postParams = "secret=" + MyConstant.SECRET_KEY //
                    + "&response=" + gRecaptchaResponse;

            // Send Request
            conn.setDoOutput(true);

            // Get the output stream of Connection.
            // Write data in this stream, which means to send data to Server.
            OutputStream outStream = conn.getOutputStream();
            outStream.write(postParams.getBytes());

            outStream.flush();
            outStream.close();

            // Response code return from Server.
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode=" + responseCode);

            // Read XML
            InputStream inputStream = conn.getInputStream();
            byte[] res = new byte[2048];
            int i = 0;
            StringBuilder responseFromAPI = new StringBuilder();
            while ((i = inputStream.read(res)) != -1) {
                responseFromAPI.append(new String(res, 0, i));
            }
            inputStream.close();
            System.out.println("responseFromAPI : " + responseFromAPI);

            String string = responseFromAPI.toString();
            JSONObject json = new JSONObject(string);
            System.out.println(json.toString());
            success = json.getBoolean("success");
            System.out.println(success);
//
//            JSONObject json = new JSONObject(responseFromAPI);
//
//            success = json.getBoolean("success");
//
//            System.out.println("success : " + success);
//            

//            // Get the Input Stream of Connection to read data sent from the Server.
//            InputStream is = conn.getInputStream();
//
//            JsonReader jsonReader = Json.createReader(is);
//            JsonObject jsonObject = jsonReader.readObject();
//            jsonReader.close();
//
//            // ==> {"success": true}
//            System.out.println("Response: " + jsonObject);
//
//            boolean success = jsonObject.getBoolean("success");
            return success;
        } catch (Exception e) {
            e.printStackTrace();
            return false;

        }
    }
}
