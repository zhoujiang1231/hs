package com.hs.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 导出成绩表用到的entity
 * @Author: zj
 * @Date: 2018-05-03
 **/
@JsonIgnoreProperties(ignoreUnknown = true)
public class ExportGradeEntity extends BaseEntity {
    private String cName;
    private String cType;
    private String cTeacher;
    private float grade;

    public ExportGradeEntity() {
    }

    public ExportGradeEntity(String cName, String cType, String cTeacher, float grade) {
        this.cName = cName;
        this.cType = cType;
        this.cTeacher = cTeacher;
        this.grade = grade;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcType() {
        return cType;
    }

    public void setcType(String cType) {
        this.cType = cType;
    }

    public String getcTeacher() {
        return cTeacher;
    }

    public void setcTeacher(String cTeacher) {
        this.cTeacher = cTeacher;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }
}
