package com.itbank.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.itbank.model.MessageDTO;

@Controller
public class StompController {
	
	@MessageMapping("/enter")
	@SendTo("/topic")
	public MessageDTO enter(MessageDTO message) {
		message.setText(message.getFrom() + " 입장");
		message.setFrom("user::in");
		message.setClassName("service");
		return message;
	}
	
	@MessageMapping("/topic")	// topic 은 전체를 대상으로 하는 브로커 주소
	@SendTo("/topic")
	public MessageDTO message(MessageDTO message) {
		return message;
	}
	
	@MessageMapping("/sendTo/{username}")	// sendTo는 특정 대상을 지목하는 귓속말 전달 브로커 주소
	@SendTo("/sendTo/{username}")
	public MessageDTO sendTo(MessageDTO message) {
		message.setClassName("whisper");
		return message;
	}
	
	@MessageMapping("/disconnect")
	@SendTo("/topic")
	public MessageDTO disconnect(MessageDTO message) {
		message.setText(message.getFrom() + " 님이 퇴장하셨습니");
		message.setFrom("user::out");
		message.setClassName("service");
		return message;
	}

}
