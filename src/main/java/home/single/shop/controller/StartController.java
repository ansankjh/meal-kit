package home.single.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StartController {
	
	// 처음화면
	@GetMapping("/start")
	public String start() {
		
		return "start";
	}
}
