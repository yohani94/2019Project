package kr.ac.knu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import kr.ac.knu.entity.*;

public class QnaDAO extends CommonDAO{
	
	Connection con  = null;
	
	public int insert(QnaEntity qna) 
	{
	  int result = 0;
	  
	  String query = 
				"	insert into z_qna "
				+ " values(z_qna_seq.nextval, ?, ?, ?, to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss'), to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss'), ?, ? , 0, z_qna_seq.nextval) ";
	  
	  Connection con = null;
	  PreparedStatement stmt = null;
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement( query );
			stmt.setString(1, qna.getType() );
			stmt.setString(2, qna.getTitle() );
			stmt.setString(3, qna.getContent() );
			stmt.setString(4, qna.getMembers_id());
			stmt.setString(5, qna.getQna_pas() );
			
			result = stmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		
		} finally {
			close(stmt);
			close(con);
		}
		
		return result;
	}

	public int delete(String id) 
	{
		int result = 0;
		
		String query =
				"  delete from z_qna "
				         + "   where   id = ? ";
		
		  Connection con = null;
	      PreparedStatement stmt = null;
	      
	      try {
	          con = ds.getConnection();
	          stmt = con.prepareStatement(query);
	          
	          stmt.setInt(1, Integer.parseInt(id));
	          
	          result = stmt.executeUpdate();
	          
	       }catch(Exception e)   {
	          e.printStackTrace();
	          
	       } finally   {
	          close(stmt);
	          close(con);
	       }
	          
	          return result;
	}

	public int update(QnaEntity qna) 
	{ 
		 int result = 0;
		 
		 String query = 
	               "   update z_qna "
	               + " set    type=?,  title = ? , content = ?, qna_edit = to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss'),  qna_pas = ?" + " where   id = ? " ;

		 Connection con = null;
         PreparedStatement stmt = null;
         
         try {
            con = ds.getConnection();
            stmt = con.prepareStatement( query );
            stmt.setString(1, qna.getType());
            stmt.setString(2, qna.getTitle());
            stmt.setString(3, qna.getContent());
            stmt.setString(4, qna.getQna_pas());
            stmt.setInt(5, qna.getId());
            
             result = stmt.executeUpdate();
            
         } catch(Exception e) {
            e.printStackTrace();
         
         } finally {
            close(stmt);
            close(con);
         }
         return result;
      }

	public ArrayList<QnaEntity> selectAll(String column, String keyword,int startNum, int scope, String Ttype)
	{ArrayList<QnaEntity> list = new ArrayList<QnaEntity>();	
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String query = " select rownum rnum, c.* "
			+ " from ( " 
			+ " select rownum rnum, b.* "
			+ " from ( "
			+ " select * from z_qna "
			+ " where " + column + " like ? "
			+ " and type like ?"
			+ " order by ref desc, step asc, id asc) b ) c "
			+ " where rnum between ? and ? ";
	
	try {
		con = ds.getConnection();
		stmt = con.prepareStatement( query );
		stmt.setString(1, "%" + keyword + "%");
		stmt.setString(2, Ttype);
		stmt.setInt(3, startNum);
		stmt.setInt(4, startNum + scope -1);
		
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			QnaEntity qna = new QnaEntity();
            qna.setId(rs.getInt("id"));
            qna.setType(rs.getString("type"));
            qna.setTitle(rs.getString("title"));
            qna.setContent(rs.getString("content"));
            qna.setQna_date(rs.getString("qna_date"));
            qna.setQna_edit(rs.getString("qna_edit"));
            qna.setMembers_id(rs.getString("members_id"));
            qna.setQna_pas(rs.getString("qna_pas"));
            qna.setStep(rs.getInt("step"));
            qna.setRef(rs.getInt("ref"));
			
			list.add(qna);
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

	public int totalRow(String column, String keyword, String Ttype) 
	{
		int totalRow=0;
		
		String query = " select count(*) from z_qna "
				+ " where " + column + " like ? "
				+ " and type like ? ";
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			stmt = con.prepareStatement(query);
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, Ttype);
			
			rs = stmt.executeQuery();
			rs.next();
			
			totalRow = rs.getInt(1); //1�� �ε��� ���� �ǹ���
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close(stmt);
			close(con);
		}
		return totalRow;
	}

	public QnaEntity select(int id) 
		{
			QnaEntity qna = null;
	
			String query = " select * from z_qna " 
			+ " where id = ? ";
		
			PreparedStatement stmt = null;
			ResultSet rs = null;
		
			try {
				con = ds.getConnection();
				stmt = con.prepareStatement(query);
				stmt.setInt(1, id);
		
				rs = stmt.executeQuery();
		
				if (rs.next()) {
					qna = new QnaEntity();
					qna.setId(rs.getInt("id"));
					qna.setType(rs.getString("type"));
					qna.setTitle(rs.getString("title"));
					qna.setContent(rs.getString("content"));
					qna.setQna_date(rs.getString("qna_date"));
					qna.setQna_edit(rs.getString("qna_edit"));
					qna.setMembers_id(rs.getString("members_id"));
					qna.setQna_pas( rs.getString("qna_pas"));
					qna.setStep( rs.getInt("step"));
					qna.setRef( rs.getInt("ref"));
				}
		
			} catch (Exception e) {
				e.printStackTrace();
		
			} finally {
				close(rs);
				close(stmt);
				close(con);
			}
		
			return qna;
		}

	public int reply(QnaEntity qna) 
	{
		int result =0 ;
	
	String query = " insert into z_qna " +
			" values(z_qna_seq.nextval, ?, ?, ?, to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss'), to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss') , ? , ? , ?, ?) ";

	PreparedStatement stmt = null;
	
	try {
		
		con = ds.getConnection();
		stmt = con.prepareStatement(query);
		
		stmt.setString(1, qna.getType());
		stmt.setString(2, qna.getTitle());
		stmt.setString(3, qna.getContent() );
		stmt.setString(4, qna.getMembers_id());
		stmt.setString(5, qna.getQna_pas() );
		stmt.setInt(6, qna.getStep() );
		stmt.setInt(7, qna.getRef()  );
		
		result = stmt.executeUpdate();
				
	} catch (Exception e) {
		e.printStackTrace();

	} finally {
		close(stmt);
		close(con);
	}

	return result;
	}

	public ArrayList<QnaEntity> selectAlll(String id, int startNum, int scope) 
	{
		ArrayList<QnaEntity> listaa = new ArrayList<QnaEntity>();	
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		System.out.println(id);
		System.out.println(startNum);
		System.out.println(scope);
		
		String query = 
				" select rownum rnum, c.* "
				+ " from ( "
				+ "select rownum rnum, b.* "
				+ " from ( "
				+ " select * from z_qna "
				+ " where members_id = ? "
					+ " order by  members_id asc"
					+ ") b )c "
+ " where rnum between ? and ? ";
		
		
		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement( query );
			stmt.setString(1, id);
			stmt.setInt(2, startNum);
			stmt.setInt(3, startNum + scope -1);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				QnaEntity qna = new QnaEntity();
	            qna.setId(rs.getInt("id"));
	            qna.setType(rs.getString("type"));
	            qna.setTitle(rs.getString("title"));
	            qna.setContent(rs.getString("content"));
	            qna.setQna_date(rs.getString("qna_date"));
	            qna.setQna_edit(rs.getString("qna_edit"));
	            qna.setMembers_id(rs.getString("members_id"));
	            qna.setQna_pas(rs.getString("qna_pas"));
	            qna.setStep(rs.getInt("step"));
	            qna.setRef(rs.getInt("ref"));
				
				listaa.add(qna);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			close(con);
		}
		
		return listaa;
	}

	public int totallRow(String id) 
	{
		int totallRow=0;
		
		String query = " select count(*) from z_qna "
				+ " where members_id = ? ";
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			stmt = con.prepareStatement(query);
			stmt.setString(1, id);
			
			rs = stmt.executeQuery();
			rs.next();
			
			totallRow = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close(stmt);
			close(con);
		}
		return totallRow;
	}

	public QnaEntity selectt(int ref) 
	{
		QnaEntity qnaa = null;
		
		String query = " select * from z_qna " 
		+ " where ref = ? "
		+ "and step = 1";
	
		PreparedStatement stmt = null;
		ResultSet rs = null;
	
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, ref);
	
			rs = stmt.executeQuery();
	
			if (rs.next()) {
				qnaa = new QnaEntity();
				qnaa.setId(rs.getInt("id"));
				qnaa.setType(rs.getString("type"));
				qnaa.setTitle(rs.getString("title"));
				qnaa.setContent(rs.getString("content"));
				qnaa.setQna_date(rs.getString("qna_date"));
				qnaa.setQna_edit(rs.getString("qna_edit"));
				qnaa.setMembers_id(rs.getString("members_id"));
				qnaa.setQna_pas( rs.getString("qna_pas"));
				qnaa.setStep( rs.getInt("step"));
				qnaa.setRef( rs.getInt("ref"));
			}
	
		} catch (Exception e) {
			e.printStackTrace();
	
		} finally {
			close(rs);
			close(stmt);
			close(con);
		}
	
		return qnaa;
	}

	public int updateRe(QnaEntity qna) 
	{
		int result1 = 0;
		 
		 String query = 
	               "   update z_qna  "
	               + "  set    type= ?,  title = ? ,  qna_pas = ?  " + "  where  ref = ?  "  + "  and id > ?  " ;

		Connection con = null;
        PreparedStatement stmt = null;
        
        try {
           con = ds.getConnection();
           stmt = con.prepareStatement( query );
           stmt.setString(1, qna.getType());
           stmt.setString(2, qna.getTitle());
           stmt.setString(3, qna.getQna_pas());
           stmt.setInt(4, qna.getRef());
           stmt.setInt(5, qna.getId());
           
           
            result1 = stmt.executeUpdate();
           
        } catch(Exception e) {
           e.printStackTrace();
        
        } finally {
           close(stmt);
           close(con);
        }
        return result1;
	}

	public int deletee(QnaEntity qna) 
	{
		int result1 = 0;
		
		String query =
				"  delete from z_qna "
				         + "   where   ref = ? ";
		
		  Connection con = null;
	      PreparedStatement stmt = null;
	      
	      try {
	          con = ds.getConnection();
	          stmt = con.prepareStatement(query);
	          
	          stmt.setInt(1, qna.getRef());
	          
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
