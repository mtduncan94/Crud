package com.raceassistant.RaceAssistant.user;

public interface UserService {
	void save(User user);

	User findByName(String username);
}