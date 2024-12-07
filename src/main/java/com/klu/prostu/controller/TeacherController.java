package com.klu.prostu.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klu.prostu.model.Course;
import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;
import com.klu.prostu.model.Teacher;
import com.klu.prostu.repository.StudentCourseRepository;
import com.klu.prostu.service.StudentService;
import com.klu.prostu.service.TeacherService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



@Controller
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	
	
	
	@Autowired
	private StudentCourseRepository studentCourseRepository;
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherController.class);


	  @GetMapping("teacherlogout")
	  public ModelAndView teacherlogout(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    session.removeAttribute("teacher");
	    ModelAndView mv = new ModelAndView("/");
	    return mv;
	  }

	  @GetMapping("studentslistfo")
	  public String studentsListFo(Model model, HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      Teacher teacher = (Teacher) session.getAttribute("teacher");
	      
	      if (teacher == null) {
	          return "redirect:/sessionexpiry"; // Redirect if the session is expired
	      }

	      // Get the teacherId from the session object
	      int teacherId = teacher.getTeacherId();
	      String ttidString = request.getParameter("ttid");
	      
	      // Validate the ttid parameter and handle errors if necessary
	      if (ttidString != null && !ttidString.isEmpty()) {
	          int ttid = Integer.parseInt(ttidString);
	          teacher.setTeacherId(ttid);  // Update teacherId if necessary
	      }
	      
	      // Fetch the list of students associated with this teacher
	      List<Student> students = teacherService.getAllStudentsByTeacher(teacherId);

	      // Add students to the model for JSP rendering
	      model.addAttribute("students", students);

	      return "studentModal"; // The JSP page to display students
	  }
	  
	  @PostMapping("/upload")
	  public ResponseEntity<String> uploadCourseMappingFile(@RequestParam("file") MultipartFile file) {
	      try {
	          if (file.isEmpty()) {
	              return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("No file uploaded");
	          }

	          String fileType = file.getContentType();
	          if (!"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet".equals(fileType) &&
	              !"application/vnd.ms-excel".equals(fileType)) {
	              return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid file type. Please upload an Excel file.");
	          }

	          logger.info("Starting the file upload process...");
	          teacherService.processExcelFile(file);
	          logger.info("File upload and processing completed successfully.");
	          return ResponseEntity.ok("Course mapping data uploaded successfully!");
	      } catch (Exception e) {
	          logger.error("Error reading the file", e);
	          return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error reading the file: " + e.getMessage());
	      }
	  }

	  @Autowired
	    private StudentService studentService;  // Autowire the service

	    @GetMapping("/totalStudents")
	    public ResponseEntity<Integer> getTotalStudents(@RequestParam Long tid) {
	        // Call the method on the instance of StudentService
	        int totalStudents = studentService.getTotalStudentsByTeacherId(tid);
	        return ResponseEntity.ok(totalStudents);
	    }


	}

