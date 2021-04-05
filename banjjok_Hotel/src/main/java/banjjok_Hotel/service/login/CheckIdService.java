package banjjok_Hotel.service.login;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import banjjok_Hotel.domain.LoginDTO;
import banjjok_Hotel.mapper.CheckIdMapper;


@Service
public class CheckIdService {
	@Autowired
	CheckIdMapper checkIdMapper;

	public void isDuplicate(String userId, Model model) throws Exception {
		LoginDTO dto = checkIdMapper.checkId(userId);
		// 중복된 아이디면 1, 사용 가능한 아이디면 0
		Integer result = dto != null ? 1 : 0; 
		model.addAttribute("val", result);
	}
	
}
