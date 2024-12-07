package com.klu.prostu.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klu.prostu.service.AdminService;
import com.klu.prostu.service.StudentService;
import com.klu.prostu.service.StudentServiceImpl;
import com.klu.prostu.service.TeacherService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.klu.prostu.model.Admin;
import com.klu.prostu.model.Student;
import com.klu.prostu.model.Teacher;

import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentservice;
	
	@Autowired
	private AdminService adminservice;
	
	@Autowired
	private TeacherService teacherservice;
	
	
	@PostMapping("insertstudent")
	public String insertstudent(HttpServletRequest request, RedirectAttributes redirectAttributes)
	{
		String name = request.getParameter("sname");
	      String gender = request.getParameter("sgender");
	
	      LocalDate dob = LocalDate.parse(request.getParameter("sdob"));

	      String email = request.getParameter("semail");
	      String password = request.getParameter("spwd");
	      System.out.println(password);
	      String phone = request.getParameter("sphone");
		Student st = new Student();
	
		st.setName(name);
		st.setGender(gender);
		st.setDob(dob);
		st.setEmail(email);
		st.setPassword(password);
		st.setPhone(phone);
		
		
		String msg = studentservice.addStudent(st);
		redirectAttributes.addFlashAttribute("alertMessage", msg);
		return "redirect:/";
	}
	/*
	@PostMapping("checkstudentlogin")
	public ModelAndView checkstudentlogin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    String semail = request.getParameter("semail");
	    String spwd = request.getParameter("spwd");

	    // Call the service method to verify login
	    Student st = studentservice.checkstudentlogin(semail, spwd);

	    if (st != null) {
	        mv.setViewName("studenthome"); // Redirect to studenthome.jsp
	    } else {
	        mv.setViewName("redirect:/"); // Redirect back to the index page
	        mv.addObject("alertMessage", "Invalid credentials. Please try again.");
	    }

	    return mv;
	}
*/
	  @PostMapping("checklogin")
	  public ModelAndView checklogin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    String semail = request.getParameter("semail");
	    String spwd = request.getParameter("spwd");

	    System.out.println(semail + " " + spwd);

	    Admin sa = adminservice.checksuperadmin(semail,spwd);
	    
	    if(sa!=null) { 
	      //HttpSession session = request.getSession();
	      //session.setAttribute("superadmin", sa);
	      mv.setViewName("adminhome"); 
	      return mv; 
	    }
	     

	    Teacher a = teacherservice.checkteacherlogin(semail, spwd);

	    if (a != null) {
	      HttpSession session = request.getSession();
	      session.setAttribute("teacher", a);
	      System.out.println(a.getName());
	      mv.setViewName("/teacherhome");
	      return mv;
	    }

	    Student u = studentservice.checkstudentlogin(semail, spwd);

	    if (u != null) {
	      // session
	      HttpSession session = request.getSession();
	      session.setAttribute("student", u);

	      mv.setViewName("/studenthome");
	      mv.addObject("loginsuccessmessage", "Login Success");
	    } else {
	      mv.setViewName("redirect:/");
	      mv.addObject("loginfailmessage", "Login Failed / User Does Not Exist");
	    }
	    return mv;
	  }



	/*
	@PostMapping("/addStudent")
	public ResponseEntity<String> addStudent(@ModelAttribute Student st) {
	    studentservice.addStudent(st);
	    return ResponseEntity.ok("Student added successfully!");
	}
*/
		  
	  @GetMapping("Studentmakrsof")
	  public String Studentmakrsof(Model model, HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      Student student = (Student) session.getAttribute("student");

	      if (student == null) {
	          return "redirect:/sessionexpiry"; // Redirect if the session is expired
	      }

	      // Fetch the studentId from the session and the ttid from the request parameters
	      int sid = student.getStudentId();

	      // Fetch the marks and courses associated with the student
	      List<Object[]> marksList = studentservice.getStudentMarks(sid);

	      // Add marks list to the model
	      model.addAttribute("marksList", marksList);

	      // Forward to the marks page to display data
	      return "components/marks"; // Directly return the view name, not a redirect
	  }


		@GetMapping("components/marks")
		public ModelAndView getMethodMarks(HttpServletRequest request) {
		    HttpSession session = request.getSession();
		    Student student = (Student) session.getAttribute("student");

		    ModelAndView mv = new ModelAndView();

		    // Check if the student session is null
		    if (student == null) {
		        mv.setViewName("redirect:/login"); // Redirect to login page or session expiry page
		        return mv;
		    }

		    // Add student data to the model
		    mv.addObject("student", student);

		    mv.setViewName("components/marks");  // This will map to the 'marks.jsp' view
		    return mv;
		}
		
		@GetMapping("StudentAttendance")
		public String StudentAttendance(Model model, HttpServletRequest request) {
		    HttpSession session = request.getSession();
		    Student student = (Student) session.getAttribute("student");

		    if (student == null) {
		        return "redirect:/sessionexpiry"; // Redirect if the session is expired
		    }

		    // Fetch the studentId from the session
		    int sid = student.getStudentId();

		    // Fetch the attendance details associated with the student
		    List<Object[]> attendanceList = studentservice.getStudentAttendance(sid);

		    // Add attendance list to the model
		    model.addAttribute("attendanceList", attendanceList);

		    // Forward to the attendance page to display data
		    return "components/attendance"; // Directly return the view name
		}
		
		@GetMapping("components/attendance")
		public ModelAndView getMethodAttendance(HttpServletRequest request) {
		    HttpSession session = request.getSession();
		    Student student = (Student) session.getAttribute("student");

		    ModelAndView mv = new ModelAndView();

		    // Check if the student session is null
		    if (student == null) {
		        mv.setViewName("redirect:/login"); // Redirect to login page or session expiry page
		        return mv;
		    }

		    // Add student data to the model
		    mv.addObject("student", student);

		    mv.setViewName("components/attendance"); // This will map to the 'attendance.jsp' view
		    return mv;
		}


		


}
