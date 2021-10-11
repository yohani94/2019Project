package kr.ac.knu.entity;

import java.sql.Date;

public class BoardEntity {
	private int dog_number;
	private String dog_title;
	private String dog_comment;
	private String animaltype; //���� ����
	private	String dc_type;   //������������ 
	private	String dc_sex;        //����
	private	String dc_sex_neu;    //�߼�ȭ
	private	String dc_age;        //����
	private	String dc_size;       //ũ��
	private	String dc_vaccinate;  //��������
	private String dc_others;
	private String comple;
	private String dog_date;
	private String dog_edit;
	private int	hit;
	private String members_id;
	private String upfile;
	
	public int getDog_number() {
		return dog_number;
	}
	public void setDog_number(int dog_number) {
		this.dog_number = dog_number;
	}
	public String getDog_title() {
		return dog_title;
	}
	public void setDog_title(String dog_title) {
		this.dog_title = dog_title;
	}
	public String getDog_comment() {
		return dog_comment;
	}
	public void setDog_comment(String dog_comment) {
		this.dog_comment = dog_comment;
	}
	public String getAnimaltype() {
		return animaltype;
	}
	public void setAnimaltype(String animaltype) {
		this.animaltype = animaltype;
	}
	public String getDc_type() {
		return dc_type;
	}
	public void setDc_type(String dc_type) {
		this.dc_type = dc_type;
	}
	public String getDc_sex() {
		return dc_sex;
	}
	public void setDc_sex(String dc_sex) {
		this.dc_sex = dc_sex;
	}
	public String getDc_sex_neu() {
		return dc_sex_neu;
	}
	public void setDc_sex_neu(String dc_sex_neu) {
		this.dc_sex_neu = dc_sex_neu;
	}
	public String getDc_age() {
		return dc_age;
	}
	public void setDc_age(String dc_age) {
		this.dc_age = dc_age;
	}
	public String getDc_size() {
		return dc_size;
	}
	public void setDc_size(String dc_size) {
		this.dc_size = dc_size;
	}
	public String getDc_vaccinate() {
		return dc_vaccinate;
	}
	public void setDc_vaccinate(String dc_vaccinate) {
		this.dc_vaccinate = dc_vaccinate;
	}
	public String getDc_others() {
		return dc_others;
	}
	public void setDc_others(String dc_others) {
		this.dc_others = dc_others;
	}
	public String getComple() {
		return comple;
	}
	public void setComple(String comple) {
		this.comple = comple;
	}
	
	public String getDog_date() {
		return dog_date;
	}
	public void setDog_date(String dog_date) {
		this.dog_date = dog_date;
	}
	public String getDog_edit() {
		return dog_edit;
	}
	public void setDog_edit(String dog_edit) {
		this.dog_edit = dog_edit;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getMembers_id() {
		return members_id;
	}
	public void setMembers_id(String members_id) {
		this.members_id = members_id;
	}
	public String getUpfile() {
		return upfile;
	}
	public void setUpfile(String upfile) {
		this.upfile = upfile;
	}
	
	
}
