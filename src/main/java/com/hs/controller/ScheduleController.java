package com.hs.controller;

import com.hs.constant.Const;
import com.hs.entity.Course;
import com.hs.entity.ScheduleEntity;
import com.hs.entity.common.ResponseData;
import com.hs.service.CourseService;
import com.hs.utils.ExcelExporterUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 课表Controller
 * @Author: zj
 * @Date: 2018-05-03
 **/
@RestController
@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class ScheduleController {

    @Resource private CourseService courseService;
    @Resource private RedisTemplate redisTemplate;

    private static String[] scheduleFieldValue = new String[] { "", "星期一", "星期二",
            "星期三", "星期四", "星期五"};
    private static String[] scheduleFields = new String[] { "cTime","monday","tuesday",
            "wednesday", "thursday", "friday"};
    private static String[] scheduleFieldsType = new String[] { ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,
            ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING
    };

    @GetMapping(value = "/schedule/exportSchedule")
    public String exportSchedule(HttpServletRequest request, HttpServletResponse response) {
        try {
            Integer stuId = (Integer) redisTemplate.opsForValue().get(request.getRequestedSessionId()+"stuId");
            if(stuId == null ){
                return ResponseData.error("系统异常");
            }
            List<Course> list = courseService.getAllStudentCourse(stuId);
            ExcelExporterUtil.exportToExcel(request, response, generateSchedule(list), scheduleFields, scheduleFieldValue, scheduleFieldsType, "mySchedule.xls");
            return ResponseData.success();
        }catch(Exception e) {
            e.printStackTrace();
            return ResponseData.error("系统异常");
        }
    }

    @GetMapping(value = "/schedule/mySchedule")
    public String mySchedule(HttpServletRequest request, HttpServletResponse response) {
        try {
            Integer stuId = (Integer) redisTemplate.opsForValue().get(request.getRequestedSessionId()+"stuId");
            if(stuId == null ){
                return ResponseData.error("系统异常");
            }
            List<Course> list = courseService.getAllStudentCourse(stuId);
            return ResponseData.buildList(generateSchedule(list));
        }catch(Exception e) {
            e.printStackTrace();
            return ResponseData.error("系统异常");
        }
    }

    /**
     * 生成课程表
     * @param list
     * @return
     */
    private List<ScheduleEntity> generateSchedule(List<Course> list){
        List<ScheduleEntity> ls = new ArrayList<>();
        /**生成第一行课程**/
        ScheduleEntity entity = new ScheduleEntity();
        entity.setcTime(Const.ONE);
        Iterator it = list.iterator();
        while(it.hasNext()){
            Course course = (Course) it.next();
            switch (course.getcTime()){
                case Const.MONDAY+Const.ONE:
                    entity.setMonday(course.getcName());
                    it.remove();
                    break;
                case Const.TUESDAY+Const.ONE:
                    entity.setTuesday(course.getcName());
                    it.remove();
                    break;
                case Const.WEDNESDAY+Const.ONE:
                    entity.setWednesday(course.getcName());
                    it.remove();
                    break;
                case Const.THURSDAY+Const.ONE:
                    entity.setThursday(course.getcName());
                    it.remove();
                    break;
                case Const.FRIDAY+Const.ONE:
                    entity.setFriday(course.getcName());
                    it.remove();
                    break;
            }
        }
        ls.add(entity);

        /**生成第二行课程**/
        ScheduleEntity entity1 = new ScheduleEntity();
        entity1.setcTime(Const.TWO);
        Iterator it1 = list.iterator();
        while(it1.hasNext()){
            Course course = (Course) it1.next();
            switch (course.getcTime()){
                case Const.MONDAY+Const.TWO:
                    entity1.setMonday(course.getcName());
                    it1.remove();
                    break;
                case Const.TUESDAY+Const.TWO:
                    entity1.setTuesday(course.getcName());
                    it1.remove();
                    break;
                case Const.WEDNESDAY+Const.TWO:
                    entity1.setWednesday(course.getcName());
                    it1.remove();
                    break;
                case Const.THURSDAY+Const.TWO:
                    entity1.setThursday(course.getcName());
                    it1.remove();
                    break;
                case Const.FRIDAY+Const.TWO:
                    entity1.setFriday(course.getcName());
                    it1.remove();
                    break;
            }
        }
        ls.add(entity1);

        /**生成第三行课程**/
        ScheduleEntity entity2 = new ScheduleEntity();
        entity2.setcTime(Const.FOUR);
        Iterator it2 = list.iterator();
        while(it2.hasNext()){
            Course course = (Course) it2.next();
            switch (course.getcTime()){
                case Const.MONDAY+Const.THREE:
                    entity2.setMonday(course.getcName());
                    it2.remove();
                    break;
                case Const.TUESDAY+Const.THREE:
                    entity2.setTuesday(course.getcName());
                    it2.remove();
                    break;
                case Const.WEDNESDAY+Const.THREE:
                    entity2.setWednesday(course.getcName());
                    it2.remove();
                    break;
                case Const.THURSDAY+Const.THREE:
                    entity2.setThursday(course.getcName());
                    it2.remove();
                    break;
                case Const.FRIDAY+Const.THREE:
                    entity2.setFriday(course.getcName());
                    it2.remove();
                    break;
            }
        }
        ls.add(entity2);

        /**生成第四行课程**/
        ScheduleEntity entity3 = new ScheduleEntity();
        entity3.setcTime(Const.FOUR);
        Iterator it3 = list.iterator();
        while(it3.hasNext()){
            Course course = (Course) it3.next();
            switch (course.getcTime()){
                    case Const.MONDAY+Const.FOUR:
                    entity3.setMonday(course.getcName());
                    it3.remove();
                    break;
                case Const.TUESDAY+Const.FOUR:
                    entity3.setTuesday(course.getcName());
                    it3.remove();
                    break;
                case Const.WEDNESDAY+Const.FOUR:
                    entity3.setWednesday(course.getcName());
                    it3.remove();
                    break;
                case Const.THURSDAY+Const.FOUR:
                    entity3.setThursday(course.getcName());
                    it3.remove();
                    break;
                case Const.FRIDAY+Const.FOUR:
                    entity3.setFriday(course.getcName());
                    it3.remove();
                    break;
            }
        }
        ls.add(entity3);

        return ls;
    }
}
