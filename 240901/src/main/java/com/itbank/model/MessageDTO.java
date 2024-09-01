package com.itbank.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MessageDTO {

	private String from;
	private String text;
	private String time;
	private String to;
	private String className = "";
	
	public MessageDTO() {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		time = sdf.format(new Date());
	}
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	
}
