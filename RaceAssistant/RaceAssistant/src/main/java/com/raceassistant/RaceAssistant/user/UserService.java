package com.raceassistant.RaceAssistant.user;

public interface UserService {

	void changePassword(User user, String newPassword, String confirmNewPassword);

	void save(User user);

	User findByName(String username);

	void loginService(User user);
}