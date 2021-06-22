package com.care.timy.ai;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public interface AIController {
	
	public String stt(@RequestParam("uploadFile") MultipartFile file,
			@RequestParam("language") String language);
}
