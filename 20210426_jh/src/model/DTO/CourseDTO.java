package model.DTO;

public class CourseDTO {
	String id;
	String name;
	Integer credit;
	String lecturer;
	Integer week;
	Integer StartHour;
	Integer endHour;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCredit() {
		return credit;
	}
	public void setCredit(Integer credit) {
		this.credit = credit;
	}
	public String getLecturer() {
		return lecturer;
	}
	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}
	public Integer getWeek() {
		return week;
	}
	public void setWeek(Integer week) {
		this.week = week;
	}
	public Integer getStartHour() {
		return StartHour;
	}
	public void setStartHour(Integer startHour) {
		StartHour = startHour;
	}
	public Integer getEndHour() {
		return endHour;
	}
	public void setEndHour(Integer endHour) {
		this.endHour = endHour;
	}
	
	
	
}
