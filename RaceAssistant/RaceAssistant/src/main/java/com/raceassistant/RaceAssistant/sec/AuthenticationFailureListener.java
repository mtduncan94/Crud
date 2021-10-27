package com.raceassistant.RaceAssistant.sec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.stereotype.Component;

import com.raceassistant.RaceAssistant.user.User;
import com.raceassistant.RaceAssistant.user.UserService;

@Component
public class AuthenticationFailureListener implements ApplicationListener<AuthenticationFailureBadCredentialsEvent> {

	@Autowired
	UserService userService;

	@Override
	public void onApplicationEvent(AuthenticationFailureBadCredentialsEvent event) {

		User user = userService.findByName(event.getAuthentication().getName());
		if (user != null) {
			user.setFailedLoginAttempts(user.getFailedLoginAttempts() + 1);

			if (user.getFailedLoginAttempts() >= 5) {
				user.setStatus(false);
			}

			userService.loginService(user);
		}
	}

}
