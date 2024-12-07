package com.klu.prostu.model;


import jakarta.persistence.*;
import java.time.LocalDate;



@Entity
@Table(name = "teachers")
public class Teacher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "teacher_id")
    private int teacherId;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name="tea_pass",nullable=true,length=50)
    private String password;

    @Column(name = "email", nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "phone", length = 15)
    private String phone;

    @Column(name = "hire_date", nullable = true)
    private LocalDate hireDate;	

    public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// Getters and Setters
    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDate getHireDate() {
        return hireDate;
    }

    public void setHireDate(LocalDate hireDate) {
        this.hireDate = hireDate;
    }

    // toString() for debugging purposes
    @Override
    public String toString() {
        return "Teacher [teacherId=" + teacherId + ", name=" + name + ", email=" + email + ", hireDate=" + hireDate + ", phone=" + phone + "]";
    }

    
}
