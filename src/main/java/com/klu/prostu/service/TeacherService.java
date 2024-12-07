package com.klu.prostu.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.klu.prostu.model.Course;
import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;
import com.klu.prostu.model.Teacher;

public interface TeacherService {

	Teacher checkteacherlogin(String username, String password);

	List<Student> getAllStudentsByTeacher(int teacherId);

	void updateStudentCourse(int studentId, int courseId, int attendance, String feedback, int marks);

	void processExcelFile(MultipartFile file);

	

}
