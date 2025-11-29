package wsd.cillah.jspcrud.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    private static final String DRIVER = "org.mariadb.jdbc.Driver";
    private static final String URL = "jdbc:mariadb://walab.handong.edu:3306/W25_22000236";
    private static final String USER = "W25_22000236"; // 또는 설정한 유저명
    private static final String PASSWORD = "ieH4ee";

    // 2. 연결 객체를 반환하는 메서드
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // 드라이버 로드
            Class.forName(DRIVER);
            // 연결 시도
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("DB 연결 성공!");
        } catch (ClassNotFoundException e) {
            System.err.println("드라이버 로드 실패: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("DB 연결 실패: " + e.getMessage());
        }
        return conn;
    }

    // 3. (선택) 연결 해제 메서드
    public static void close(Connection conn) {
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    public static void main(String[] args) {
//        Connection conn = JDBCUtil.getConnection();
//        if (conn != null) {
//            System.out.println("DB 연결 성공!");
//        }
//    }
}
