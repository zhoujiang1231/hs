package com.hs.entity.common;


import java.io.Serializable;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
public class ResponseData implements Serializable{
    private List list;
    private Object data;
    private String result;
    private String msg;

    public ResponseData() {
    }

    public ResponseData(String result, String msg) {
        this.result = result;
        this.msg = msg;
    }

    public ResponseData(List list, Object data, String result, String msg) {
        this.list = list;
        this.data = data;
        this.result = result;
        this.msg = msg;
    }

    public List<Object> getList() {
        return list;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public static ResponseData success(){
        ResponseData responseData = new ResponseData("0","success");
        return responseData;
    }
}
