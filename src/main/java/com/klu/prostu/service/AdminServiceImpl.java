package com.klu.prostu.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.prostu.model.Admin;
import com.klu.prostu.model.Course;
import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;
import com.klu.prostu.model.Teacher;
import com.klu.prostu.repository.AdminRepository;
import com.klu.prostu.repository.CourseRepository;
import com.klu.prostu.repository.StudentCourseRepository;
import com.klu.prostu.repository.StudentRepository;
import com.klu.prostu.repository.TeacherRepository;

import jakarta.transaction.Transactional;

@Service
public class AdminServiceImpl implements AdminService{


	@Autowired
	private AdminRepository adminrepository;
	
	@Autowired
	private CourseRepository courserepository;
	
	@Autowired
	private TeacherRepository teacherrepository;
	
	@Autowired
	private StudentCourseRepository screpo;

	@Override
	public Admin checksuperadmin(String username, String password) {
		return adminrepository.checksuperadmin(username, password);
	}

	@Override
	@Transactional
	public String addcourse(Course ct) {
		courserepository.save(ct);
		return "course added successfully";
	}

	@Override
	public String addTeacher(Teacher teacher) {
		teacherrepository.save(teacher);
		return "teacher added successfully";
	}

	@Override
	public String mapcourse(StudentCourse sc) {
		screpo.save(sc);
		return "mapped successfully";
	}


	

	@Override
	public Teacher getBookById(int tid) {
		return teacherrepository.findById(tid).get();
		
	}

	@Override
	public void updateTeacher(Teacher teacher) {
		teacherrepository.save(teacher);
		
	}

	
	@Override
	public void deleteById(int id) {
		teacherrepository.deleteById(id);
		
	}

	@Override
	public List<Teacher> getAllTeachers() {
		// TODO Auto-generated method stub
		return teacherrepository.findAll();
	}

	@Override
	public Course getCourseById(int courseId) {
	    return courserepository.findByCourseId(courseId);  // Fetch by courseId
	}

	@Override
	public void updatecourse(Course ecs) {
	    courserepository.save(ecs);  // This will handle the update or insert, as needed
	}


	@Override
	public void deletecourseById(int id) {
		System.out.println("Attempting to delete course with ID: " + id); 
		courserepository.delete(courserepository.findByCourseId(id));
		
		
	}

	@Override
	public List<Course> getAllCourses() {
		return courserepository.findAll();
	}

	@Override
	public StudentCourse getmapCourseById(int smid) {
	    Optional<StudentCourse> optionalStudentCourse = screpo.findById(smid);
	    if (optionalStudentCourse.isPresent()) {
	        return optionalStudentCourse.get(); // Extract the value from Optional
	    } else {
	        return null; // Or throw an exception if you prefer
	    }
	}

	@Override
	public void updatemaptcs(StudentCourse mapexistingTeacher) {
		// TODO Auto-generated method stub
		screpo.save(mapexistingTeacher);
	}

	@Override
	public void deletemaptcsById(int id) {
		screpo.deleteById(id);
		
	}

	@Override
	public List<StudentCourse> getAllmaptcs() {
		return screpo.findAll();
	}





}
