package com.care.timy.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.care.timy.warning.warningService;




@Controller("memberController")
public class MemberControllerImpl   implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO ;
	@Autowired
	private warningService warningService;
	
	@Override
	@RequestMapping(value="/member/listMembers.do" ,method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		//System.out.println(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/warning.do" ,method = RequestMethod.GET)
	public ModelAndView warning(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List membersListEmerg = memberService.warningMember();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersListEmerg", membersListEmerg);
		
		List warningList = warningService.listWarnings();
		mav.addObject("warningList", warningList);
		
		//System.out.println(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/updateMember.do" ,method = RequestMethod.POST)
	public ModelAndView updateMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.updateMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	/* update emerg uerinfo TBL */
	@Override
	@RequestMapping(value="/member/updateWarningMember.do" ,method = RequestMethod.POST)
	public ModelAndView updateEmergMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.updateEmergMember(member);
		ModelAndView mav = new ModelAndView("redirect:/user/user_main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/removeMember.do" ,method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("timySerialNo") String timySerialNo, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(timySerialNo);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/searchMember.do" ,method = RequestMethod.GET)
	public ModelAndView searchMember(@RequestParam("timySerialNo") String timySerialNo, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		MemberVO vo = memberService.searchMember(timySerialNo);
		ModelAndView mav = new ModelAndView("forward:/member/updateForm.do");
		mav.addObject("member",vo);
		return mav;
	}
	
	
	/*@RequestMapping(value = { "/member/loginForm.do", "/member/memberForm.do" }, method =  RequestMethod.GET)*/
	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	

	/*
	 * private String getViewName(HttpServletRequest request) throws Exception {
	 * String contextPath = request.getContextPath(); String uri = (String)
	 * request.getAttribute("javax.servlet.include.request_uri"); if (uri == null ||
	 * uri.trim().equals("")) { uri = request.getRequestURI(); }
	 * 
	 * int begin = 0; if (!((contextPath == null) || ("".equals(contextPath)))) {
	 * begin = contextPath.length(); }
	 * 
	 * int end; if (uri.indexOf(";") != -1) { end = uri.indexOf(";"); } else if
	 * (uri.indexOf("?") != -1) { end = uri.indexOf("?"); } else { end =
	 * uri.length(); }
	 * 
	 * String viewName = uri.substring(begin, end); if (viewName.indexOf(".") != -1)
	 * { viewName = viewName.substring(0, viewName.lastIndexOf(".")); } if
	 * (viewName.lastIndexOf("/") != -1) { viewName =
	 * viewName.substring(viewName.lastIndexOf("/"), viewName.length()); } return
	 * viewName; }
	 */
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

}
