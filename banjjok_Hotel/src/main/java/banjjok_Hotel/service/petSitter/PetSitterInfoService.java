package banjjok_Hotel.service.petSitter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.command.PetSitterCommand;
import banjjok_Hotel.domain.PetSitterDTO;
import banjjok_Hotel.mapper.PetSitterMapper;

@Service
@Component
public class PetSitterInfoService {
	@Autowired
	PetSitterMapper petSitterMapper;

	public void sitterInfo(String sitterId, Model model, PetSitterCommand petSitterCommand) throws Exception {
		PetSitterDTO dto = new PetSitterDTO();
		dto.setSitterId(sitterId);
//		dto.setSitterUse(petSitterCommand.getSitterUse());
//		System.out.println(petSitterCommand.getSitterUse());
		List<PetSitterDTO> list = petSitterMapper.getSitterList(dto);
		model.addAttribute("list", list.get(0));
	}

}
  