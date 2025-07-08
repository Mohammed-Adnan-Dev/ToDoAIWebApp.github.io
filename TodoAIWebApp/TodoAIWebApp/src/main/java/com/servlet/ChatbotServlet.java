package com.servlet;

import com.dao.TaskDAO;
import com.model.Task;
import com.model.User;
import com.service.GeminiService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;

@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {
    private GeminiService aiService;
    private TaskDAO taskDAO;

    @Override
    public void init() throws ServletException {
        aiService = new GeminiService();
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userInput = request.getParameter("userInput");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if ("add".equals(action)) {
            // Parse the input for number of tasks
            String[] words = userInput.toLowerCase().split("\\s+");
            int count = 1;
            String taskText = userInput;

            // Try to find a number in the input
            for (int i = 0; i < words.length; i++) {
                try {
                    count = Integer.parseInt(words[i]);
                    // Join the rest of the words as the task text
                    taskText = String.join(" ", Arrays.copyOfRange(words, i + 1, words.length));
                    break;
                } catch (NumberFormatException e) {
                    continue;
                }
            }

            // Add the task multiple times
            for (int i = 0; i < count; i++) {
    Task task = new Task();
    task.setTask(taskText);
    task.setUserId(user.getId());
    task.setCreatedAt(LocalDateTime.now()); // Set current date/time
    taskDAO.saveTask(task);
}

            response.sendRedirect("todo");
        } else {
            // Handle AI suggestion as before
            String aiAnswer = aiService.getSuggestedTask(userInput);
            request.setAttribute("question", userInput);
            request.setAttribute("aiAnswer", aiAnswer);
            request.getRequestDispatcher("ChatbotResponse.jsp").forward(request, response);
        }
    }
}