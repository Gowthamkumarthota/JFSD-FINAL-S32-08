package com.klu.prostu.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	  public ResponseEntity<List<Map<String, Object>>> getStudentMarks(HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      Student student = (Student) session.getAttribute("student");

	      if (student == null) {
	          return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // Return 401 Unauthorized if session is expired
	      }

	      // Fetch the studentId from the session
	      int sid = student.getStudentId();

	      // Fetch the marks and courses associated with the student
	      List<Object[]> marksList = studentservice.getStudentMarks(sid);

	      // Convert the data to a list of maps for JSON response
	      List<Map<String, Object>> result = new ArrayList<>();
	      for (Object[] mark : marksList) {
	          Map<String, Object> data = new HashMap<>();
	          data.put("subject", mark[0]); // Assuming the first element is subject
	          data.put("marks", mark[1]);    // Assuming the second element is marks
	          result.add(data);
	      }

	      // Return the data as JSON response
	      return ResponseEntity.ok(result);
	  }
	  
	
/*
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
		*/
	  @GetMapping("StudentAttendance")
	  public ResponseEntity<List<Map<String, Object>>> getStudentAttendance(HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      Student student = (Student) session.getAttribute("student");

	      if (student == null) {
	          return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // Return 401 Unauthorized if session is expired
	      }

	      // Fetch the studentId from the session
	      int sid = student.getStudentId();

	      // Fetch the attendance details associated with the student
	      List<Object[]> attendanceList = studentservice.getStudentAttendance(sid);

	      // Convert the data to a list of maps for JSON response
	      List<Map<String, Object>> result = new ArrayList<>();
	      for (Object[] attendance : attendanceList) {
	          Map<String, Object> data = new HashMap<>();
	          data.put("subject", attendance[0]); // Assuming the first element is subject
	          data.put("attendance", attendance[1]); // Assuming the second element is attendance percentage
	          result.add(data);
	      }

	      // Return the data as JSON response
	      return ResponseEntity.ok(result);
	  }

		/*
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
*/

		
	  @Autowired
	    private JavaMailSender mailSender;
	  
	  

	    @PostMapping("sendemail")
	    public ModelAndView sendEmail(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView("studenthome");

	        HttpSession session = request.getSession();
		      Student student = (Student) session.getAttribute("student");
	        try {
	            // Fetch data from the request
	            String name = request.getParameter("name");
	            String toEmail = request.getParameter("email");
	            String subject = request.getParameter("subject");
	            String message = request.getParameter("message");

	            // Create an OTP
	            int otp = (int) (Math.random() * 100000); // Generates a 5-digit OTP

	            // Create a MIME message
	            MimeMessage mimeMessage = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

	            // Set email details
	            helper.setTo(toEmail);
	            helper.setSubject(subject);
	            helper.setFrom("s2eshwar@gmail.com"); // Replace with your email
	            String htmlContent = "<p>Dear " + name + ",</p>" +
	                    "<p>" + message + "</p>" +
	                   
	                    "<p>Regards,<br>GeniusTrack</p>";
	            helper.setText(htmlContent, true);

	            // Send the email
	            mailSender.send(mimeMessage);

	            mv.addObject("message", "Email sent successfully to " + toEmail);
	        } catch (Exception e) {
	            mv.addObject("message", "Error while sending email: " + e.getMessage());
	            e.printStackTrace();
	        }

	        return mv;
	    }}