package com.hs.entity;

import java.io.Serializable;

/**
 * Created by zj on 2018年1年9日.
 */
public class Course implements Serializable {
    private int	cid;
    private  String	cno;
    private String	cname;
    private  String	cteacher;
    private  int	ctype;
    private  int	chour;
    private  float cmark;

    public Course() {
    }

    public Course(int cid, String cno, String cname, String cteacher, int ctype, int chour, float cmark) {
        this.cid = cid;
        this.cno = cno;
        this.cname = cname;
        this.cteacher = cteacher;
        this.ctype = ctype;
        this.chour = chour;
        this.cmark = cmark;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
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

    public float getCmark() {
        return cmark;
    }

    public void setCmark(float cmark) {
        this.cmark = cmark;
    }
}
