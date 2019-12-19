package kr.or.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	@RequestMapping("/Chat.do")
	public String showView() {
		return "/WEB-INF/views/chat/Chat.jsp";
	}
}