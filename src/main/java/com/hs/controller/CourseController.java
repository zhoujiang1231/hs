package com.hs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hs.entity.Course;
import com.hs.entity.Student;
import com.hs.entity.common.ResponseData;
import com.hs.service.CourseService;
import com.hs.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zj on 2018年1年6日.
 */
@Controller
@RequestMapping(value = "/course",produces = "text/html;charset=UTF-8")
public class CourseController {
    @Resource private CourseService courseService;

    @RequestMapping(value = "/getAllCourse")
    @ResponseBody
    public String getAllCourse(@RequestParam String pageNum,HttpServletRequest request) {
        if("".equals(pageNum)||pageNum== null){
            pageNum="1";
        }
        PageHelper.startPage(Integer.parseInt(pageNum), 10,true);
        List<Course> lc = courseService.getAllCourse();
        PageInfo<Course> ps = new PageInfo<Course>(lc);
        request.getSession().setAttribute("course_page",ps);
        if(ps.getTotal()!=0){
            return ResponseData.buildList(lc);
        }
        return ResponseData.error("没有课程");
    }
    @RequestMapping(value = "/choseCourse")
    @ResponseBody
    public String choseCourse(String cnum,String cId,HttpServletRequest request){
       int stuId = (Integer) request.getSession().getAttribute("stuId");
       Map map = new HashMap();
       map.put("stuId",stuId);
       map.put("cId",cId);
       try {
           if (courseService.choeseCourse(map)) {
               return ResponseData.success();
           }
       }catch (Exception e){
           return ResponseData.error("由于系统原因选课失败");
       }
       return ResponseData.error("系统异常");
    }
}
