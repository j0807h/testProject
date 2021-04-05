package banjjok_Hotel.mapper;

import org.springframework.stereotype.Repository;

import banjjok_Hotel.domain.LoginDTO;

@Repository
public interface CheckIdMapper {

	public LoginDTO checkId(String userId) throws Exception;

}
