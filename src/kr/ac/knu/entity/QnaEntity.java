package kr.ac.knu.entity;

public class QnaEntity 
{
	private int id;    
	private String type;  
	private String title; 
	private String content;   
	private String qna_date;           
	private String qna_edit;         
	private String members_id;         
	private String qna_pas; 
	private int step;
	private int ref;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_edit() {
		return qna_edit;
	}
	public void setQna_edit(String qna_edit) {
		this.qna_edit = qna_edit;
	}
	public String getMembers_id() {
		return members_id;
	}
	public void setMembers_id(String members_id) {
		this.members_id = members_id;
	}
	public String getQna_pas() {
		return qna_pas;
	}
	public void setQna_pas(String qna_pas) {
		this.qna_pas = qna_pas;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}

}
