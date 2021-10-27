package com.raceassistant.RaceAssistant.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public void save(User user) {
		user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
		user.setPasswordConfirm(new BCryptPasswordEncoder().encode(user.getPasswordConfirm()));
		user.setStatus(true);

		if (user.getRole() == null) {
			user.setRole("USER");
		}

		userRepository.save(user);
	}

	public void loginService(User user) {
		userRepository.save(user);
	}

	@Override
	public User findByName(String username) {
		return userRepository.findByName(username);
	}

	public void changePassword(User user, String newPassword, String confirmNewPassword) {
		String encodedPassword = passwordEncoder.encode(newPassword);
		user.setPassword(encodedPassword);
		user.setPasswordConfirm(passwordEncoder.encode(confirmNewPassword));

		userRepository.save(user);
	}

}
