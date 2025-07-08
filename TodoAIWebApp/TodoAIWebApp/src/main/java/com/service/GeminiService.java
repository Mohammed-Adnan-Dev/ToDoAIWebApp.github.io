package com.service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class GeminiService {

    private static final String API_URL = "https://openrouter.ai/api/v1/chat/completions";
    private static final String API_KEY ="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";

    public String getSuggestedTask(String userMessage) {
        try {
            URL url = new URL(API_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Authorization", "Bearer " + API_KEY);
            conn.setDoOutput(true);

            // Construct the JSON request body using Gson
            JsonObject requestBody = new JsonObject();
            requestBody.addProperty("model", "mistralai/mistral-7b-instruct:free");

            JsonArray messages = new JsonArray();
            JsonObject userObj = new JsonObject();
            userObj.addProperty("role", "user");
            userObj.addProperty("content", userMessage);
            messages.add(userObj);

            requestBody.add("messages", messages);

            // Send JSON request
            try (OutputStream os = conn.getOutputStream()) {
                os.write(requestBody.toString().getBytes("UTF-8"));
            }

            int responseCode = conn.getResponseCode();
            InputStream inputStream = (responseCode == 200)
                    ? conn.getInputStream()
                    : conn.getErrorStream();

            StringBuilder response = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
            }

            // Debug response
            System.out.println("Response Code: " + responseCode);
            System.out.println("OpenRouter Response: " + response);

            if (responseCode != 200) {
                return "Error fetching suggestion: " + response.toString();
            }

            // Parse the AI response
            JsonObject responseJson = JsonParser.parseString(response.toString()).getAsJsonObject();
            JsonArray choices = responseJson.getAsJsonArray("choices");
            JsonObject message = choices.get(0).getAsJsonObject().getAsJsonObject("message");
            String aiMessage = message.get("content").getAsString();

            return aiMessage.trim();

        } catch (Exception e) {
            e.printStackTrace();
            return "Error fetching suggestion.";
        }
    }
}
