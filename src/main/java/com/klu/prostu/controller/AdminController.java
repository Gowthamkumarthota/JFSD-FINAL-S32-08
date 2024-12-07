package com.klu.prostu.controller;


import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


//import com.bookStore.entity.Book;
import com.klu.prostu.model.Course;
import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;
import com.klu.prostu.model.Teacher;
import com.klu.prostu.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	/*
	
	@PostMapping("insertcourse")
	public String insertcourse(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		String name = request.getParameter("cname");
	      String description = request.getParameter("des");
	      Long teacherId = Long.parseLong(request.getParameter("tid"));
	      int courseid = Integer.parseInt(request.getParameter("cid"));
	      

		Course ct = new Course();
	
		ct.setName(name);
		ct.setTeacherId(teacherId);
		ct.setDescription(description);
		ct.setCourseId(courseid);
		
		String msg = adminService.addcourse(ct);
		redirectAttributes.addFlashAttribute("alertMessage", msg);
		return "adminhome";
	}
	*/
	
	@PostMapping("insertcourse")
	public String insertcourse(@ModelAttribute Course cs) {
		adminService.addcourse(cs);
		return "Courses";
	}


	@PostMapping("/updatecourse")
	public String updatecourse(@ModelAttribute Course course) {
	    int cid = course.getCourseId();  // Get the course ID from the model
	    
	    // Fetch the existing course from the database
	    Course existingCourse = adminService.getCourseById(cid);
	    
	    // If the course doesn't exist, return an error or handle as needed
	    if (existingCourse == null) {
	        return "error";  // Or some error view
	    }

	    // Update the course details
	    existingCourse.setName(course.getName());
	    existingCourse.setDescription(course.getDescription());
	    existingCourse.setTeacherId(course.getTeacherId());

	    // Save the updated course back to the database
	    adminService.updatecourse(existingCourse);

	    // Redirect to the coursesList page to display the updated list
	    return "redirect:/coursesList";  // This will call the GET mapping for coursesList
	}


	
	 @DeleteMapping("/deletecourse/{id}")
	 public String deletecourse(@PathVariable("id") int id) {
		 System.out.println("Deleting course with ID: " + id);  
	     adminService.deletecourseById(id);
	     return "redirect:/coursesList";  // Redirect to the list of courses after deletion
	 }

	
	 @GetMapping("coursesList")
	 public String coursesList(Model model) {
	     List<Course> courses = adminService.getAllCourses(); // Fetch all courses
	     model.addAttribute("courses", courses);  // Rename the attribute to "courses"
	     return "coursesList";  // Name of the JSP page
	 }

/*	
	@PostMapping("inserteacher")
	public String inserteacher(HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    String name = request.getParameter("name");
	    String password = request.getParameter("password");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String hireDateStr = request.getParameter("hireDate");

	    // Convert hireDate from string to LocalDate
	    LocalDate hireDate = LocalDate.parse(hireDateStr);

	    Teacher teacher = new Teacher();
	    
	    teacher.setName(name);
	    teacher.setPassword(password);
	    teacher.setEmail(email);
	    teacher.setPhone(phone);
	    teacher.setHireDate(hireDate);

	    // Assuming adminService has a method addTeacher to save teacher data
	    String msg = adminService.addTeacher(teacher);
	    redirectAttributes.addFlashAttribute("alertMessage", msg);
	    return "teacherModal";
	}
	
*/
	@PostMapping("inserteacher")
	public String addBook(@ModelAttribute Teacher t) {
		adminService.addTeacher(t);
		return "teacherModal";
	}
 
	@PostMapping("/updateteacher")
	public String updateTeacher(@ModelAttribute Teacher teacher, Model model) {
	    // Assuming the teacher ID is included in the form data
	    int tid = teacher.getTeacherId();  // Get the teacher ID from the model
	    
	    // Fetch the existing teacher from the database
	    Teacher existingTeacher = adminService.getBookById(tid);

	    // If the teacher doesn't exist, return an error or handle as needed
	    if (existingTeacher == null) {
	        model.addAttribute("error", "Teacher not found");
	        return "error"; // Or some error view
	    }

	    // Update the teacher's details
	    existingTeacher.setName(teacher.getName());
	    existingTeacher.setEmail(teacher.getEmail());
	    existingTeacher.setPhone(teacher.getPhone());

	    // Save the updated teacher back to the database
	    adminService.updateTeacher(existingTeacher);

	    // Add the updated teacher to the model to pass it to the view
	    model.addAttribute("teacher", existingTeacher);

	    // Return the view name (you can redirect as well if needed)
	    return "redirect:/teacherList";  // Or redirect to a list or details page
	}

	@DeleteMapping("/deleteteacher/{id}")
	public String deleteteacher(@PathVariable("id") int id) {
	    adminService.deleteById(id);
	    return "redirect:/teacherList";  // Make sure this matches the path of your teacher list page
	}

	
    @GetMapping("teacherList")
    public String teacherlist(Model model) {
        List<Teacher> teachers = adminService.getAllTeachers(); // Fetch all teachers
        model.addAttribute("teachers", teachers);
        return "teacherList";  // Name of the JSP page
    }
	/*
	@PostMapping("deleteteacher")
	public String deleteteacher(HttpServletRequest request) {
		int tid = Integer.parseInt(request.getParameter("teacherId"));
		adminService.deleteById(tid);
		return "redirect:/teacherModal";
	}*/
	
	
	/*
	@PostMapping("updateteacher")
	public String updateteacher(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		int tid = Integer.parseInt(request.getParameter("tid"));
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");


	    Teacher teacher = new Teacher();
	    teacher.setTeacherId(tid);
	    teacher.setName(name);
	    teacher.setEmail(email);
	    teacher.setPhone(phone);

	    // Assuming adminService has a method addTeacher to save teacher data
	    String msg = adminService.updateteacher(teacher);
	    redirectAttributes.addFlashAttribute("alertMessage", msg);
	    return "teacherModal";
	}
*/
	



	
	
	/*
	
	@PostMapping("mapthecourse")
	public String mapthecourse(HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    Long tid = Long.parseLong(request.getParameter("tid"));
	    Long sid = Long.parseLong(request.getParameter("student_id"));
	    Long cid = Long.parseLong(request.getParameter("course_id"));

	    StudentCourse sc = new StudentCourse();
	    
		sc.setTid(tid);
		sc.setStudentId(sid);
		sc.setCourseId(cid);

	    // Assuming adminService has a method addTeacher to save teacher data
	    String msg = adminService.mapcourse(sc);
	    redirectAttributes.addFlashAttribute("alertMessage", msg);
	    return "mappingModal";
	}
	
	*/
    
    
	@PostMapping("mapthecourse")
	public String mapthecourse(@ModelAttribute StudentCourse sc) {
		adminService.mapcourse(sc);
		return "mapcourses";
	}

	@PostMapping("/mapupdatecourse")
	public String mapupdatecourse(@ModelAttribute StudentCourse msc, Model model) {
	    int smid = msc.getId(); 
	    StudentCourse mapexistingTeacher = adminService.getmapCourseById(smid);

	    if (mapexistingTeacher == null) {
	        model.addAttribute("error", "Course mapping not found");
	        return "error"; 
	    }

	    mapexistingTeacher.setCourseId(msc.getCourseId());
	    mapexistingTeacher.setTid(msc.getTid());
	    mapexistingTeacher.setStudentId(msc.getStudentId());

	    // Save the updated mapping back to the database
	    adminService.updatemaptcs(mapexistingTeacher);

	    // Add the updated mapping to the model
	    model.addAttribute("maptcs", mapexistingTeacher);

	    // Redirect or show the updated mapping list
	    return "redirect:/maptcsList"; // Redirect back to the list of mapped courses
	}



	
	 @DeleteMapping("/deletemaptcs/{id}")
	 public String deletemaptcs(@PathVariable("id") int id) {
		 System.out.println("Deleting course with ID: " + id);  
	     adminService.deletemaptcsById(id);
	     return "redirect:/maptcsList";  // Redirect to the list of courses after deletion
	 }

	
	 @GetMapping("maptcsList")
	 public String maptcsList(Model model) {
	     List<StudentCourse> courses = adminService.getAllmaptcs(); // Fetch all courses
	     model.addAttribute("maptcses", courses);  // Rename the attribute to "courses"
	     return "maptcsList";  // Name of the JSP page
	 }


}
