package kr.ac.knu.entity;

import java.sql.Date;

public class CommentEntity {
   private int com_num;
   private String comment_content;
   private Date com_date;
   private Date com_edit;
   private String members_id;
   private int dog_id;
   private int step;
   private int ref;
   
   
   public int getRef() {
      return ref;
   }
   public void setRef(int ref) {
      this.ref = ref;
   }
   public int getStep() {
      return step;
   }
   public void setStep(int step) {
      this.step = step;
   }
   public int getCom_num() {
      return com_num;
   }
   public void setCom_num(int com_num) {
      this.com_num = com_num;
   }
   public String getComment_content() {
      return comment_content;
   }
   public void setComment_content(String comment_content) {
      this.comment_content = comment_content;
   }
   public Date getCom_date() {
      return com_date;
   }
   public void setCom_date(Date com_date) {
      this.com_date = com_date;
   }
   public Date getCom_edit() {
      return com_edit;
   }
   public void setCom_edit(Date com_edit) {
      this.com_edit = com_edit;
   }
   public String getMembers_id() {
      return members_id;
   }
   public void setMembers_id(String members_id) {
      this.members_id = members_id;
   }
   public int getDog_id() {
      return dog_id;
   }
   public void setDog_id(int dog_id) {
      this.dog_id = dog_id;
   }
   
}