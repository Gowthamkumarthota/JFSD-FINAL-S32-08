package com.klu.prostu.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.klu.prostu.model.Student;
import com.klu.prostu.model.StudentCourse;
import com.klu.prostu.service.StudentService;


@Controller
public class Home {
	
	@GetMapping("/")
	public ModelAndView getMethodName() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("/mappingModal")
	public ModelAndView Mappingc() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mappingModal");
		return mv;
	}
	
	@GetMapping("/teacherModal")
	public ModelAndView Teachermod() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/teacherModal");
		return mv;
	}
	
	@GetMapping("/updateteacher")
	public ModelAndView teacheredit() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/updateteacher");
		return mv;
	}
	
	@GetMapping("/Courses")
	public ModelAndView Courses() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Courses");
		return mv;
	}
	

	@GetMapping("/updatecourse")
	public ModelAndView updatecoursepage() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/updatecourse");
		return mv;
	}
	@GetMapping("/mapcourses")
	public ModelAndView mapcourses() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mapcourses");
		return mv;
	}
	
	@GetMapping("/updatemaptcs")
	public ModelAndView updatemaptcs() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/updatemaptcs");
		return mv;
	}
	
	@GetMapping("/adminhome")
	public ModelAndView adminhome() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/adminhome");
		return mv;
	}
	
	@GetMapping("/teacher_courses")
	public ModelAndView teacher_courses() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/teacher_courses");
		return mv;
	}
	
	@GetMapping("/teacher_students")
	public ModelAndView teacher_students() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/teacher_students");
		return mv;
	}
	
	@GetMapping("/studentModal")
	public ModelAndView studentModal() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/studentModal");
		return mv;
	}
	
    @Autowired
    private StudentService studentCourseService;

    @GetMapping("/studenthome")
    public String getStudentDashboard(Model model, @SessionAttribute("student") Student student) {
        // Get the student's course data
    	Optional<Student>  studentCourses = studentCourseService.findByStudentId(student.getStudentId());

        model.addAttribute("studentCourses", studentCourses);
        return "studenthome";
    }
    
    @GetMapping("/Contactus")
	public ModelAndView Contactus() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Contactus");
		return mv;
	}
	
}
