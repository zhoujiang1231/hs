package com.hs.entity;

import java.io.Serializable;

/**
 * Created by zj on 2018年1年10日.
 */
public class Teacher implements Serializable{
    int	tid;
    String	tName;
    String	tPassword;

    public Teacher() {
    }

    public Teacher(String tName, String tPassword) {
        this.tName = tName;
        this.tPassword = tPassword;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
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
}
