package org.andrija.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.andrija.entities.Task;
import org.andrija.entities.User;
import org.andrija.repositories.TaskRepository;
import org.andrija.services.TaskService;
import org.andrija.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.config.ResourceNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class TaskController {

    @Autowired
    private TaskService taskService;
    @Autowired
    private UserService userService;
//    @Autowired
//    private TaskRepository taskRepository;

    @GetMapping("/addTask")
    public String taskForm(String email, Model model, HttpSession session) {

        session.setAttribute("email", email);
        model.addAttribute("task", new Task());
        return "views/taskForm";
    }

    @PostMapping("/addTask")
    public String addTask(@Valid Task task, BindingResult bindingResult, HttpSession session) {
        if (bindingResult.hasErrors()) {
            return "views/taskForm";
        }
        String email = (String) session.getAttribute("email");
        taskService.addTask(task, userService.findOne(email));

        return "redirect:/users";
    }

// -----------------------------------------------------------------------------------------
    // using delete mapping, tried to find tasks with their ids, not finished
//    @DeleteMapping("/tasks/{id}")
//    public String deleteTask(@PathVariable(value = "id") Long id) {
//        Task task = taskRepository.findById(id);
//
//        taskRepository.delete(task);
//
//        return "redirect:/users";
//    }

    // second try for finding tasks and deleting them
//    @DeleteMapping("/deleteTask/{user_email}")
//    public String deleteTask(@PathVariable(value = "user_email") String email) {
//        Task task = taskRepository.findTaskByUserEmail(email);
//
//        taskRepository.delete(task);
//
//        return "redirect:/tasks";
//    }

    // third try
//    @DeleteMapping("/deleteTask/{description}")
//    public String deleteTaskByName(@PathVariable(value = "description") String description) {
//        Task task = taskRepository.findByDescription(description);
//
//        taskRepository.delete(task);
//
//        return "views/tasks";
//    }
// -----------------------------------------------------------------------------------------

    @GetMapping("/tasks")
    public String listTasks(Model model, @RequestParam(defaultValue = "") String description) {
        model.addAttribute("tasks", taskService.findAllTasks(description));
        return "views/tasks";
    }
}
