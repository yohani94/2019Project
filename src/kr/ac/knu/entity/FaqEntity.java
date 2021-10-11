package kr.ac.knu.entity;

import java.sql.Date;

public class FaqEntity 
{

	private int faq_number;    
	private String faq_type;  
	private String faq_title; 
	private String faq_content;
	
	public int getFaq_number() {
		return faq_number;
	}
	public void setFaq_number(int faq_number) {
		this.faq_number = faq_number;
	}
	public String getFaq_type() {
		return faq_type;
	}
	public void setFaq_type(String faq_type) {
		this.faq_type = faq_type;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
	
	
	
}
