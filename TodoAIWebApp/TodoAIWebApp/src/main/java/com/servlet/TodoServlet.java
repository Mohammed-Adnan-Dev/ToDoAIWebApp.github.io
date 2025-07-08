package com.servlet;

import com.dao.TaskDAO;
import com.model.Task;
import com.model.User;



import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/todo")
public class TodoServlet extends HttpServlet {

    private TaskDAO taskDAO;

    @Override
    public void init() throws ServletException {
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleTaskList(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        if ("/todo".equals(servletPath)) {
            handleAddTask(request, response);
        } else if ("/deleteTask".equals(servletPath)) {
            handleDeleteTask(request, response);
        }
    }

    private void handleAddTask(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String taskDescription = request.getParameter("task");
        if (taskDescription != null && !taskDescription.trim().isEmpty()) {
          Task task = new Task();
task.setTask(taskDescription);
task.setUserId(user.getId());
task.setCreatedAt(LocalDateTime.now()); // Set current date/time
taskDAO.saveTask(task);
        }

        response.sendRedirect("todo");
    }

    private void handleDeleteTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String taskIdStr = request.getParameter("taskId");
        if (taskIdStr != null) {
            try {
                int taskId = Integer.parseInt(taskIdStr);
                taskDAO.deleteTask(taskId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("todo");
    }

    private void handleTaskList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Task> tasks = taskDAO.getTasksByUserId(user.getId());
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("todolist.jsp").forward(request, response);
    }
}
