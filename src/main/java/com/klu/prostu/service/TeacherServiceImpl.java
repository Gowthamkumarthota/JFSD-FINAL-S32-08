package com.klu.prostu.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.prostu.model.Course;
import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;
import com.klu.prostu.model.Teacher;
import com.klu.prostu.repository.CourseRepository;
import com.klu.prostu.repository.StudentCourseRepository;
import com.klu.prostu.repository.StudentRepository;
import com.klu.prostu.repository.TeacherRepository;

import jakarta.transaction.Transactional;

@Service
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherRepository teacherrepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	 @Autowired
	    private StudentCourseRepository studentCourseRepository;

	    @Autowired
	    private StudentRepository studentRepository;
	    
	@Override
	public Teacher checkteacherlogin(String username, String password) {
		 return teacherrepository.checkteacherlogin(username, password);
	}

	@Override
	public List<Student> getAllStudentsByTeacher(int teacherId) {
	    return studentRepository.findStudentsByTeacherId(teacherId);
	}

	@Transactional
    public void updateStudentCourse(int studentId, int courseId, int attendance, String feedback, int marks) {
        // Update student-course details
        studentCourseRepository.updateStudentCourse(studentId, courseId, attendance, feedback, marks);
    }


	



	
}


