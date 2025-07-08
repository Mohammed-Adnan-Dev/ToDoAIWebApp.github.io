package com.todoapp.model;

import javax.persistence.Entity;

import org.hibernate.annotations.Table;

public class User {


@Entity
@Table(name = "users")

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    // Getters and Setters
}
