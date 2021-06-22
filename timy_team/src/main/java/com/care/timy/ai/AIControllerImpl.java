package com.care.timy.ai;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.care.timy.ai.AIService;
import com.care.timy.warning.warningService;




@Controller("aiController")
public class AIControllerImpl   implements AIController {
	@Autowired
	private AIService aiService;
	@Autowired
	private warningService warningService;

	@RequestMapping(value="/user/user_main.do" ,method = RequestMethod.GET)
	public ModelAndView listWarnings(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List warningList = warningService.listWarnings();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("warningList", warningList);
		//System.out.println(viewName);
		return mav;
	}
	
	@Override
//	@RequestMapping("/clovaSTT")
	@RequestMapping(value="/user/clovaSTT", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String stt(@RequestParam("uploadFile") MultipartFile file,
								@RequestParam("language") String language) {
		String result = "";
		
		try {
			//1. 파일 저장 경로 설정 : 실제 서비스 되는 위치 (프로젝트 외부에 저장)
			  String uploadPath =  "c:/ai/";
			  
			  //2.원본 파일 이름
			  String originalFileName = file.getOriginalFilename();  
			  
			  //3. 파일 생성 
			  String filePathName = uploadPath + originalFileName;
			  File file1 = new File(filePathName);
			  System.out.println(filePathName);
			  //4. 서버로 전송
			  file.transferTo(file1);
			  
			  result = aiService.clovaSpeechToText(filePathName, language);
			  System.out.println("ai "+result);
			  
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	@RequestMapping(value="/user/chatbotTTS",method = RequestMethod.POST,produces ="application/text; charset=UTF-8")
	@ResponseBody
	public String chatbotTTS(@RequestParam("message") String message) {
		String result = "";
		
		result = aiService.chatbotTextToSpeech(message);	

		return result;
	}
	
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
