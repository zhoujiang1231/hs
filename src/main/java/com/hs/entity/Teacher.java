package com.hs.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by zj on 2018年1年10日.
 */
public class Teacher implements Serializable{
    int tId;
    String	tName;
    String	tPassword;
    Date creatTime;

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
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = simpleDateFormat.format(this.creatTime);
        return s;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }
}
