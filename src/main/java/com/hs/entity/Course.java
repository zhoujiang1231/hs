package com.hs.entity;

import java.io.Serializable;

/**
 * Created by zj on 2018年1年9日.
 */
public class Course implements Serializable {
    private int cId;
    private String cName;
    private  String cTeacher;
    private  int cType;
    private  int cHour;
    private  float cMark;
    private int cTotal;
    private int cChosed;

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

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
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

    public int getcType() {
        return cType;
    }

    public void setcType(int cType) {
        this.cType = cType;
    }

    public int getcHour() {
        return cHour;
    }

    public void setcHour(int cHour) {
        this.cHour = cHour;
    }

    public float getcMark() {
        return cMark;
    }

    public void setcMark(float cMark) {
        this.cMark = cMark;
    }

    public int getcTotal() {
        return cTotal;
    }

    public void setcTotal(int cTotal) {
        this.cTotal = cTotal;
    }

    public int getcChosed() {
        return cChosed;
    }

    public void setcChosed(int cChosed) {
        this.cChosed = cChosed;
    }
}
