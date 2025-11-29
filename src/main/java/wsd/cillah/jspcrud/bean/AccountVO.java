package wsd.cillah.jspcrud.bean;


import java.sql.Date;

public class AccountVO {
    private int id;
    private Date date;
    private Date regdate;
    private String category;
    private String briefs;
    private int amount;

    public AccountVO(){

    };
    public AccountVO(Date date, String category, String briefs, int amount) {
        this.date = date;
        this.category = category;
        this.briefs = briefs;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBriefs() {
        return briefs;
    }

    public void setBriefs(String briefs) {
        this.briefs = briefs;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}


