package com.klu.prostu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


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
	
	
}
