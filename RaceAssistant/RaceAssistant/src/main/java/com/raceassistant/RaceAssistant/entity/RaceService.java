package com.raceassistant.RaceAssistant.entity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RaceService {

	private RaceRepository repo;

	@Autowired
	public RaceService(RaceRepository repo) {
		this.repo = repo;
	}

	public List<RaceDetails> listAll() {
		return repo.findAll();
	}

	public void save(RaceDetails rd) {
		repo.save(rd);
	}

	public RaceDetails get(int id) {
		return repo.findById(id).get();
	}

	public void delete(int id) {
		repo.deleteById(id);
	}

}
