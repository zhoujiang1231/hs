package com.hs.controller;

import com.hs.entity.Course;
import com.hs.entity.common.ResponseData;
import com.hs.service.CourseService;
import com.hs.utils.ExcelExporterUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 课表Controller
 * @Author: zj
 * @Date: 2018-05-03
 **/
@RestController
public class ScheduleController {

    @Resource private CourseService courseService;
    @Resource private RedisTemplate redisTemplate;

    private static String[] scheduleFieldValue = new String[] { "", "星期一", "星期二",
            "星期三", "星期四", "星期五"};
    private static String[] scheduleFields = new String[] { "","vlinkAccountFullName","operateTypeDesc",
            "opearteMoney", "realCost", "minCost", "rebate",
            "previousMoney","currentMoney",
            "remark" };
    private static String[] scheduleFieldsType = new String[] { ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,
            ExcelExporterUtil.EXPORT_FIELD_TYPE_DOUBLE,ExcelExporterUtil.EXPORT_FIELD_TYPE_DOUBLE,ExcelExporterUtil.EXPORT_FIELD_TYPE_DOUBLE,ExcelExporterUtil.EXPORT_FIELD_TYPE_DOUBLE,
            ExcelExporterUtil.EXPORT_FIELD_TYPE_DOUBLE,ExcelExporterUtil.EXPORT_FIELD_TYPE_DOUBLE,
            ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING
    };

    @GetMapping(value = "/schedule/exportSchedule")
    public String exportSchedule(HttpServletRequest request, HttpServletResponse response) {
        try {
            Integer stuId = (Integer) redisTemplate.opsForValue().get(request.getRequestedSessionId()+"stuId");
            if(stuId == null ){
                return ResponseData.error("系统异常");
            }
            List<Course> list = courseService.getAllStudentCourse(stuId);
            ExcelExporterUtil.exportToExcel(request, response, list, scheduleFields, scheduleFieldValue, scheduleFieldsType, "mySchedule.xls");
            return ResponseData.success();
        }catch(Exception e) {
            e.printStackTrace();
            return ResponseData.error("系统异常");
        }
    }
}
