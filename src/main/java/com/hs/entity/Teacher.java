package com.hs.entity;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by zj on 2018年1年10日.
 */
public class Teacher extends BaseEntity{
    private Integer tId;
    private String	tName;
    private String	tPassword;
    private Date creatTime;
    private Integer userType;
    private List<Course> lc = new ArrayList<Course>();

    public Teacher() {
    }

    public Teacher(Integer tId) {
        this.tId = tId;
    }

    public Teacher(String tName, String tPassword) {
        this.tName = tName;
        this.tPassword = tPassword;
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
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

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }
}
