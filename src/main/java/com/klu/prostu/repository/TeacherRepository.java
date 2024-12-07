package com.klu.prostu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klu.prostu.model.Teacher;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher,Integer>{

	 @Query("SELECT s FROM Teacher s WHERE s.email = ?1 AND s.password = ?2")
	Teacher checkteacherlogin(String username, String password);
}