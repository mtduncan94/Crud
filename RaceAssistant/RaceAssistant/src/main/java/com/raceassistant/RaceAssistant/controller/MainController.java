package com.raceassistant.RaceAssistant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.raceassistant.RaceAssistant.entity.RaceDetails;
import com.raceassistant.RaceAssistant.entity.RaceService;
import com.raceassistant.RaceAssistant.user.PasswordChangeValidation;
import com.raceassistant.RaceAssistant.user.User;
import com.raceassistant.RaceAssistant.user.UserService;
import com.raceassistant.RaceAssistant.user.UserValidator;

@Controller
public class MainController {

	private RaceService rs;

	@Autowired
	private UserService userService;
	@Autowired
	private UserValidator userValidator;

	@Autowired
	public MainController(RaceService rs) {
		this.rs = rs;
	}

	// home page controller
	@RequestMapping(value = "/")
	public ModelAndView userView(ModelAndView model) {

		List<RaceDetails> listRaces = rs.listAll();
		model.addObject("listRaces", listRaces);
		model.setViewName("index");
		return model;
	}

	// Delete Race Controller
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView deleteRace(HttpServletRequest request, RedirectAttributes ra) {
		rs.delete(Integer.parseInt(request.getParameter("ID")));
		ra.addFlashAttribute("message", "Race Successfully Deleted");
		return new ModelAndView("redirect:/");
	}

	// edit
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	ModelAndView editRace(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("ID"));
		RaceDetails rd = rs.get(id);
		ModelAndView model = new ModelAndView("RaceForm");
		model.addObject("rd", rd);
		return model;
	}

	// get by id
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public ModelAndView get(HttpServletRequest request, ModelAndView model) throws IOException {

		int id = Integer.parseInt(request.getParameter("ID"));
		RaceDetails rd = rs.get(Integer.parseInt(request.getParameter("ID")));
		model.addObject("rd", rd);
		model.setViewName("DetailView");
		return model;
	}

	// login
	@RequestMapping("/login")
	public String login() {
		return "Login";
	}

	// add controller
	@RequestMapping(value = "/add")
	public ModelAndView addRace(@ModelAttribute RaceDetails rd, RedirectAttributes ra) {
		rs.save(rd);
		ra.addFlashAttribute("message", "Race Successfully Added");
		return new ModelAndView("redirect:/");
	}

	// save controller
	@RequestMapping(value = "/save")
	public ModelAndView saveRace(@ModelAttribute RaceDetails rd, RedirectAttributes ra) {
		rs.save(rd);
		ra.addFlashAttribute("message", "Race Successfully Edited");
		return new ModelAndView("redirect:/");
	}

	// home controller
	@RequestMapping("/home")
	ModelAndView goHome(ModelAndView model) {
		return new ModelAndView("redirect:/");
	}

	// Registration
	@RequestMapping("/register")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@PostMapping("/register")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, RedirectAttributes ra,Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("message", "Registration Unsuccessful, Please Try Again");
			return "registration";
		}

		userService.save(userForm);
		model.addAttribute("message", "Registration Successful, Please Login");
		return "Login";
	}

	// accountdetails view
	@RequestMapping("/accountdetails")
	public String seeAccountDetails() {
		return "accountdetails";
	}

	// Change Password

	@RequestMapping("/passwordchange")
	public ModelAndView changePassword(ModelAndView model) {
		model.setViewName("passwordchange");
		return model;
	}

	@PostMapping("/passwordchange")
	public String changePassword(HttpServletRequest request, Model model, RedirectAttributes ra) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findByName(authentication.getName());

		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		PasswordEncoder pe = new BCryptPasswordEncoder();

		if (oldPassword.equals(newPassword)) {
			model.addAttribute("message", "New Password Must Be Different Than Old Password");

			return "passwordchange";
		}

		if (!pe.matches(oldPassword, user.getPassword())) {
			model.addAttribute("message", "Old Password Is Invalid");
			return "passwordchange";

		}

		userService.changePassword(user, request.getParameter("newPassword"), request.getParameter("passwordConfirm"));
		ra.addFlashAttribute("message", "Password Successfully Changed");
		return "redirect:/accountdetails";
	}

}
