package com.hs.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 课表entity
 * @Author: zj
 * @Date: 2018-05-04
 **/
@JsonIgnoreProperties(ignoreUnknown = true)
public class ScheduleEntity extends BaseEntity {
    private String cTime;   // 上课时间 如第一大节课,第二大节课
    private String monday;   // 星期一课程
    private String tuesday;   // 星期二课程
    private String wednesday;   // 星期三课程
    private String thursday;   // 星期四课程
    private String friday;   // 星期五课程

    public ScheduleEntity() {
    }

    public ScheduleEntity(String cTime, String monday, String tuesday, String wednesday, String thursday, String friday) {
        this.cTime = cTime;
        this.monday = monday;
        this.tuesday = tuesday;
        this.wednesday = wednesday;
        this.thursday = thursday;
        this.friday = friday;
    }

    public String getcTime() {
        return cTime;
    }

    public void setcTime(String cTime) {
        this.cTime = cTime;
    }

    public String getMonday() {
        return monday;
    }

    public void setMonday(String monday) {
        this.monday = monday;
    }

    public String getTuesday() {
        return tuesday;
    }

    public void setTuesday(String tuesday) {
        this.tuesday = tuesday;
    }

    public String getWednesday() {
        return wednesday;
    }

    public void setWednesday(String wednesday) {
        this.wednesday = wednesday;
    }

    public String getThursday() {
        return thursday;
    }

    public void setThursday(String thursday) {
        this.thursday = thursday;
    }

    public String getFriday() {
        return friday;
    }

    public void setFriday(String friday) {
        this.friday = friday;
    }
}
