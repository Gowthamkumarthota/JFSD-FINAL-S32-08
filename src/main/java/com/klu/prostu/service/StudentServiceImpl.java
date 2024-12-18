package com.klu.prostu.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;
import com.klu.prostu.repository.StudentCourseRepository;
import com.klu.prostu.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentRepository;
    
    @Autowired
    private StudentCourseRepository screpo;

    @Override
    public String addStudent(Student st) {
        studentRepository.save(st);
        return "successfully added";
    }

    @Override
    public Student checkstudentlogin(String semail, String spwd) {
        return studentRepository.checkstudentlogin(semail, spwd);
    }

    @Override
    public List<Object[]> getStudentMarks(int sid) {
        return	 screpo.findStudentMarksByStudentId(sid);
    }

	@Override
	public List<Object[]> getStudentAttendance(int sid) {
		return screpo.findStudentAttendanceByStudentId(sid);
	}

	@Override
	public Optional<Student> findByStudentId(int studentId) {
		// TODO Auto-generated method stub
		return studentRepository.findById(studentId);
	}

	@Override
	public int getTotalStudentsByTeacherId(Long tid) {
		return screpo.countDistinctStudentsByTeacherId(tid);
	}

}
