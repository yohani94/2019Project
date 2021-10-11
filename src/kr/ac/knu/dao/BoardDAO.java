package kr.ac.knu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.ac.knu.entity.BoardEntity;
import kr.ac.knu.entity.QnaEntity;

public class BoardDAO extends CommonDAO {
   Connection con =null;
   

   public int insert(BoardEntity board) {
      int result = 0;

      String query = "   insert into z_bbs_dog " + 
      " values(z_bbs_dog_SEQ.nextval, ?, ?, ?, ? ,"
            + "  ? ,? ,? ,? ,? ,"
            + "  ?, 0 , to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss'), to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss'), 0 ,"
            + "  ?, ?) ";

      PreparedStatement stmt = null;
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setString(1, board.getDog_title());
         stmt.setString(2, board.getAnimaltype());
         stmt.setString(3, board.getDog_comment());
         stmt.setString(4, board.getDc_type());
         stmt.setString(5, board.getDc_sex());
         stmt.setString(6, board.getDc_sex_neu());
         stmt.setString(7, board.getDc_age());
         stmt.setString(8, board.getDc_size());
         stmt.setString(9, board.getDc_vaccinate());
         stmt.setString(10, board.getDc_others());
         stmt.setString(11, board.getMembers_id());
         stmt.setString(12, board.getUpfile());

         result = stmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();

      } finally {
         close(stmt);
         close(con);
      }

      return result;
   }

   public ArrayList<BoardEntity> selectAll(String column, String keyword,int startNum, int scope, String animaltype, String comple){
	      
	      ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();   
	      PreparedStatement stmt = null;
	      ResultSet rs = null;
	      String query = "";
	      if (comple.equals("")) {//전체 
	         query = " select rownum rnum, c.* "
	            + " from ( " 
	            + " select rownum rnum, b.* "
	            + " from ( "
	            + " select * from z_bbs_dog "
	            + " where " + column + " like ?  "
	            + " and animaltype like ? "
	            + "  order by dog_number desc ) b ) c "
	            + " where rnum between ? and ? ";
	      }else { // 완료된것 
	         query = " select rownum rnum, c.* "
	               + " from ( " 
	               + " select rownum rnum, b.* "
	               + " from ( "
	               + " select * from z_bbs_dog "
	               + " where " + column + " like ?  "
	               + " and animaltype like ? "
	               + " and comple =  ? "
	               + "  order by dog_number desc ) b ) c "
	               + " where rnum between ? and ? ";
	      }
	      
	      try {
	         con = ds.getConnection();
	         stmt = con.prepareStatement( query );
	         stmt.setString(1, "%" + keyword + "%");
	         stmt.setString(2,  "%" + animaltype + "%");
	         if(comple.equals("")) {
	            stmt.setInt(3, startNum);
	            stmt.setInt(4, startNum + scope -1);
	         }else {
	         stmt.setInt(3, Integer.parseInt(comple));
	         stmt.setInt(4, startNum);
	         stmt.setInt(5, startNum + scope -1);
	         }
	         
	         rs = stmt.executeQuery();
	         
	         while (rs.next()) {
	            BoardEntity board = new BoardEntity();
	            board.setDog_number(rs.getInt("dog_number"));
	            board.setDog_title(rs.getString("dog_title"));
	            board.setDog_comment(rs.getString("dog_comment"));
	            board.setAnimaltype(rs.getString("animaltype"));
	            board.setComple(rs.getString("comple"));
	            board.setDog_date(rs.getString("dog_date"));
	            board.setDog_edit(rs.getString("dog_edit"));
	            board.setHit(rs.getInt("hit"));
	            board.setMembers_id(rs.getString("members_id"));
	            board.setUpfile(rs.getString("upfile"));
	            board.setDc_age(rs.getString("dc_age"));
	            board.setDc_others(rs.getString("dc_others"));
	            board.setDc_sex(rs.getString("dc_sex"));
	            board.setDc_sex_neu(rs.getString("dc_sex_neu"));
	            board.setDc_size(rs.getString("dc_size"));
	            board.setDc_type(rs.getString("dc_type"));
	            board.setDc_vaccinate(rs.getString("dc_vaccinate"));
	            list.add(board);
	         }         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(stmt);
	         close(con);
	      }
	      
	      return list;
	   }  
    

public ArrayList<BoardEntity> selectAllcomp(String column, String keyword,int startNum, int scope, String type){
      
      ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();   
      PreparedStatement stmt = null;
      ResultSet rs = null;
   
      String query = " select rownum rnum, c.* "
            + " from ( " 
            + " select rownum rnum, b.* "
            + " from ( "
            + " select * from z_bbs_dog "
            + " where " + column + " like ?  "
            + " and animaltype = ? "
            + " and comple = ?"
            + "  order by dog_number desc ) b ) c "
            + " where rnum between ? and ? ";
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement( query );
         stmt.setString(1, "%" + keyword + "%");
         stmt.setString(2, type);
         stmt.setInt(3, 0);
         stmt.setInt(4, startNum);
         stmt.setInt(5, startNum + scope -1);
         
         rs = stmt.executeQuery();
         
         while (rs.next()) {
            BoardEntity board = new BoardEntity();
            board.setDog_number(rs.getInt("dog_number"));
            board.setDog_title(rs.getString("dog_title"));
            board.setDog_comment(rs.getString("dog_comment"));
            board.setAnimaltype(rs.getString("animaltype"));
            board.setComple(rs.getString("comple"));
            board.setDog_date(rs.getString("dog_date"));
            board.setDog_edit(rs.getString("dog_edit"));
            board.setHit(rs.getInt("hit"));
            board.setMembers_id(rs.getString("members_id"));
            board.setUpfile(rs.getString("upfile"));
            board.setDc_age(rs.getString("dc_age"));
            board.setDc_others(rs.getString("dc_others"));
            board.setDc_sex(rs.getString("dc_sex"));
            board.setDc_sex_neu(rs.getString("dc_sex_neu"));
            board.setDc_size(rs.getString("dc_size"));
            board.setDc_type(rs.getString("dc_type"));
            board.setDc_vaccinate(rs.getString("dc_vaccinate"));
            list.add(board);
         }         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(stmt);
         close(con);
      }
      
      return list;
   }
   
   public int delete(String dog_number,String id) 
   {
      int result = 0;
      
      String query =
            "  delete from z_bbs_dog "
                     + "   where   dog_number = ? ";
      
        Connection con = null;
         PreparedStatement stmt = null;
         
         try {
             con = ds.getConnection();
             stmt = con.prepareStatement(query);
             
             stmt.setInt(1, Integer.parseInt(dog_number));
             
             result = stmt.executeUpdate();
             
          }catch(Exception e)   {
             e.printStackTrace();
            
          } finally   {
             close(stmt);
             close(con);
          }
             
             return result;
   }   
   
   public int totalRow(String column, String keyword,String animaltype) {
      int totalRow=0;
      
      String query = " select count(*) from z_bbs_dog "
            + " where " + column + " like ?"
                  + " and animaltype like ? ";
      
      Connection con = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setString(1, "%" + keyword + "%");
         stmt.setString(2, "%" + animaltype + "%");
         
         rs = stmt.executeQuery();
         rs.next();
         
         totalRow = rs.getInt(1); //1은 인덱스 값을 의미함
      } catch (Exception e) {
         e.printStackTrace();

      } finally {
         close(stmt);
         close(con);
      }
      return totalRow;
   }


   public void hitUpdate(String dog_number) {
      String query = " update z_bbs_dog " 
            + " set hit = hit + 1 " 
            + " where dog_number = ? ";

      Connection con = null;
      PreparedStatement stmt = null;
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setInt(1, Integer.parseInt(dog_number));
      
         stmt.executeUpdate();
      
      } catch (Exception e) {
         e.printStackTrace();
      
      } finally {
         close(stmt);
         close(con);
      }
   }

   
   
   public  BoardEntity select(int dog_number)
   {
      BoardEntity board = null;

      String query = " select * from z_bbs_dog " 
                  + " where dog_number = ? ";
      
   
      PreparedStatement stmt = null;
      ResultSet rs = null;
   
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setInt(1, dog_number);
   
         rs = stmt.executeQuery();
   
         if (rs.next()) {
            board = new BoardEntity();
            
            board.setDog_number(rs.getInt("dog_number"));
            board.setDog_title(rs.getString("dog_title"));
            board.setDog_comment(rs.getString("dog_comment"));
            board.setAnimaltype(rs.getString("animaltype"));
            board.setComple(rs.getString("comple"));
            board.setDog_date(rs.getString("dog_date"));
            board.setDog_edit(rs.getString("dog_edit"));
            board.setHit(rs.getInt("hit"));
            board.setMembers_id(rs.getString("members_id"));
            board.setUpfile(rs.getString("upfile"));
            board.setDc_age(rs.getString("dc_age"));
            board.setDc_others(rs.getString("dc_others"));
            board.setDc_sex(rs.getString("dc_sex"));
            board.setDc_sex_neu(rs.getString("dc_sex_neu"));
            board.setDc_size(rs.getString("dc_size"));
            board.setDc_type(rs.getString("dc_type"));
            board.setDc_vaccinate(rs.getString("dc_vaccinate"));
         }
   
      } catch (Exception e) {
         e.printStackTrace();
   
      } finally {
         close(rs);
         close(stmt);
         close(con);
      }
   
      return board;
   }

   public  BoardEntity select3(int dog_number, String animaltype) // 占쏙옙占쏙옙占쏙옙 찾占쏙옙
   {
      BoardEntity board3 = null;

      String query = " select  * " 
            + " from    (select * from z_bbs_dog "
            + "     where dog_number < ?) v   "     
            + " where   dog_number = (select max(dog_number) "
            + "                     from (select * from z_bbs_dog " 
            + "                      where dog_number < ?"
            + "                  and animaltype like ? ) )"  ;
;
      
   
      PreparedStatement stmt = null;
      ResultSet rs = null;
   
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setInt(1, dog_number);
         stmt.setInt(2, dog_number);
         stmt.setString(3, "%" +animaltype+ "%");
         
         rs = stmt.executeQuery();
         
         if (rs.next()) {
            board3 = new BoardEntity();
            
            board3.setDog_number(rs.getInt("dog_number"));
            board3.setDog_title(rs.getString("dog_title"));
            board3.setDog_comment(rs.getString("dog_comment"));
            board3.setAnimaltype(rs.getString("animaltype"));
            board3.setComple(rs.getString("comple"));
            board3.setDog_date(rs.getString("dog_date"));
            board3.setDog_edit(rs.getString("dog_edit"));
            board3.setHit(rs.getInt("hit"));
            board3.setMembers_id(rs.getString("members_id"));
            board3.setUpfile(rs.getString("upfile"));
            board3.setDc_age(rs.getString("dc_age"));
            board3.setDc_others(rs.getString("dc_others"));
            board3.setDc_sex(rs.getString("dc_sex"));
            board3.setDc_sex_neu(rs.getString("dc_sex_neu"));
            board3.setDc_size(rs.getString("dc_size"));
            board3.setDc_type(rs.getString("dc_type"));
            board3.setDc_vaccinate(rs.getString("dc_vaccinate"));
         }
   
      } catch (Exception e) {
         e.printStackTrace();
   
      } finally {
         close(rs);
         close(stmt);
         close(con);
      }
   
      return board3;
   }
   
   public  BoardEntity select2(int dog_number,String animaltype) // 占쏙옙占쏙옙찾占쏙옙
   {
      BoardEntity board2 = null;

      String query = " select  z.* "
         +   " from    ( "
         +   "            select  rownum as rnum,"
         +   "                        v.*"
         +   "            from    (select * from z_bbs_dog "
         +   "                    where dog_number > ?"
         + ""
         +    "               and animaltype like ? "
         + ") v "
         +   "            ) z"
         +   "    where   rnum between 1 and 1 " ;

      
   
      PreparedStatement stmt = null;
      ResultSet rs = null;
   
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         
         stmt.setInt(1, dog_number);
         stmt.setString(2, "%" +animaltype+ "%");
         
         rs = stmt.executeQuery();
         
         if (rs.next()) {
            board2 = new BoardEntity();
            
            board2.setDog_number(rs.getInt("dog_number"));
            board2.setDog_title(rs.getString("dog_title"));
            board2.setDog_comment(rs.getString("dog_comment"));
            board2.setAnimaltype(rs.getString("animaltype"));
            board2.setComple(rs.getString("comple"));
            board2.setDog_date(rs.getString("dog_date"));
            board2.setDog_edit(rs.getString("dog_edit"));
            board2.setHit(rs.getInt("hit"));
            board2.setMembers_id(rs.getString("members_id"));
            board2.setUpfile(rs.getString("upfile"));
            board2.setDc_age(rs.getString("dc_age"));
            board2.setDc_others(rs.getString("dc_others"));
            board2.setDc_sex(rs.getString("dc_sex"));
            board2.setDc_sex_neu(rs.getString("dc_sex_neu"));
            board2.setDc_size(rs.getString("dc_size"));
            board2.setDc_type(rs.getString("dc_type"));
            board2.setDc_vaccinate(rs.getString("dc_vaccinate"));
         }
   
      } catch (Exception e) {
         e.printStackTrace();
   
      } finally {
         close(rs);
         close(stmt);
         close(con);
      }
   
      return board2;
   }
   
   public ArrayList<BoardEntity> myselect(String column, String keyword,int startNum, int scope,String id){
      
      ArrayList<BoardEntity> list = new ArrayList<BoardEntity>();   
      PreparedStatement stmt = null;
      ResultSet rs = null;
   
      String query = " select rownum rnum, c.* "
            + " from ( " 
            + " select rownum rnum, b.* "
            + " from ( "
            + " select * from z_bbs_dog "
            + " where  members_id = ? "
            + "  order by dog_number desc ) b ) c "
            + " where rnum between 1 and 1000 ";
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement( query );
         stmt.setString(1, id);/*
         stmt.setInt(2, startNum);
         stmt.setInt(3, startNum + scope -1);*/
         
         rs = stmt.executeQuery();
         
         while (rs.next()) {
            BoardEntity board = new BoardEntity();
            board.setDog_number(rs.getInt("dog_number"));
            board.setDog_title(rs.getString("dog_title"));
            board.setDog_comment(rs.getString("dog_comment"));
            board.setAnimaltype(rs.getString("animaltype"));
            board.setComple(rs.getString("comple"));
            board.setDog_date(rs.getString("dog_date"));
            board.setDog_edit(rs.getString("dog_edit"));
            board.setHit(rs.getInt("hit"));
            board.setMembers_id(rs.getString("members_id"));
            board.setUpfile(rs.getString("upfile"));
            board.setDc_age(rs.getString("dc_age"));
            board.setDc_others(rs.getString("dc_others"));
            board.setDc_sex(rs.getString("dc_sex"));
            board.setDc_sex_neu(rs.getString("dc_sex_neu"));
            board.setDc_size(rs.getString("dc_size"));
            board.setDc_type(rs.getString("dc_type"));
            board.setDc_vaccinate(rs.getString("dc_vaccinate"));
            
            list.add(board);
         }         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(stmt);
         close(con);
      }
      
      return list;
   }




   public void updatecom(String comple,String dog_number) {
      String query =null;
      if(comple.equals("1")) {
            query = " update z_bbs_dog " 
         + " set comple = comple + 1 " 
         + " where dog_number = ? ";
      }else {
         query = " update z_bbs_dog " 
               + " set comple = comple - 1 " 
               + " where dog_number = ? ";
      }
      
      Connection con = null;
      PreparedStatement stmt = null;
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         
         stmt.setInt(1, Integer.parseInt(dog_number));
         
         stmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      
      } finally {
         close(stmt);
         close(con);
      }

   }

   public int update(BoardEntity board) {
      int result =0 ;
      
      String query = " update z_bbs_dog "
            + " set dog_title = ? , animaltype = ? "
            + " ,dc_type = ? , dc_sex=? "
            + " ,dc_age = ? , dc_sex_neu=? "
            + " ,dc_vaccinate = ?, dc_others=?"
            + " ,dog_comment=? , upfile=? "
            + " ,dog_edit = to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss')"
            + " where dog_number = ? ";
      
      PreparedStatement stmt = null;
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setString(1, board.getDog_title());
         stmt.setString(2, board.getAnimaltype() );
         stmt.setString(3, board.getDc_type() );
         stmt.setString(4, board.getDc_sex() );
         stmt.setString(5, board.getDc_age() );
         stmt.setString(6, board.getDc_sex_neu() );
         stmt.setString(7, board.getDc_vaccinate() );
         stmt.setString(8, board.getDc_others() );
         stmt.setString(9, board.getDog_comment() );
         stmt.setString(10, board.getUpfile() );
         stmt.setInt(11, board.getDog_number());
         
         result = stmt.executeUpdate();
               
      } catch (Exception e) {
         e.printStackTrace();

      } finally {
         close(stmt);
         close(con);
      }

      return result;
   }
   
   public BoardEntity select4(int dog_number, String animaltype) {
	      BoardEntity board2 = null;

	      String query = " select  * " 
	            + " from    (select * from z_bbs_dog "
	            + "     where dog_number > ?) v   "     
	            + " where   dog_number = (select min(dog_number) "   
	            + "                     from (select * from z_bbs_dog " 
	            + "                      where dog_number > ?"
	            +  "                      and comple = 0 "
	            + "                  and animaltype like ?) )"  ;

	      
	   
	      PreparedStatement stmt = null;
	      ResultSet rs = null;
	   
	      try {
	         con = ds.getConnection();
	         stmt = con.prepareStatement(query);
	         
	         stmt.setInt(1, dog_number);
	         stmt.setInt(2, dog_number);
	         stmt.setString(3, "%" +animaltype+ "%");
	         
	         rs = stmt.executeQuery();
	         
	         if (rs.next()) {
	            board2 = new BoardEntity();
	            
	            board2.setDog_number(rs.getInt("dog_number"));
	            board2.setDog_title(rs.getString("dog_title"));
	            board2.setDog_comment(rs.getString("dog_comment"));
	            board2.setAnimaltype(rs.getString("animaltype"));
	            board2.setComple(rs.getString("comple"));
	            board2.setDog_date(rs.getString("dog_date"));
	            board2.setDog_edit(rs.getString("dog_edit"));
	            board2.setHit(rs.getInt("hit"));
	            board2.setMembers_id(rs.getString("members_id"));
	            board2.setUpfile(rs.getString("upfile"));
	            board2.setDc_age(rs.getString("dc_age"));
	            board2.setDc_others(rs.getString("dc_others"));
	            board2.setDc_sex(rs.getString("dc_sex"));
	            board2.setDc_sex_neu(rs.getString("dc_sex_neu"));
	            board2.setDc_size(rs.getString("dc_size"));
	            board2.setDc_type(rs.getString("dc_type"));
	            board2.setDc_vaccinate(rs.getString("dc_vaccinate"));
	         }
	   
	      } catch (Exception e) {
	         e.printStackTrace();
	   
	      } finally {
	         close(rs);
	         close(stmt);
	         close(con);
	      }
	   
	      return board2;
	   }

	   public BoardEntity select5(int dog_number, String animaltype) {
	      BoardEntity board3 = null;

	      String query = " select  * " 
	            + " from    (select * from z_bbs_dog "
	            + "     where dog_number < ?) v   "     
	            + " where   dog_number = (select max(dog_number) "   
	            + "                     from (select * from z_bbs_dog " 
	            + "                      where dog_number < ?"
	            +  "                      and comple = 0 "
	            + "                  and animaltype like ? ) )"  ;
	;
	      
	   
	      PreparedStatement stmt = null;
	      ResultSet rs = null;
	   
	      try {
	         con = ds.getConnection();
	         stmt = con.prepareStatement(query);
	         stmt.setInt(1, dog_number);
	         stmt.setInt(2, dog_number);
	         stmt.setString(3, "%" +animaltype+ "%");
	         
	         rs = stmt.executeQuery();
	         
	         if (rs.next()) {
	            board3 = new BoardEntity();
	            
	            board3.setDog_number(rs.getInt("dog_number"));
	            board3.setDog_title(rs.getString("dog_title"));
	            board3.setDog_comment(rs.getString("dog_comment"));
	            board3.setAnimaltype(rs.getString("animaltype"));
	            board3.setComple(rs.getString("comple"));
	            board3.setDog_date(rs.getString("dog_date"));
	            board3.setDog_edit(rs.getString("dog_edit"));
	            board3.setHit(rs.getInt("hit"));
	            board3.setMembers_id(rs.getString("members_id"));
	            board3.setUpfile(rs.getString("upfile"));
	            board3.setDc_age(rs.getString("dc_age"));
	            board3.setDc_others(rs.getString("dc_others"));
	            board3.setDc_sex(rs.getString("dc_sex"));
	            board3.setDc_sex_neu(rs.getString("dc_sex_neu"));
	            board3.setDc_size(rs.getString("dc_size"));
	            board3.setDc_type(rs.getString("dc_type"));
	            board3.setDc_vaccinate(rs.getString("dc_vaccinate"));
	         }
	   
	      } catch (Exception e) {
	         e.printStackTrace();
	   
	      } finally {
	         close(rs);
	         close(stmt);
	         close(con);
	      }
	   
	      return board3;
	   }
}