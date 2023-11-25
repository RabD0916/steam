package steam;

import java.sql.*;


public class MemberMgr {
	// STEAM Project ->  테이블 명 수정 필요 -> 수정 완료 Table Steam
	
	

	private DBConnectionMgr pool;

	public MemberMgr() {
		try {
			/* ① MemberMgr 생성자 내부에 데이터베이스 연결 pool 객체를 얻음.입력하세요 */
			pool = DBConnectionMgr.getInstance();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ID 중복확인
	public boolean checkId(String u_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			/* ② 얻어진 pool로 Connection을 얻음.입력하세요. */
			con = pool.getConnection();

			
			
			sql = "select u_id from User where u_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);

			/* ③ id가 존재하면 true, 같은 아이디가 존재하지 않으면 false.입력하세요 */
			flag = pstmt.executeQuery().next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			/* ④ 사용된 Connection 을 반환. 재사용위해 닫지 않고 그냥 반환만.입력하세요 */
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// 회원가입
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			/* ⑤ 얻어진 pool로 Connection을 얻음.입력하세요. */
			con = pool.getConnection();

			sql = "INSERT INTO User (u_id,u_pwd,u_name,u_phone,u_email)values(?,?,?,?,?)";
			
			// Steam 수정 필요!!!!
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getU_id());
			pstmt.setString(2, bean.getU_pwd());
			pstmt.setString(3, bean.getU_name());
			pstmt.setString(4, bean.getU_phone());
			pstmt.setString(5, bean.getU_email());
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// 로그인
	public boolean loginMember(String u_id, String u_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select u_id from User where u_id = ? and u_pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.setString(2, u_pwd);
			rs = pstmt.executeQuery();

			/* ⑥전달받은 id와 passwd가 일치하는 레코드가 있다면 true 반환.입력하세요 */
			flag = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
}
