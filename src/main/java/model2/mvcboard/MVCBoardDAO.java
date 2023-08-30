package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import model1.board.BoardDTO;

//커넥션풀을 통한 DB연결을 위해 클래스 상속
public class MVCBoardDAO extends DBConnPool {
	
	//기본생성자 (정의하지 않아도 자동으로 삽입된다.)
	public MVCBoardDAO() {
		super();
	}
	
	/* 게시물의 갯수를 카운트한다. 
	 	검색어가 있는 경우 where절을 추가하여 조건에 맞는 게시물을 카운트한다. */
	public int selectCount(Map<String, Object> map) {
		
		//게시물의 갯수를 반환하기 위한 변수
		int totalCount = 0;
		
		//게시물 수를 얻어오기 위한 쿼리문 작성
		String query ="SELECT COUNT(*) FROM mvcboard";
		/* 검색어가 없는 경우 WHERE절이 없는 경우 전체를 가져오고 
		 검색어가 있는 경우 WHERE절을 추가하여 조건에 맞는 게시물만 SELECT한다. */
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord")+ "%' ";
		}
		try {
			//인파라미터가 없는 정적쿼리문이므로 statement 객체 생성
			stmt = con.createStatement();
			//쿼리문 실행 후 결과는 ResultSet으로 반환한다.
			rs = stmt.executeQuery(query);
			//rs.next() -- select 결과가 한개 두개 세개, 읽어내면서 결과가 있는지 확인하고 있으면 꺼내온다.
			//커서를 첫번째 행으로 이동하여 레코드를 읽는다.
			/* count(*)는 항상 결과값이 있다. 조건에 맞는게 없으면 0, 
			  있다면 1이상의 값이 항상 반환된다.*/
			rs.next();
			//첫번째 컬럼(count 함수를 의미)의 값을 가져와서 변수에 저장한다.
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//목록에 출력할 게시물을 얻어오기 위한 메서드
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map){
		//mvcboard 테이블을 대상으로 하므로 타입매개변수 확인
		/*List 계열의 컬렉션을 생성한다. (ArrayList, Link~)
		 이때 타입 매개변수는 mvcboard테이블을 대상으로 하므로 MVCBoardDTO로 설정한다.*/
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>(); 
		
		
		/*페이징 처리를 위한 서브쿼리문. 특정 페이지에 해당하는 rownum의
		구간으로 게시물을 인출한다. */
		String query = " " 
					+ "SELECT * FROM ( "
					+ "		SELECT Tb.*, ROWNUM rNum FROM ( "
					+ "			SELECT * FROM mvcboard ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
					+" LIKE '%" + map.get("searchWord") + "%' ";
		}
			query += "		ORDER BY idx DESC "
					+"   ) Tb "
					+" ) "
					+" WHERE rNum BETWEEN ? AND ?";
		try {
			/* 인파라미터가 있는 동적쿼리문으로 
			 	prepared 객체 생성 및 인파라미터 설정 */
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5)); //날짜이므로 getDate()사용
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8)); //숫자이므로 getInt()사용
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
				board.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
}
