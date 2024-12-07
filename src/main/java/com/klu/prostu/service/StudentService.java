package com.klu.prostu.service;

import java.util.List;

import com.klu.prostu.model.Student;

public interface StudentService {

	public String addStudent(Student st) ;
	public Student checkstudentlogin(String sname,String spwd);
	  public List<Object[]> getStudentMarks(int sid);
	public List<Object[]> getStudentAttendance(int sid);
	
}
