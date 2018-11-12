package item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class itemDAO {
	private Connection conn;
	private ResultSet rs;
	//executeUpdate�� insert, delete, update�� �����͸� �ٷ�� ���� �� �� ���(���尰��?)
	//executeQuery�� ���� ����� resultSet�� �����ϱ� ���� �� select �� ���
	//execute�� ��� ���� ��� ����(ddl(����) ,dml(����) ,dcl(��Ʈ��))
	
		public itemDAO(){
			try {
				String dbURL = "jdbc:mysql://localhost:3306/kkf?autoReconnect=true&useSSL=false";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL,"root","qweqaz156!");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		public int getNext(String pageDB) {
			String SQL = null ;
			if(pageDB == "bestItem") 
				SQL ="SELECT * FROM bestItem ORDER BY number DESC";
			else if(pageDB == "normalItem")
				SQL ="SELECT * FROM normalItem ORDER BY number DESC";
			//desc ������ asc �ø���
			try {
				PreparedStatement pstmt =conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					int result = rs.getInt(4)+1; 
					return result;
				}
				return 1; //ù �Խù�
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
		}

		public ArrayList<everyItem> getItemlist(int pageNumber, String pageDB){
			//0�� best item 1~ n������ ������
			ArrayList<everyItem> list = new ArrayList<everyItem>();
			String SQL =null;
			if(pageDB == "bestItem") 
				SQL ="SELECT * FROM bestItem WHERE number <?  ORDER BY number DESC LIMIT 20";
			else if(pageDB == "normalItem")
				SQL ="SELECT * FROM normalItem WHERE number <?  ORDER BY number DESC LIMIT 20";
			try {
				PreparedStatement pstmt =conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext(pageDB) - (pageNumber-1)* 20);
				System.out.println("page �� : "+pageNumber+"number �� : "+ (getNext(pageDB) - (pageNumber-1)* 20));
				//pagenumber�� 0���� ����
				rs = pstmt.executeQuery();
				while(rs.next()) {
					everyItem ei = new everyItem();
					ei.setImgName(rs.getString(1));
					ei.setGoodsName(rs.getString(2));
					ei.setGoodsPrice(rs.getString(3));
					ei.setNumber(rs.getInt(4));
					if(pageDB == "normalItem")
					ei.setSources(rs.getString(5));
					list.add(ei);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return list;
		}
		
		public everyItem getItem(String imgName, String imgFolder) {
			String SQL = null;
			if(imgFolder.equals("section_best")) { 
				//equals�ϴ� ������ pageDB�� imgName��  request.getParameter���� �޾ƿԱ� ����
				//equals true�� ���� ��ü�̰� �ٸ� ��ü�̰� ������� ��ü�� �����ϰ� �ִ� �����Ͱ� �������� ���մϴ�. 
				SQL ="SELECT * FROM bestItem WHERE imgName =?";
			}
			else if(imgFolder.equals("section_ryan1")) {
				SQL ="SELECT * FROM normalItem WHERE imgName =?";
			}
			try{ 
				PreparedStatement pstmt =conn.prepareStatement(SQL);
				pstmt.setString(1,imgName);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					//next�� ó������ ������
					everyItem ei = new everyItem();
					ei.setImgName(rs.getString(1));
					ei.setGoodsName(rs.getString(2));
					ei.setGoodsPrice(rs.getString(3));
					ei.setNumber(rs.getInt(4));
					ei.setSources(rs.getString(5));
					return ei;
				}
				}catch(Exception e){
				e.printStackTrace();
			}
			return null;
		}
		
		public boolean nextPage(int pageNumber) {
			String SQL ="SELECT * FROM normalItem WHERE number <?";
			//desc�� ������ �� asc�� �ø��� ��
			try {
				PreparedStatement pstmt =conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext("normalItem") - pageNumber *20);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return false;//db����
		}
		
		public int fileUpload(String imgName,String goodsName, String goodsPrice) {
			String SQL = "insert into normalItem value(?, ?, ?, ?, ?)";
			try {
				PreparedStatement pstmt =conn.prepareStatement(SQL);
				pstmt.setString(1, imgName);
				pstmt.setString(2, goodsName);
				pstmt.setString(3, goodsPrice);
				pstmt.setInt(4, getNext("normalItem"));
				pstmt.setString(5, "section_ryan1");
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				}
			return -1;
		}
		
}
