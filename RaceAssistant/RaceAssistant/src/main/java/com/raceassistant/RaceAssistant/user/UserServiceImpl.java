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
	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@Override
	public void save(User user) {
		user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
		user.setStatus(true);
		user.setFile(user.getFile());
		if (user.getRole() == null) {
			user.setRole("USER");
		}

		userRepository.save(user);
	}

	@Override
	public void loginService(User user) {
		userRepository.save(user);
	}

	@Override
	public User findByName(String username) {
		return userRepository.findByName(username);
	}

	@Override
	public void changePassword(User user, String newPassword) {
		String encodedPassword = passwordEncoder.encode(newPassword);
		user.setPassword(encodedPassword);

		userRepository.save(user);
	}

}
