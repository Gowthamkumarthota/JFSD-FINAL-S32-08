package com.klu.prostu.service;

import java.util.List;

import com.klu.prostu.model.Admin;
import com.klu.prostu.model.Course;
import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;
import com.klu.prostu.model.Teacher;


public interface AdminService {

	Admin checksuperadmin(String username, String password);

	String addcourse(Course ct);

	String addTeacher(Teacher teacher);

	String mapcourse(StudentCourse sc);


	public void updateTeacher(Teacher teacher);

	Teacher getBookById(int id);

	void deleteById(int id);

	List<Teacher> getAllTeachers();

	Course getCourseById(int tid);

	void updatecourse(Course ecs);

	void deletecourseById(int id);

	List<Course> getAllCourses();

	StudentCourse getmapCourseById(int smid);

	void updatemaptcs(StudentCourse mapexistingTeacher);

	void deletemaptcsById(int id);

	List<StudentCourse> getAllmaptcs();

	
	

}
