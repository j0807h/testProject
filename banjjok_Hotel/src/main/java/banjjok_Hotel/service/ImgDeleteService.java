package banjjok_Hotel.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ImgDeleteService {

	public void imgDel(String imgFile, Model model, HttpSession session) {
		List<String> list = (List<String>) session.getAttribute("imgList");
		if(list == null) {
			list = new ArrayList<String>();
		}
		Integer num = 0;
		Boolean newFile = true;
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).equals(imgFile))
			// 이름이 같으면 삭제 취소
			list.remove(i);
			newFile = false;
			num = 0;
		}
		if(newFile) {
			list.add(imgFile);
			session.setAttribute("imgList", list);
			num = 1;
		}
		model.addAttribute("val", num);
	}

}