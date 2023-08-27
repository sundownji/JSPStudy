package homework.regist;

import common.JDBConnect;
import jakarta.servlet.ServletContext;
//dao - 쿼리문을 실행하기 위함
public class RegistDAO extends JDBConnect{
	
	//DB연결을 위한 인수생성자 정의
	public RegistDAO(ServletContext app) {
		super(app);
	}

	//회원정보 입력을 위한 메서드 정의
	public int registInsert(RegistDTO dto) {
	
		int result = 0;
		String query = " INSERT INTO regist_member VALUES ("
				+ "    ?,?,?,?,?,?,?,"
				+ "    ?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getMailing());
			psmt.setString(6, dto.getZipcode());
			psmt.setString(7, dto.getAddr1());
			psmt.setString(8, dto.getAddr2());
			psmt.setString(9, dto.getMobile());
			psmt.setString(10, dto.getSms());
			//실행
			result= psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("뭐라고 말할까 뭐라고 말할까~");
			e.printStackTrace();
		}
		//반환값 0이면 false
		return result;
	}
	
	public boolean isIdExist(String id) {
		String query = "SELECT COUNT(*) FROM regist_member WHERE id=? ";
		int count = 0;
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}
			catch(Exception e) {
				e.printStackTrace();
			
		}
		return count > 0;
		
	}
}
