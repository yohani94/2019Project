package kr.ac.knu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.ac.knu.entity.FaqEntity;
import kr.ac.knu.entity.QnaEntity;

public class FaqDAO extends CommonDAO
{
	Connection con  = null;

	public int insert(FaqEntity faq) 
	{
			int result = 0;
		
			String query = 
				"	insert into z_faq "
				+ " values(z_faq_seq.nextval, ?, ?, ?) ";
	
			Connection con = null;
			
			PreparedStatement stmt = null;
			
			try {
			con = ds.getConnection();
			stmt = con.prepareStatement( query );
			stmt.setString(1, faq.getFaq_type() );
			stmt.setString(2, faq.getFaq_title() );
			stmt.setString(3, faq.getFaq_content() );
			
			result = stmt.executeUpdate();
			
			} catch(Exception e) {
			e.printStackTrace();
			
			} finally {
			close(stmt);
			close(con);
			}
			
			return result;
	}

	public ArrayList<FaqEntity> selectAll(int sstartNum, int sscope, String ftype) 
	{
		ArrayList<FaqEntity> lista = new ArrayList<FaqEntity>();	
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String query = " select rownum rnum, c.* "
				+ " from ( " 
				+ " select rownum rnum, b.* "
				+ " from ( "
				+ " select * from z_faq "
				+ " where faq_type like ?"
				+ " order by faq_number asc) b ) c "
				+ " where rnum between ? and ? ";

		
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement( query );
			stmt.setString(1, ftype);
			stmt.setInt(2, sstartNum);
			stmt.setInt(3, sstartNum + sscope -1);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				FaqEntity faq = new FaqEntity();
				
	            faq.setFaq_number(rs.getInt("faq_number"));
	            faq.setFaq_type(rs.getString("faq_type"));
	            faq.setFaq_title(rs.getString("faq_title"));
	            faq.setFaq_content(rs.getString("faq_content"));
	            
				lista.add(faq);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			close(con);
		}
		
		return lista;
	}

	public FaqEntity select(int faq_number) 
	{
		FaqEntity faq = null;

		String query = " select * from z_faq " 
		+ " where faq_number = ? ";
	
		PreparedStatement stmt = null;
		ResultSet rs = null;
	
		try {
			con = ds.getConnection();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, faq_number);
	
			rs = stmt.executeQuery();
	
			if (rs.next()) {
				faq = new FaqEntity();
				faq.setFaq_number(rs.getInt("faq_number"));
				faq.setFaq_type(rs.getString("faq_type"));
				faq.setFaq_title(rs.getString("faq_title"));
				faq.setFaq_content(rs.getString("faq_content"));
				
			}
	
		} catch (Exception e) {
			e.printStackTrace();
	
		} finally {
			close(rs);
			close(stmt);
			close(con);
		}
	
		return faq;
	}

	public int delete(String faq_number) 
	{
		int result = 0;
		
		String query =
				"  delete from z_faq "
				         + "   where   faq_number = ? ";
		
		  Connection con = null;
	      PreparedStatement stmt = null;
	      
	      try {
	          con = ds.getConnection();
	          stmt = con.prepareStatement(query);
	          
	          stmt.setInt(1, Integer.parseInt(faq_number));
	          
	          result = stmt.executeUpdate();
	          
	       }catch(Exception e)   {
	          e.printStackTrace();
	          
	       } finally   {
	          close(stmt);
	          close(con);
	       }
	          
	          return result;
	}

	public int update(FaqEntity faq) 
	{
		int result = 0;
		 
		 String query = 
	               "   update z_faq "
	               + " set    faq_type = ?,  faq_title = ? , faq_content = ? " + " where   faq_number = ? " ;

		 Connection con = null;
        PreparedStatement stmt = null;
        
        try {
           con = ds.getConnection();
           stmt = con.prepareStatement( query );
           stmt.setString(1, faq.getFaq_type());
           stmt.setString(2, faq.getFaq_title());
           stmt.setString(3, faq.getFaq_content());
           stmt.setInt(4, faq.getFaq_number());
           
            result = stmt.executeUpdate();
           
        } catch(Exception e) {
           e.printStackTrace();
        
        } finally {
           close(stmt);
           close(con);
        }
        return result;
	}

	public int totalRow(String ftype)
	{
		int ttotalRow=0;
		
		String query = " select count(*) from z_faq "
				+ " where  faq_type like ? ";
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			stmt = con.prepareStatement(query);
			stmt.setString(1, ftype);
			
			rs = stmt.executeQuery();
			rs.next();
			
			ttotalRow = rs.getInt(1); 
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close(stmt);
			close(con);
		}
		return ttotalRow;
		
	}

}
