package com.klu.prostu.model;


import jakarta.persistence.*;

@Entity
@Table(name = "courses")
public class Course {
	
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name = "id")
   private int id;
	
   public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "course_id",nullable = true,unique = true)
   private int courseId;

   @Column(name = "name", nullable = false, length = 100)
   private String name;

   @Column(name = "description", columnDefinition = "TEXT")
   private String description;

   @Column(name = "teacher_id")
   private Long teacherId; // Stores the teacher's ID as a plain field

   // Getters, setters, and constructors

    public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Long teacherId) {
		this.teacherId = teacherId;
	}

	
}
