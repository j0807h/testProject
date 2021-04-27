package banjjok_Hotel.command;

import javax.validation.constraints.NotNull;

public class PetCommand {
	String petId;
	@NotNull(message = "펫 이름을 입력해주세요.")
	String petName;
	Long weight;
	Long age;
	String gender;
	String microNum;
	String petDesc;
	String kind;
	String isNeutral;
	
	public String getPetId() {
		return petId;
	}

	public void setPetId(String petId) {
		this.petId = petId;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public Long getWeight() {
		return weight;
	}

	public void setWeight(Long weight) {
		this.weight = weight;
	}

	public Long getAge() {
		return age;
	}

	public void setAge(Long age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMicroNum() {
		return microNum;
	}

	public void setMicroNum(String microNum) {
		this.microNum = microNum;
	}

	public String getPetDesc() {
		return petDesc;
	}

	public void setPetDesc(String petDesc) {
		this.petDesc = petDesc;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getIsNeutral() {
		return isNeutral;
	}

	public void setIsNeutral(String isNeutral) {
		this.isNeutral = isNeutral;
	}
	
	

}
