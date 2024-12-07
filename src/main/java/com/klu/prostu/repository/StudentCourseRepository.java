package com.klu.prostu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import com.klu.prostu.model.Course;
import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;

import jakarta.transaction.Transactional;

@Repository
public interface StudentCourseRepository extends JpaRepository<StudentCourse, Integer> {

    // Fetch StudentCourse mapping by teacherId (tid)
	 @Query("SELECT sc FROM StudentCourse sc WHERE sc.tid = :teacherId")
	    List<StudentCourse> findByTeacherId(Long teacherId);

	 @Modifying
	    @Transactional
	    @Query("UPDATE StudentCourse sc " +
	           "SET sc.attendancePercentage = :attendance, sc.feedback = :feedback, sc.marks = :marks " +
	           "WHERE sc.studentId = :studentId AND sc.courseId = :courseId")
	    void updateStudentCourse(@Param("studentId") int studentId,
	                             @Param("courseId") int courseId,
	                             @Param("attendance") int attendance,
	                             @Param("feedback") String feedback,
	                             @Param("marks") int marks);

	 
	 @Query("SELECT c.name AS course_name, sc.marks FROM StudentCourse sc JOIN Course c ON sc.courseId = c.courseId WHERE sc.studentId = ?1")
	 List<Object[]> findStudentMarksByStudentId(int sid);

	 @Query("SELECT c.name AS course_name, sc.attendancePercentage FROM StudentCourse sc JOIN Course c ON sc.courseId = c.courseId WHERE sc.studentId = ?1")
	 List<Object[]> findStudentAttendanceByStudentId(int sid);

	
}
