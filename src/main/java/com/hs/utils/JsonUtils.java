package com.hs.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hs.entity.common.ResponseData;

/**
 * Created by zj on 2018年1年6日.
 */
public class JsonUtils {
    private static ObjectMapper objectMapper = new ObjectMapper();
    public static String buildData(ResponseData responseData){

        try {
            return objectMapper.writeValueAsString(responseData);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static String buildList(ResponseData responseData){
        try {
            return objectMapper.writeValueAsString(responseData);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String buildSuccess( ){
        ResponseData responseData = new ResponseData("0","success");
        try {
            return objectMapper.writeValueAsString(responseData);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String buildError(ResponseData responseData){
        try {
            return objectMapper.writeValueAsString(responseData);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
