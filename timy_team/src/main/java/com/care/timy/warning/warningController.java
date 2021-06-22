package com.care.timy.warning;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller("warningController")
public class warningController {
	@Autowired
	private warningService warningService;
	@Autowired
	private warningVO warningVO;
	
	@RequestMapping(value="/user/listWarning.do" ,method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List warningsList = warningService.listWarnings();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("warningList", warningsList);
		//System.out.println(viewName);
		return mav;
	}
	
	/* warning TBL insert */
	@RequestMapping(value="/warning/addWarning.do" ,method = RequestMethod.POST)
	public ModelAndView addWarning(@ModelAttribute("warning") warningVO warning,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("addWorning");
		int result = 0;
		result = warningService.addWarning(warning);
		System.out.println("warning insert : " + result);
		ModelAndView mav = new ModelAndView("redirect:/user/user_main.do");
		return mav;
	}

	/* warning TBL update */
	@RequestMapping(value="/warning/updateWarning.do" ,method = RequestMethod.POST)
	public ModelAndView updateWarning(@ModelAttribute("warning") warningVO warning,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("updateWorning");
		int result = 0;
		result = warningService.updateWarning(warning);
		ModelAndView mav = new ModelAndView("redirect:/user/user_main.do");
		return mav;
	}
	
	
	
	/*@RequestMapping(value = { "/warning/loginForm.do", "/member/memberForm.do" }, method =  RequestMethod.GET)*/
//	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
//	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName = getViewName(request);
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName(viewName);
//		return mav;
//	}
	
	

	
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
