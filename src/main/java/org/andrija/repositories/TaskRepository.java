package org.andrija.repositories;

import java.util.List;

import org.andrija.entities.Task;
import org.andrija.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<Task, Long> {

    List<Task> findByUser(User user);

    List<Task> findByDescriptionLike(String description);

//    Task findByDescription(String description);

//    Task findTaskByUserEmail(String email);

    void delete(Task task);
}
