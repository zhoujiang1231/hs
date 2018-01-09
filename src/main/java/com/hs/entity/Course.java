package com.hs.entity;

import java.io.Serializable;

/**
 * Created by zj on 2018年1年9日.
 */
public class Course implements Serializable {
    private int	cid;
    private  int	cno;
    private String	cname;
    private  String	cteacher;
    private  int	ctype;
    private  int	chour;
    private  float cgrade;

    public Course() {
    }

    public Course(int cid, int cno, String cname, String cteacher, int ctype, int chour, float cgrade) {
        this.cid = cid;
        this.cno = cno;
        this.cname = cname;
        this.cteacher = cteacher;
        this.ctype = ctype;
        this.chour = chour;
        this.cgrade = cgrade;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCteacher() {
        return cteacher;
    }

    public void setCteacher(String cteacher) {
        this.cteacher = cteacher;
    }

    public int getCtype() {
        return ctype;
    }

    public void setCtype(int ctype) {
        this.ctype = ctype;
    }

    public int getChour() {
        return chour;
    }

    public void setChour(int chour) {
        this.chour = chour;
    }

    public float getCgrade() {
        return cgrade;
    }

    public void setCgrade(float cgrade) {
        this.cgrade = cgrade;
    }
}
