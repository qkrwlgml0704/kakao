package item;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class itemDAO {
	private Connection conn;
	private ResultSet rs;
	//executeUpdate는 insert, delete, update등 데이터를 다루는 것을 할 때 사용(저장같은?)
	//executeQuery는 쿼리 결과를 resultSet에 저장하기 위한 것 select 때 사용
	//execute는 모든 쿼를 사용 가능(ddl(정의) ,dml(조작) ,dcl(컨트롤))
	
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
			//desc 내림차 asc 올림차
			try {
				PreparedStatement pstmt =conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					int result = rs.getInt(4)+1; 
					return result;
				}
				return 1; //첫 게시물
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
		}

		public ArrayList<everyItem> getItemlist(int pageNumber, String pageDB){
			//0은 best item 1~ n까지가 페이지
			ArrayList<everyItem> list = new ArrayList<everyItem>();
			String SQL =null;
			if(pageDB == "bestItem") 
				SQL ="SELECT * FROM bestItem WHERE number <?  ORDER BY number DESC LIMIT 20";
			else if(pageDB == "normalItem")
				SQL ="SELECT * FROM normalItem WHERE number <?  ORDER BY number DESC LIMIT 20";
			try {
				PreparedStatement pstmt =conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext(pageDB) - (pageNumber-1)* 20);
				System.out.println("page 값 : "+pageNumber+"number 값 : "+ (getNext(pageDB) - (pageNumber-1)* 20));
				//pagenumber은 0부터 시작
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
				//equals하는 이유는 pageDB랑 imgName은  request.getParameter으로 받아왔기 때문
				//equals true는 같은 객체이건 다른 객체이건 상관없이 객체가 저장하고 있는 데이터가 동일함을 뜻합니다. 
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
					//next는 처음부터 마지막
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
			//desc는 내림차 순 asc는 올림차 순
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
			return false;//db오류
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
