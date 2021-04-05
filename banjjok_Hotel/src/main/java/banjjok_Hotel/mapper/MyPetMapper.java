package banjjok_Hotel.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import banjjok_Hotel.domain.MyPetDTO;

@Repository
public interface MyPetMapper {

	public Integer insertMyPet(MyPetDTO myPetDTO) throws Exception;
	public List<MyPetDTO> getMyPet(MyPetDTO myPetDTO) throws Exception;
	public Integer updatePet(MyPetDTO petDTO) throws Exception;
	public Integer delete(MyPetDTO dto) throws Exception;

}
