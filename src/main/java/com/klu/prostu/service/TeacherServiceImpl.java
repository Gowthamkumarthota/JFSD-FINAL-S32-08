package com.klu.prostu.service;

import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
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

	
	@Override
	public void processExcelFile(MultipartFile file) {
		// TODO Auto-generated method stub
	try (Workbook workbook = WorkbookFactory.create(file.getInputStream())) {
	    Sheet sheet = workbook.getSheetAt(0);
	    for (Row row : sheet) {
	        // Skip the header row
	        if (row.getRowNum() == 0) continue;

	        StudentCourse courseMapping = new StudentCourse();

	        if (row.getCell(0) != null) {
	            courseMapping.setCourseId((long) row.getCell(0).getNumericCellValue());
	        }

	        if (row.getCell(1) != null) {
	            courseMapping.setStudentId((long) row.getCell(1).getNumericCellValue());
	        }

	        if (row.getCell(2) != null) {
	            courseMapping.setTid((long) row.getCell(2).getNumericCellValue());
	        }

	        if (row.getCell(3) != null) {
	            courseMapping.setMarks((int) row.getCell(3).getNumericCellValue());
	        }

	        if (row.getCell(4) != null) {
	            courseMapping.setAttendancePercentage((int) row.getCell(4).getNumericCellValue());
	        }

	        if (row.getCell(5) != null) {
	            courseMapping.setFeedback(row.getCell(5).getStringCellValue());
	        }

	        studentCourseRepository.save(courseMapping);
	    }
	} catch (Exception e) { // Catch general exceptions for now
	    throw new RuntimeException("Error processing Excel file", e);
	}
	}
}




