package kr.or.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	@RequestMapping("/ChatHome.do")
	public String showView() {
		return "/WEB-INF/views/chat/ChatHome.jsp";
	}
	
	@RequestMapping("/Chat.do")
	public String showView(String room, Model model) {
		model.addAttribute("room", room);
		return "/WEB-INF/views/chat/Chat.jsp";
	}
}