package kr.ac.knu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.knu.entity.MemberEntity;

public class MemberDAO extends CommonDAO {

   public MemberEntity login(String id, String pw) {
      MemberEntity member = null;
      
      String query = 
         "   select * from z_members "
         + " where   id = ? "
         + " and      user_pw = ? ";
      
      Connection con = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement( query );
         stmt.setString(1, id);
         stmt.setString(2, pw);
         
         rs = stmt.executeQuery();
         
         if(rs.next()) {
            member = new MemberEntity();
            member.setId(rs.getString("id"));
            member.setPw(rs.getString("user_pw"));
            member.setNick(rs.getString("user_nick"));
            member.setAddress(rs.getString("user_address"));
            member.setPhone(rs.getString("user_phone"));
            member.setName(rs.getString("user_name"));
            member.setEmail(rs.getString("user_email"));
            member.setGender(rs.getString("user_gender"));
            member.setMaster(rs.getInt("master"));
         }
         
      } catch(Exception e) {
         e.printStackTrace();
      
      } finally {
         close(rs);
         close(stmt);
         close(con);
      }
      
      return member;
   }
   
   public int loginCheck(String id, String pw) {
	   Connection con = null;
	   PreparedStatement stmt = null;
	   ResultSet rs = null;
	   
	   String query = 
		         "   select user_pw from z_members "
		         + " where   id = ? ";
	   
	   String dbpw="";
	   int x = -1;
	   
	   try {
		   con = ds.getConnection();
	       stmt = con.prepareStatement( query );
	       stmt.setString(1, id);
	         
	       rs = stmt.executeQuery();
		   
	       if(rs.next()) {
	    	   dbpw = rs.getString("user_pw");
	    	   
		       if(dbpw.equals(pw))
		    	   x=1; //로그인
		       else
		    	   x=0; //비밀번호틀림
		       } else {
		    	  x=-1; //아이디없음
		       }
	     }catch(Exception e) {
	         e.printStackTrace();
	         
	      } finally {
	         close(rs);
	         close(stmt);
	         close(con);
	      }
	   return x;
   }
   
   
   
   
//////////////////////////////////////////////////////////////////
   public int insert(MemberEntity member) {
      int result = 0;
      
      String query = 
         "   insert into z_members "
         + " values(?, ?, ?, ?, ?, ?, ?, ?,?) ";
      
      Connection con = null;
      PreparedStatement stmt = null;
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement( query );
         stmt.setString(1, member.getId());
         stmt.setString(2, member.getPw());
         stmt.setString(3, member.getNick());
         stmt.setString(4, member.getAddress());
         stmt.setString(5, member.getPhone());
         stmt.setString(6, member.getName());
         stmt.setString(7, member.getEmail());
         stmt.setString(8, member.getGender());
         stmt.setInt(9, member.getMaster());
         
         result = stmt.executeUpdate();
         
      } catch(Exception e) {
         e.printStackTrace();
      
      } finally {
         close(stmt);
         close(con);
      }
      
      return result;
   }
////////////////////////////////////////////////////////////////
   public int update(MemberEntity member) {
      int result = 0;
      
      String query = 
            "   update z_members "
            + " set   user_pw =?, user_address =? , "
            + " user_phone =?, user_email =?, user_gender=?" 
            + " where id = ? "; // 
         

      Connection con = null;
      PreparedStatement stmt = null;
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement( query );
         stmt.setString(1, member.getPw());
         stmt.setString(2, member.getAddress());
         stmt.setString(3, member.getPhone());
         stmt.setString(4, member.getEmail());
         stmt.setString(5, member.getGender());
         stmt.setString(6, member.getId());
         result = stmt.executeUpdate();
         
      } catch(Exception e) {
         e.printStackTrace();
      
      } finally {
         close(stmt);
         close(con);
      }
      
      return result;
   }
////////////////////////////////////////////////////////////////
   public MemberEntity select(String id) {
      MemberEntity member = new MemberEntity();

      String query = 
         "   select * from z_members "
         + " where   id = ? ";
      
      Connection con = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement( query );
         stmt.setString(1, id );
         
         rs = stmt.executeQuery();
         
         if(rs.next()) {
            
            member.setId(rs.getString("id"));
            member.setPw(rs.getString("user_pw"));
            member.setNick(rs.getString("user_nick"));
            member.setAddress(rs.getString("user_address"));
            member.setPhone(rs.getString("user_phone"));
            member.setName(rs.getString("user_name"));
            member.setEmail(rs.getString("user_email"));
            member.setGender(rs.getString("user_gender"));
            member.setMaster(rs.getInt("master"));
         }
         
      } catch(Exception e) {
         e.printStackTrace();
      
      } finally {
         close(rs);
         close(stmt);
         close(con);
      }
      
      return member;
   }
////////////////////////////////////////////////////////////////
   public int delete(String id){
      int result =0 ;
      
      String query = " delete from z_members "
            + " where id = ? ";
      
      PreparedStatement stmt = null;
      Connection con  = null;
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setString(1, id);
         
         result = stmt.executeUpdate();
               
      } catch (Exception e) {
         e.printStackTrace();

      } finally {
         close(stmt);
         close(con);
      }

      return result;
   }
//////////////////////////////////////////////////////////////////
   public String idHunt(String userphone, String username) 
      {
           String stNo = null;
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            String query = " select id from z_members"
            		+ " where user_phone = ? and user_name = ?";
            
            try {
                con = ds.getConnection();
                stmt = con.prepareStatement(query);
                stmt.setString(1, userphone);
                stmt.setString(2, username);
                rs = stmt.executeQuery();
                while(rs.next()) {
                   stNo = rs.getString(1);
                }
                }catch(Exception e) {
                   e.printStackTrace();
                }finally {
                 close(stmt);
               close(con);
            }
            return stNo;
         }
      
      public String psHunt(String idid, String userphone, String username) 
      {
           String stNo = null;
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            String query = " select user_pw from z_members where id = ? and user_phone = ? and user_name = ?";
            
            try {
                con = ds.getConnection();
                stmt = con.prepareStatement(query);
                stmt.setString(1, idid);
                stmt.setString(2, userphone);
                stmt.setString(3, username);
                rs = stmt.executeQuery();
                while(rs.next()) {
                   stNo = rs.getString(1);
                }
                }catch(Exception e) {
                   e.printStackTrace();
                }finally {
                 close(stmt);
               close(con);
            }
            return stNo;
         }
///////////////////////////////////////////////////////////////////////////
      public String IdCheck(String id) 
      {
           String stNo = null;
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            String query = "   select * from z_members "
                    + " where   id = ? ";
            
            try {
                con = ds.getConnection();
                stmt = con.prepareStatement(query);
                stmt.setString(1, id);
                rs = stmt.executeQuery();
                while(rs.next()) {
                   stNo = rs.getString(1);
                }
                }catch(Exception e) {
                   e.printStackTrace();
                }finally {
                 close(stmt);
               close(con);
            }
            return stNo;
         }

	public int idFind(String user_name, String user_phone) {
	   Connection con = null;
	   PreparedStatement stmt = null;
	   ResultSet rs = null;
	   
	   String query = 
		         "   select user_phone from z_members "
		         + " where   user_name = ? ";
	   
	   String dbph="";
	   int x = -1;
	   
	   try {
		   con = ds.getConnection();
	       stmt = con.prepareStatement( query );
	       stmt.setString(1, user_name);
	         
	       rs = stmt.executeQuery();
		   
	       if(rs.next()) {
	    	   dbph = rs.getString("user_phone");
	    	   
		       if(dbph.equals(user_phone))
		    	   x=1; //아이디 찾아짐
		       else
		    	   x=0; //이름과 핸드폰번호 일치x
		       } else {
		    	  x=-1; // 존재하지않는 이름
		       }
	     }catch(Exception e) {
	         e.printStackTrace();
	         
	      } finally {
	         close(rs);
	         close(stmt);
	         close(con);
	      }
	   return x;
   }
	
	public int pwFind(String id, String user_name,String user_phone) {
		   Connection con = null;
		   PreparedStatement stmt = null;
		   ResultSet rs = null;
		   
		   String query = 
			         "   select user_phone from z_members "
			         + " where   user_name = ? "
			         + " and 	id = ?";
		   
		   String dbph="";
		   
		   int x = -1;
		   
		   try {
			   con = ds.getConnection();
		       stmt = con.prepareStatement( query );
		       stmt.setString(1, user_name);
		       stmt.setString(2, id);
		         
		       rs = stmt.executeQuery();
			   
		       if(rs.next()) {
		    	   dbph = rs.getString("user_phone");
		    	   
			       if(dbph.equals(user_phone))
			    	   x=1; //아이디 찾아짐
			       else
			    	   x=0; //이름과 핸드폰번호 일치x
			       } else {
			    	  x=-1; // 존재하지않는 이름
			       }
		     }catch(Exception e) {
		         e.printStackTrace();
		         
		      } finally {
		         close(rs);
		         close(stmt);
		         close(con);
		      }
		   return x;
	   }
	
   }