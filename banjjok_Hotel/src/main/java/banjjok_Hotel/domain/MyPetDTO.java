package banjjok_Hotel.domain;

public class MyPetDTO {
	// 펫
	String petId;
	String memId;
	String petName;
	String kind;
	Long weight;
	Long age;
	String gender;
	String isNeutral;
	String microNum;
	String petDesc;
	String petRep;	// 대표펫 여부(0: 일반 펫, 1: 대표펫)

	public String getPetId() {
		return petId;
	}

	public void setPetId(String petId) {
		this.petId = petId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
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

	public String getIsNeutral() {
		return isNeutral;
	}

	public void setIsNeutral(String isNeutral) {
		this.isNeutral = isNeutral;
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

	public String getPetRep() {
		return petRep;
	}

	public void setPetRep(String petRep) {
		this.petRep = petRep;
	}
	

}
