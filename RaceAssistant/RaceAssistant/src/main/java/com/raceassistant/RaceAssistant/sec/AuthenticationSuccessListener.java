package com.raceassistant.RaceAssistant.sec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

import com.raceassistant.RaceAssistant.user.User;
import com.raceassistant.RaceAssistant.user.UserService;

@Component
public class AuthenticationSuccessListener implements ApplicationListener<AuthenticationSuccessEvent> {

	@Autowired
	UserService userService;
	
	@Override
	public void onApplicationEvent(AuthenticationSuccessEvent event) {

		User user = userService.findByName(event.getAuthentication().getName());
		user.setFailedLoginAttempts(0);
		userService.loginService(user);
	}
}