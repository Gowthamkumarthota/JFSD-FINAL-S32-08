package com.klu.prostu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klu.prostu.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin,Integer>{

	 @Query("SELECT s FROM Admin s WHERE s.email = ?1 AND s.password = ?2")
	Admin checksuperadmin(String username, String password);

}


