package com.itbank.controller;

import java.util.HashSet;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sessions")
public class SessionController {
	
	private HashSet<String> sessionSet = new HashSet<>();
	
	public void add(String username) {
		sessionSet.add(username);
	}
	public void remove(String login) {
		sessionSet.remove(login);
	}
	
	@GetMapping
	public HashSet<String> sessions() {
		return sessionSet;
	}
}
