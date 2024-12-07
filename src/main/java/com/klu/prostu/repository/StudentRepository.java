package com.klu.prostu.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klu.prostu.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {

    @Query("SELECT s FROM Student s WHERE s.email = ?1 AND s.password = ?2")
    Student checkstudentlogin(String semail, String spwd);
    
    @Query("SELECT s FROM Student s WHERE s.studentId IN :studentIds")
    List<Student> findStudentsByIds(@Param("studentIds") List<Long> studentIds);
    
    @Transactional
    @Modifying
    @Query("SELECT s FROM Student s JOIN StudentCourse sc ON s.studentId = sc.studentId WHERE sc.tid = ?1")
    List<Student> findStudentsByTeacherId(int teacherId);


}
