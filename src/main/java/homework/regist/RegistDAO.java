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
	
	//아이디 중복확인을 위한 메서드 정의
	public boolean idOverlap(String id) {
		//초기값은 true로 설정. 중복된 아이디가 없는 경우
		boolean retValue = true; //0이면 중복된 아이디가 없는거니까 true
		//중복된 아이디가 있는지 확인하는 쿼리문 (인파라미터가 있는 쿼리문 작성)
		String query = "SELECT COUNT(*) FROM regist_member WHERE id=? ";
		
		try {
			//prepare객체 생성 및 인파리미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			//rs= ResultSet 멤버변수
			//SELECT계열의 쿼리문이므로 반환타입은 ResultSet 
			rs = psmt.executeQuery();
			//커서 이동시켜서 코드 읽어줌 count()를 사용하기 때문에 결과값은 무조건 있음 0 아니면 1임
			//따라서 if()문을 사용할 필요없이 next()를 호출
			rs.next();
			int result = rs.getInt(1);
			//중복된 아이디가 있을때 1이 반환되면서 false을 반환함
			if(result == 1) {
				retValue = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		//중복된 아이디가 없다면 0이므로 true를 반환한다.
		return retValue;
		
	}
}
