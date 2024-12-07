package com.klu.prostu.service;

import java.util.List;
import java.util.Optional;

import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;

public interface StudentService {

	public String addStudent(Student st) ;
	public Student checkstudentlogin(String sname,String spwd);
	  public List<Object[]> getStudentMarks(int sid);
	public List<Object[]> getStudentAttendance(int sid);
	public Optional<Student>  findByStudentId(int studentId);
	public  int getTotalStudentsByTeacherId(Long tid) ;
	
}
