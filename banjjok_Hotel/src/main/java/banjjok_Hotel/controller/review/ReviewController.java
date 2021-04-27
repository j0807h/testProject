package banjjok_Hotel.controller.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("hotel")
public class ReviewController {
	@RequestMapping("reviewList")
	public String reviewList() {
		return "hotel/review/reviewList";
	}
}
