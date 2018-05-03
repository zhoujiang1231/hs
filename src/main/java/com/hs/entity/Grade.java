package com.hs.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.Date;
import java.util.List;

/**
 * @Author: zj
 * @Date: 2018-05-02
 **/
@JsonIgnoreProperties(ignoreUnknown = true)
public class Grade extends BaseEntity{

    Integer	gId;    //
    Integer	cId;    //
    Integer	stuId;  //
    float	grade;  //
    List<Course> lc ;
    Date createTime;//

    public Grade() {
    }

    public Grade(Integer cId, Integer stuId, float grade) {
        this.cId = cId;
        this.stuId = stuId;
        this.grade = grade;
    }

    public Integer getgId() {
        return gId;
    }

    public void setgId(Integer gId) {
        this.gId = gId;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public List<Course> getLc() {
        return lc;
    }

    public void setLc(List<Course> lc) {
        this.lc = lc;
    }
}
