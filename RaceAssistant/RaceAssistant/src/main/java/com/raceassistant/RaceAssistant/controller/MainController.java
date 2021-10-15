package com.raceassistant.RaceAssistant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.raceassistant.RaceAssistant.entity.RaceDetails;
import com.raceassistant.RaceAssistant.entity.RaceService;

@Controller
public class MainController {

	private RaceService rs;

	@Autowired
	public MainController(RaceService rs) {
		this.rs = rs;
	}

	// home page controller
	@RequestMapping(value = "/")
	public ModelAndView showRaces(ModelAndView model) {

		List<RaceDetails> listRaces = rs.listAll();
		model.addObject("listRaces", listRaces);
		model.setViewName("index");
		return model;
	}

	// Delete Race Controller
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView deleteRace(HttpServletRequest request) {
		rs.delete(Integer.parseInt(request.getParameter("ID")));
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


	// save controller
	@RequestMapping(value = "/save")
	public ModelAndView saveRace(@ModelAttribute RaceDetails rd) {
		rs.save(rd);
		return new ModelAndView("redirect:/");
	}

	// home controller
	@RequestMapping("/home")
	ModelAndView goHome(ModelAndView model) {
		return new ModelAndView("redirect:/");
	}
}
