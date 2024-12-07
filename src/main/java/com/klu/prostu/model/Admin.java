package com.klu.prostu.model;



import jakarta.persistence.*;



@Entity
@Table(name = "adminde")
public class Admin {

  

	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "email", nullable = false, length = 100)
    private String email;
    
    @Column(name="adm_pass",nullable=false,length=50)
    private String password;

	public String getEmail() {
		return email;
	}

	public void setName(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
