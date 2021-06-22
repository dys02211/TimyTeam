package com.care.timy.ai;

public interface AIService {

	public String clovaSpeechToText(String filePathName, String language);
	public String chatbotTextToSpeech(String message) ;
}
