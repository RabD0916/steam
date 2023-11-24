package steam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
	
public class PMemberMgr {	

	private DBConnectionMgr pool;

		public PMemberMgr() {
		try {
		/* MemberMgr 생성자 내부에 데이터베이스 연결 pool 객체를 얻음 */
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ID 중복확인
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			/* 얻어진 pool로 Connection을 얻음. */
			con = pool.getConnection();
			
			sql = "select u_id from user where u_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			/* id가 존재하면 true, 같은 아이디가 존재하지 않으면 false */
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			/* 사용된 Connection 을 반환. 재사용위해 닫지 않고 그냥 반환만 */
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}


	// 회원가입
	public boolean insertMember(PMemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert user(u_id,u_email,u_name,u_pwd,u_phone"
					+ ")values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getU_id());
			pstmt.setString(2, bean.getU_email());
			pstmt.setString(3, bean.getU_name());
			pstmt.setString(4, bean.getU_pwd());
			pstmt.setString(5, bean.getU_phone());
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
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from user where u_id = ? and u_pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	/*************
	 * ch17 필요한 메서드
	 * ************/

	// 회원정보 가져오기
	public PMemberBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PMemberBean bean = null;
		try {
			con = pool.getConnection();
			String sql = "select * from user where u_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new PMemberBean();
				bean.setU_id(rs.getString("u_id"));
				bean.setU_email(rs.getString("u_email"));
				bean.setU_name(rs.getString("u_name"));
				bean.setU_pwd(rs.getString("u_pwd"));
				bean.setU_phone(rs.getString("u_phone"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return bean;
	}

	// 회원정보 수정
	public boolean updateMember(PMemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			String sql = "update user set u_email=?,u_pwd=?,u_phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getU_email());
			pstmt.setString(2, bean.getU_pwd());
			pstmt.setString(3, bean.getU_phone());
			int count = pstmt.executeUpdate();
			if (count > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

}
	
	