package com.hs.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
public class Student extends BaseEntity {
    private Integer stuId;
    private String stuName;
    private String stuPassword;
    private String stuAddress;
    private String stuEmail;
    private Integer stuSex;
    private String stuNo;
    private String stuTel;
    private String stuDepart;
    private String stuIdcard;
    private Integer userType = 2;
    private Date creatTime;
    private List<Course> lc = new ArrayList<Course>();

    public Student() {
    }

    public Student(String stuNo, String stuPassword) {
        this.stuNo = stuNo;
        this.stuPassword = stuPassword;
    }

    public Student(Integer stuId, String stuName, String stuPassword, String stuAddress, String stuEmail, Integer stuSex, String stuNo, String stuTel, String stuDepart, String stuIdcard) {
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

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
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

    public Integer getStuSex() {
        return stuSex;
    }

    public void setStuSex(Integer stuSex) {
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

    public Date getCreatTime() {
        return this.creatTime;
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