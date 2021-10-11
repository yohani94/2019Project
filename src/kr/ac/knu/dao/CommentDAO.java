package kr.ac.knu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.ac.knu.entity.BoardEntity;
import kr.ac.knu.entity.CommentEntity;

public class CommentDAO extends CommonDAO {
   Connection con = null;

   public int insert(CommentEntity comment, String member, BoardEntity board) {
      int result = 0;

      String query = "   insert into z_bbs_comment "
            + " values(Z_BBS_COMMENT_SEQ.nextval, ?, sysdate, sysdate, ?, ?,0,Z_BBS_COMMENT_SEQ.nextval) ";

      PreparedStatement stmt = null;
      try {
         
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setString(1, comment.getComment_content());
         stmt.setString(2, member);
         stmt.setInt(3, board.getDog_number());
         result = stmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();

      } finally {
         close(stmt);
         close(con);
      }

      return result;
   }

   public ArrayList<CommentEntity> selectAll(BoardEntity board, int startNum, int scope) {

      ArrayList<CommentEntity> list = new ArrayList<CommentEntity>();
      PreparedStatement stmt = null;
      ResultSet rs = null;

      String query = " select rownum rnum, c.* " 
            + " from ( " 
            + " select rownum rnum, b.* " 
            + " from ( "
            + " select * from z_bbs_comment " 
            + " where  DOG_ID=?  "
            + " order by ref desc, step asc, com_num asc  ) b ) c" 
            + " where rnum between ? and ? "; 

      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setInt(1, board.getDog_number() );
         stmt.setInt(2, startNum);
         stmt.setInt(3, startNum + scope - 1);

         rs = stmt.executeQuery();

         while (rs.next()) {
            CommentEntity comment = new CommentEntity();
            comment.setCom_num(rs.getInt("COM_NUM"));
            comment.setComment_content(rs.getString("COMMENT_CONTENT"));
            comment.setCom_date(rs.getDate("COM_DATE"));
            comment.setCom_edit(rs.getDate("COM_EDIT"));
            comment.setMembers_id(rs.getString("MEMBERS_ID"));
            comment.setDog_id(rs.getInt("DOG_ID"));
            comment.setStep(rs.getInt("step"));
            comment.setRef(rs.getInt("ref"));

            list.add(comment);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(stmt);
         close(con);
      }

      return list;
   }
   
   public int totalRow(String column, String keyword,BoardEntity board) {
      int totalRow=0;
      
      String query = "select count(*) from z_bbs_comment "
            + "where " + column + " like ?"
            + " and dog_id = ?";
      
      Connection con = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setString(1, "%" + keyword + "%");
         stmt.setInt(2, board.getDog_number());
         
         rs = stmt.executeQuery();
         rs.next();
         
         totalRow = rs.getInt(1); //
      } catch (Exception e) {
         e.printStackTrace();

      } finally {
         close(stmt);
         close(con);
      }
      return totalRow;
   }
   
   public int delete(String com_num) 
   {
      int result = 0;
      
      String query =
            "  delete from z_bbs_comment "
                     + "   where   com_num = ? ";
      
        Connection con = null;
         PreparedStatement stmt = null;
         
         try {
             con = ds.getConnection();
             stmt = con.prepareStatement(query);
             
             stmt.setInt(1, Integer.parseInt(com_num));
             
             result = stmt.executeUpdate();
             
          }catch(Exception e)   {
             e.printStackTrace();
             
          } finally   {
             close(stmt);
             close(con);
          }
             
             return result;
   }

   public int Reply(CommentEntity comment, BoardEntity board,String member,String ref) {
      int result = 0;

      String query = "   insert into z_bbs_comment "
            + " values(Z_BBS_COMMENT_SEQ.nextval, ?, sysdate, sysdate, ?, ?,?,?) ";

      PreparedStatement stmt = null;
      try {
         con = ds.getConnection();
         stmt = con.prepareStatement(query);
         stmt.setString(1, comment.getComment_content());
         stmt.setString(2, member);
         stmt.setInt(3, board.getDog_number());
         stmt.setInt(4, comment.getStep() );
         stmt.setInt(5, comment.getRef() );
         result = stmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();

      } finally {
         close(stmt);
         close(con);
      }

      return result;
   }      
   
   public CommentEntity select(int com_num) {
      
      CommentEntity comment = null;
      
      String query = " select * from z_bbs_comment " 
            + " where com_num = ? ";
         
            PreparedStatement stmt = null;
            ResultSet rs = null;
         
            try {
               con = ds.getConnection();
               stmt = con.prepareStatement(query);
               stmt.setInt(1, com_num);
         
               rs = stmt.executeQuery();
         
               if (rs.next()) {
                  comment = new CommentEntity();
                  comment.setCom_num(rs.getInt("com_num"));
                  comment.setComment_content(rs.getString("comment_content"));
                  comment.setCom_date(rs.getDate("com_date"));
                  comment.setCom_edit(rs.getDate("com_edit"));
                  comment.setMembers_id(rs.getString("members_id"));
                  comment.setDog_id(rs.getInt("dog_id"));
                  comment.setStep(rs.getInt("step"));
                  comment.setRef(rs.getInt("ref"));
               }
         
            } catch (Exception e) {
               e.printStackTrace();
         
            } finally {
               close(rs);
               close(stmt);
               close(con);
            }
         
            return comment;
   }

   public int deletere(CommentEntity comment) 
   {
      int result1 = 0;

      String query =
            "  delete from z_bbs_comment "
                     + "   where   ref = ? ";
      
        Connection con = null;
         PreparedStatement stmt = null;
         
         try {
             con = ds.getConnection();
             stmt = con.prepareStatement(query);
             
             stmt.setInt(1, comment.getRef());
             
             result1 = stmt.executeUpdate();
             
          }catch(Exception e)   {
             e.printStackTrace();
             
          } finally   {
             close(stmt);
             close(con);
          }
             
             return result1;
   }

   
   
}