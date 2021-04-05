package banjjok_Hotel.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import banjjok_Hotel.domain.LoginDTO;

@Repository
public interface LoginMapper {
	List<LoginDTO> getUsers(LoginDTO dto) throws Exception;

}
