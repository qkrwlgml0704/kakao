package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/kkf?useSSL=true";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, "root", "qweqaz156!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPW) {
		String sql = "select userPW from user where userID =?";
		// 명령어는 대문자로 하는게 더 좋음 가독성을 위해서
		try {
			pstmt = conn.prepareStatement(sql);
			// db가 연결된 conn에 실제로 sql문을 삽입 prepareStatement에서
			// prepare가 붙으면 동적, 아니면 정적으로 값을 늠
			pstmt.setString(1, userID);
			// 값 세팅
			rs = pstmt.executeQuery();
			// 결과 값에 sql 명령문을 실행한 값을 대입
			if (rs.next()) {
				// 보낸 아이디에 일치하는 비밀번호가 있음
				if (rs.getString(1).equals(userPW)) {
					// 아이디와 비밀번호가 일치 여부를 봄

					return 1; // 일치
				} else
					return 0; // 일치 하지 않음
			} else {
				// 아이디가 존재하지 않음
				return -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // db오류
	}
	
	public int join(User user) {
		String sql ="INSERT INTO user VALUES(? ,? ,? ,? ,? ,? ,? ,? ,? )";
		//-1이 되는 상황이 id가 중복되서 그런가?
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, user.getUserPW());
			pstmt.setString(4, user.getUserBirth());
			pstmt.setString(5, user.getFrontNumber());
			pstmt.setString(6, user.getBackNumber());
			pstmt.setString(7, user.getUserEmail());
			pstmt.setString(8, user.getEmailDomain());
			pstmt.setString(9, user.getEmailStatus());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;//primary 키로인해 위에서 에러가 나오면 
	}
}
