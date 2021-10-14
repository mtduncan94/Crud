package com.raceassistant.RaceAssistant.entity;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "race")
@Entity
public class RaceDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", nullable = false)
	private Integer ID;
	@Column(name = "racename", nullable = false)
	private String raceName;
	@Column(name = "trackname", nullable = false)
	private String trackName;
	@Column(name = "racedate", nullable = false)
	private String raceDate;

	public RaceDetails(Integer ID, String raceName, String trackName, String racedate) {
		this.ID = ID;
		this.raceName = raceName;
		this.trackName = trackName;
		this.raceDate = racedate;
	}

	public RaceDetails() {
	}

	public Integer getID() {
		return ID;
	}

	public String getRaceName() {
		return raceName;
	}

	public String getTrackName() {
		return trackName;
	}

	public String getRaceDate() {
		return raceDate;
	}

	public void setID(int ID) {
		this.ID = ID;
	}

	public void setRaceName(String raceName) {
		this.raceName = raceName;
	}

	public void setTrackName(String trackName) {
		this.trackName = trackName;
	}

	public void setRaceDate(String raceDate) {
		this.raceDate = raceDate;
	}

	@Override
	public int hashCode() {
		int hash = 3;
		return hash;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final RaceDetails other = (RaceDetails) obj;
		if (!Objects.equals(this.raceName, other.raceName)) {
			return false;
		}
		if (!Objects.equals(this.trackName, other.trackName)) {
			return false;
		}
		if (!Objects.equals(this.raceDate, other.raceDate)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "RaceDetails{" + "ID=" + ID + ", raceName=" + raceName + ", trackName=" + trackName + ", raceDate="
				+ raceDate + '}';
	}

}
