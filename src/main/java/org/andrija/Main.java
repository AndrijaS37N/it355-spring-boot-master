package org.andrija;

import org.andrija.entities.User;
import org.andrija.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Main implements CommandLineRunner {
    @Autowired
    private UserService userService;

    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        // admin personnel created below
        // check credentials for usage
        {
            // one admin for testing coming right up
            User newAdmin = new User("admin@gmail.com", "Admin", "andrija");
            userService.createAdmin(newAdmin);
        }
    }
}
