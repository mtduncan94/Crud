package com.raceassistant.RaceAssistant.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;

	@Override
	public void save(User user) {
		user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
		user.setPasswordConfirm(new BCryptPasswordEncoder().encode(user.getPasswordConfirm()));
		user.setStatus(true);
		user.setRole("USER");
		userRepository.save(user);
	}

	@Override
	public User findByName(String username) {
		return userRepository.findByName(username);
	}
}
