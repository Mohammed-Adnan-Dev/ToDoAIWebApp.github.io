package com.service;

import com.dao.TaskDAO;
import com.model.Task;

import java.util.List;

public class TaskService {
    private TaskDAO taskDAO;

    public TaskService() {
        this.taskDAO = new TaskDAO();
    }

    public void saveTask(String taskDescription, int userId) {
        Task task = new Task();
        task.setTask(taskDescription);
        task.setUserId(userId);
        taskDAO.saveTask(task);
    }

    public List<Task> getTasksByUserId(int userId) {
        return taskDAO.getTasksByUserId(userId);
    }
}
