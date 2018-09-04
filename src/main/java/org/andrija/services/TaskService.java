package org.andrija.services;

import java.util.List;

import org.andrija.entities.Task;
import org.andrija.entities.User;
import org.andrija.repositories.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaskService {

    @Autowired
    private TaskRepository taskRepository;

    public void addTask(Task task, User user) {
        task.setUser(user);
        taskRepository.save(task);
    }

//    public void deleteTask(Task task) {
//        taskRepository.delete(task);
//    }

    public List<Task> findUserTask(User user) {

        return taskRepository.findByUser(user);
    }

    public List<Task> findAllTasks(String description) {
        return taskRepository.findByDescriptionLike("%" + description + "%");
    }
}
