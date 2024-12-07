package com.klu.prostu.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import  com.klu.prostu.model.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course,Integer>{
	Course findByCourseId(int courseId);
	
	@Query("SELECT c.name, c.description FROM Course c	WHERE c.teacherId = ?1")
	public Course work(Long id);
	

}
