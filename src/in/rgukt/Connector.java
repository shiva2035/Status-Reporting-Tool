package in.rgukt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Connector {
	static Connection con = null;
	public Connection connect(){
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@hyd-sb1:1521:orcl", "system","password");
			if(con!=null)
				System.out.print("Connected");
		}
		catch(ClassNotFoundException e)
		{
			System.out.print("Unable to load driver");
			e.getStackTrace();
		}
		catch(SQLException e)
		{
			System.out.println("Not Connected");
			e.getStackTrace();
		}
		return con;
	}
	public void close() throws SQLException{
		if(con!=null){
			con.close();
		}
	}
	public ResultSet executeMyQuery(String query) throws SQLException{
		ResultSet rs=null;
		Connection con1 = null;
		PreparedStatement ps = null;
		try{
			con1 = connect();
			ps = con1.prepareStatement(query);
			rs = ps.executeQuery();
		}catch(SQLException ex){
			;
		}finally{
//			ps.close();
//			con1.close();
		}
		return rs;
	}
	public boolean executeMyStatements(String query){
		Statement stmt = null;
		Connection con1= null;
		Statement st = null; 
		boolean cond = false;
		try{
			con1 = connect();
			st = con1.createStatement();
			st.executeUpdate(query);
			cond = true;
		}catch(SQLException ex){
			System.out.println("Error:"+ex);
		}
		finally{
//			stmt.close();
//			con1.close();
		}
		return cond;
	}
}
