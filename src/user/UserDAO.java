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
		// ��ɾ�� �빮�ڷ� �ϴ°� �� ���� �������� ���ؼ�
		try {
			pstmt = conn.prepareStatement(sql);
			// db�� ����� conn�� ������ sql���� ���� prepareStatement����
			// prepare�� ������ ����, �ƴϸ� �������� ���� ��
			pstmt.setString(1, userID);
			// �� ����
			rs = pstmt.executeQuery();
			// ��� ���� sql ��ɹ��� ������ ���� ����
			if (rs.next()) {
				// ���� ���̵� ��ġ�ϴ� ��й�ȣ�� ����
				if (rs.getString(1).equals(userPW)) {
					// ���̵�� ��й�ȣ�� ��ġ ���θ� ��

					return 1; // ��ġ
				} else
					return 0; // ��ġ ���� ����
			} else {
				// ���̵� �������� ����
				return -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // db����
	}
	
	public int join(User user) {
		String sql ="INSERT INTO user VALUES(? ,? ,? ,? ,? ,? ,? ,? ,? )";
		//-1�� �Ǵ� ��Ȳ�� id�� �ߺ��Ǽ� �׷���?
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
		return -1;//primary Ű������ ������ ������ ������ 
	}
}
