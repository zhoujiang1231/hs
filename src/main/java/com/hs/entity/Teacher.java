package com.hs.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by zj on 2018年1年10日.
 */
public class Teacher implements Serializable{
    private int tId;
    private  String	tName;
    private String	tPassword;
    private Date creatTime;
    private List<Course> lc = new ArrayList<Course>();

    public Teacher() {
    }

    public Teacher(int tId) {
        this.tId = tId;
    }

    public Teacher(String tName, String tPassword) {
        this.tName = tName;
        this.tPassword = tPassword;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String gettPassword() {
        return tPassword;
    }

    public void settPassword(String tPassword) {
        this.tPassword = tPassword;
    }

    public String getCreatTime() {
        if(this.creatTime!=null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String s = simpleDateFormat.format(this.creatTime);
            return s;
        }
        return "";
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public List<Course> getLc() {
        return lc;
    }

    public void setLc(List<Course> lc) {
        this.lc = lc;
    }
}
