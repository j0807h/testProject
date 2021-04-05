package banjjok_Hotel.mapper;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import banjjok_Hotel.domain.RoomDTO;

@Repository
@Component
public interface RoomMapper {

	public Integer insertRoom(RoomDTO dto) throws Exception;

	public List<RoomDTO> getRoomList(RoomDTO dto) throws Exception;

	public Integer updateRoom(RoomDTO dto) throws Exception;

	public Integer roomDel(RoomDTO dto) throws Exception;

	public String createCode();

//	public String createRoomCode(RoomDTO dto) throws Exception;

}
