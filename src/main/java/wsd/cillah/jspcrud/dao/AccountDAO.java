package wsd.cillah.jspcrud.dao;

import wsd.cillah.jspcrud.bean.AccountVO;
import wsd.cillah.jspcrud.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String ACCOUNT_INSERT = "INSERT INTO ACCOUNT (date, category, briefs, amount) VALUES (?, ?, ?, ?)";
    private final String ACCOUNT_LIST = "select * from ACCOUNT order by date";

    public List<AccountVO> getAccountList(){

        List<AccountVO> list = new ArrayList<AccountVO>();
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(ACCOUNT_LIST);
            rs = stmt.executeQuery();
            while (rs.next()) {
                AccountVO account = new AccountVO();
                account.setId(rs.getInt("id"));
                account.setDate(rs.getDate("date"));
                account.setCategory(rs.getString("category"));
                account.setBriefs(rs.getString("briefs"));
                account.setAmount(rs.getInt("amount"));
                account.setRegdate(rs.getDate("regdate"));

                list.add(account);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int insertAccount(AccountVO vo) {
        System.out.println("Inside insetAccount");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(ACCOUNT_INSERT);
            stmt.setDate(1, vo.getDate());
            stmt.setString(2, vo.getCategory());
            stmt.setString(3, vo.getBriefs());
            stmt.setInt(4, vo.getAmount());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

//    public static void main(String[] args) {
//        Date now = new Date(System.currentTimeMillis());
//        AccountVO vo = new AccountVO(now, "수입","급여",3000000);
//        AccountDAO dao = new AccountDAO();
//        int result = dao.insetAccount(vo);
//        if (result == 1) {
//            System.out.println("데이터 추가 완료!");
//        }
//    }
}
