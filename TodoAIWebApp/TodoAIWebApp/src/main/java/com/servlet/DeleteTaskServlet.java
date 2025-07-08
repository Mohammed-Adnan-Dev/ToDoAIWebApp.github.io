package com.servlet;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TaskDAO;
import com.model.Task;
import com.model.User;

@WebServlet("/deleteTask")
public class DeleteTaskServlet extends HttpServlet {
    private TaskDAO taskDAO;

    public void init() {
        taskDAO = new TaskDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        taskDAO.deleteTask(taskId);

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        List<Task> updatedTasks = taskDAO.getTasksByUserId(currentUser.getId());
        session.setAttribute("taskList", updatedTasks);

        response.sendRedirect("todo");
    }
}
