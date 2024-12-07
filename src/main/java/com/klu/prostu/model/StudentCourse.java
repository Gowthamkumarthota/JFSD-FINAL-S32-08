package com.klu.prostu.model;



import jakarta.persistence.*;

@Entity
@Table(name = "student_course")
public class StudentCourse {

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

	@Column(name="tid")
    private Long tid;

    @Column(name = "student_id", nullable = false)
    private Long studentId; // Stores the student's ID as a plain field

    public Long getTid() {
		return tid;
	}

	public void setTid(Long tid) {
		this.tid = tid;
	}

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public Integer getAttendancePercentage() {
		return attendancePercentage;
	}

	public void setAttendancePercentage(Integer attendancePercentage) {
		this.attendancePercentage = attendancePercentage;
	}

	public Integer getMarks() {
		return marks;
	}

	public void setMarks(Integer marks) {
		this.marks = marks;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	@Column(name = "course_id", nullable = true)
    private Long courseId; // Stores the course's ID as a plain field

    @Column(name = "attendance_percentage", nullable = true)
    private int attendancePercentage;

    @Column(name = "marks", nullable = true)
    private int marks;

    @Column(name = "feedback", columnDefinition = "TEXT")
    private String feedback;

    
    // Getters, setters, and constructors
}
