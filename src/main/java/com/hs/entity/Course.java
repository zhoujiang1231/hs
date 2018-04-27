package com.hs.entity;

import java.util.Date;

/**
 * Created by zj on 2018年1年9日.
 */
public class Course extends BaseEntity{
    private Integer cId;
    private String cName;
    private Integer tId;
    private String cTeacher;
    private Integer cType;
    private Integer cHour;
    private float cMark;
    private Integer cTotal;
    private Integer cChosed;
    private Integer userType;
    private Date createTime;

    public Course() {
    }

    public Course(int cId, String cName, String cTeacher, int cType, int cHour, float cMark) {
        this.cId = cId;
        this.cName = cName;
        this.cTeacher = cTeacher;
        this.cType = cType;
        this.cHour = cHour;
        this.cMark = cMark;
    }


    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcTeacher() {
        return cTeacher;
    }

    public void setcTeacher(String cTeacher) {
        this.cTeacher = cTeacher;
    }

    public Integer getcType() {
        return cType;
    }

    public void setcType(Integer cType) {
        this.cType = cType;
    }

    public Integer getcHour() {
        return cHour;
    }

    public void setcHour(Integer cHour) {
        this.cHour = cHour;
    }

    public float getcMark() {
        return cMark;
    }

    public void setcMark(float cMark) {
        this.cMark = cMark;
    }

    public Integer getcTotal() {
        return cTotal;
    }

    public void setcTotal(Integer cTotal) {
        this.cTotal = cTotal;
    }

    public Integer getcChosed() {
        return cChosed;
    }

    public void setcChosed(Integer cChosed) {
        this.cChosed = cChosed;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
