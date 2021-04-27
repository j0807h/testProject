package banjjok_Hotel.service.petSitter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.domain.PetSitterDTO;
import banjjok_Hotel.mapper.PetSitterMapper;

@Service
@Component
public class PetSitterListService {
	@Autowired
	PetSitterMapper petSitterMapper;
	
	public void sitterList(Model model) throws Exception {
		PetSitterDTO dto = new PetSitterDTO();
//		dto.setSitterUse("1");
		List<PetSitterDTO> list = petSitterMapper.getSitterList(dto);
		model.addAttribute("lists", list);
//		model.addAttribute("list", list.get(0));
		
	}
	
}
