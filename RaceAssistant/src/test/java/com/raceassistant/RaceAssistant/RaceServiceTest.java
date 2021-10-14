package com.raceassistant.RaceAssistant;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.raceassistant.RaceAssistant.entity.RaceDetails;
import com.raceassistant.RaceAssistant.entity.RaceService;

class RaceServiceTest {
	
	@Autowired
	DataSource ds;

}
