package com.adc.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class WebController {

	/**
	 * 메인 페이지
	 * @param req
	 * @param res
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public String mainGet(HttpServletRequest req, HttpServletResponse res, HttpSession session, Model model) {
		String nickName = (String) session.getAttribute("session");
		model.addAttribute("nickName", (nickName != null) ? nickName : "Guest_" + session.getCreationTime());
		return "main";
	}
	
	/**
	 * 메인 로그인 설정
	 * @param req
	 * @param res
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/main", method=RequestMethod.POST)
	public String mainPost(@RequestParam("nickName") String nickName, HttpSession session, Model model) {
		session.setAttribute("nickName", nickName);
		model.addAttribute("nickName", nickName);
		return "main";
	}

	@RequestMapping("/chat/{no}")
	public String chat(@PathVariable("no") String no, HttpSession session, Model model) {
		session.setAttribute("room", no);
		model.addAttribute("no", no);
		return "chat";
	}
}
