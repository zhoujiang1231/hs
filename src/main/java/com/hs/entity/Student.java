package com.hs.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
public class Student implements Serializable {
    private int stuId;
    private String stuName;
    private String stuPassword;
    private String stuAddress;
    private String stuEmail;
    private int stuSex;
    private String stuNo;
    private String stuTel;
    private String stuDepart;
    private String stuIdcard;
    private Date creatTime;
    private List<Course> lc;

    public Student() {
    }

    public Student(String stuNo, String stuPassword) {
        this.stuNo = stuNo;
        this.stuPassword = stuPassword;
    }

    public Student(int stuId, String stuName, String stuPassword, String stuAddress, String stuEmail, int stuSex, String stuNo, String stuTel, String stuDepart, String stuIdcard) {
        this.stuId = stuId;
        this.stuName = stuName;
        this.stuPassword = stuPassword;
        this.stuAddress = stuAddress;
        this.stuEmail = stuEmail;
        this.stuSex = stuSex;
        this.stuNo = stuNo;
        this.stuTel = stuTel;
        this.stuDepart = stuDepart;
        this.stuIdcard = stuIdcard;
    }

    public int getStuId() {
        return stuId;
    }

    public void setStuId(int stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuPassword() {
        return stuPassword;
    }

    public void setStuPassword(String stuPassword) {
        this.stuPassword = stuPassword;
    }

    public String getStuAddress() {
        return stuAddress;
    }

    public void setStuAddress(String stuAddress) {
        this.stuAddress = stuAddress;
    }

    public String getStuEmail() {
        return stuEmail;
    }

    public void setStuEmail(String stuEmail) {
        this.stuEmail = stuEmail;
    }

    public int getStuSex() {
        return stuSex;
    }

    public void setStuSex(int stuSex) {
        this.stuSex = stuSex;
    }

    public String getStuNo() {
        return stuNo;
    }

    public void setStuNo(String stuNo) {
        this.stuNo = stuNo;
    }

    public String getStuTel() {
        return stuTel;
    }

    public void setStuTel(String stuTel) {
        this.stuTel = stuTel;
    }

    public String getStuDepart() {
        return stuDepart;
    }

    public void setStuDepart(String stuDepart) {
        this.stuDepart = stuDepart;
    }

    public String getStuIdcard() {
        return stuIdcard;
    }

    public void setStuIdcard(String stuIdcard) {
        this.stuIdcard = stuIdcard;
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