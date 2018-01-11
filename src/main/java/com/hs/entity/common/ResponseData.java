package com.hs.entity.common;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;

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
    private PageInfo pageInfo;
    private static ObjectMapper objectMapper = new ObjectMapper();

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
    public ResponseData(List list, Object data, String result, String msg,PageInfo pageInfo) {
        this.list = list;
        this.data = data;
        this.result = result;
        this.msg = msg;
        this.pageInfo = pageInfo;
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

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }

    public static String success(){
        ResponseData responseData = new ResponseData("0","success");
        return buildJsonStr(responseData);
    }
    public static String success(String parameter){
        ResponseData responseData = new ResponseData("0",parameter);
        return buildJsonStr(responseData);
    }

    public static String error(String msg){
        return buildJsonStr( new ResponseData("1",msg));
    }
    public static String buildList(List list){
        return buildJsonStr(new ResponseData(list,null,"0","success"));
    }
    public static String buildList(List list,PageInfo pageInfo){
        return buildJsonStr(new ResponseData(list,null,"0","success",pageInfo));
    }
    public static String buildData(Object data){
        return buildJsonStr(new ResponseData(null,data,"0","success"));
    }
    public static String buildJsonStr(ResponseData responseData){
        try {
            return objectMapper.writeValueAsString(responseData);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "{\"result\":\"1\",\"description\":\"系统发生异常\"}";
    }
}
