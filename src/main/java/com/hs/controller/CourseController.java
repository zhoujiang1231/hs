package com.hs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hs.constant.Const;
import com.hs.entity.Course;
import com.hs.entity.common.ResponseData;
import com.hs.service.CourseService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zj on 2018年1年6日.
 */
@RestController
@RequestMapping(value = "/course",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class CourseController {
    @Resource private CourseService courseService;

    @GetMapping(value = "/getAllCourse")
    public String getAllCourse(Integer start,Integer limit, Course course, HttpServletRequest request) {
        if(start== null){
            start= Const.PAGE_START;
        }
        if(limit== null){
            limit=Const.PAGE_LIMIT;
        }
        if(course.getcType()==null){
            course.setcType(10);
        }
        PageHelper.startPage(start, limit,true);
        List<Course> lc = courseService.getAllCourse(course);
        PageInfo<Course> ps = new PageInfo<Course>(lc);
        if(ps.getTotal()!=0){
            return ResponseData.buildList(lc,ps);
        }
        return ResponseData.error("没有课程");
    }

    @RequestMapping(value = "/choseCourse")
    public String choseCourse(String cId,HttpServletRequest request){
       int stuId = (Integer) request.getSession().getAttribute("stuId");
       Map map = new HashMap();
       map.put("stuId",stuId);
       map.put("cId",cId);
       try {
           if (courseService.choeseCourse(map)) {
               List<Course> lc= courseService.getAllStudentCourse(stuId);
               request.getSession().setAttribute("student_course_list",lc);
               return ResponseData.success();
           }
       }catch (Exception e){
           return ResponseData.error("由于系统原因选课失败");
       }
       return ResponseData.error("系统异常");
    }

    @RequestMapping(value = "/unchoeseCourse")
    public String unchoeseCourse(String cId,HttpServletRequest request){
        int stuId = (Integer) request.getSession().getAttribute("stuId");
        Map map = new HashMap();
        map.put("stuId",stuId);
        map.put("cId",cId);
        try {
            if (courseService.unchoeseCourse(map)) {
                List<Course> lc= courseService.getAllStudentCourse(stuId);
                request.getSession().setAttribute("student_course_list",lc);
                return ResponseData.success();
            }
        }catch (Exception e){
            return ResponseData.error("由于系统原因取消课程失败");
        }
        return ResponseData.error("系统异常");
    }

    @PostMapping(value = "/addCourse")
    public String addCourse(@RequestBody Course course,HttpServletRequest request){
        if(course.getcName()==null || course.getcName()==""){
            return ResponseData.error("课程名为空");
        }
        if(course.getcMark()<=0){
            return ResponseData.error("请填写正确的学分");
        }
        if(course.getcHour()<=0){
            return ResponseData.error("请填写正确的学时");
        }
        if(course.getcTeacher()==null || "".equals(course.getcTeacher())){
            String tName = (String) request.getSession().getAttribute("tName");
            if(tName==null||"".equals(tName)){
                return ResponseData.error("请选择任课教师");
            }
            else {
                course.setcTeacher(tName);
            }
        }
        if(course.getcType()==-1){
            return ResponseData.error("请选择类型");
        }
        if(course.getcTotal()<=0){
            return ResponseData.error("请填写课程总人数");
        }
        boolean b = courseService.addCourse(course);
        if(b){
            return ResponseData.success("添加成功");

        }
        else{
            return ResponseData.error("添加课程失败");
        }
    }

    @RequestMapping(value = "/deleteCourse/{cId}")
    public String deleteCourse(@PathVariable  int cId){
        boolean b = courseService.deleteCourse(cId);
        if(b){
            return ResponseData.success("删除成功");
        }
        else {
            return ResponseData.error("删除失败");
        }
    }

    @RequestMapping(value = "/deleteCourseBatch")
    public String deleteCourseBatch(String[] cId){
        int[] cid = new int[cId.length];
        for (int i = 0; i < cId.length; i++) {
            cid[i] = Integer.parseInt(cId[i]);
        }
        boolean b = courseService.deleteCourseBatch(cid);
        if(b){
            return ResponseData.success("删除成功");
        }
        else {
            return ResponseData.error("删除失败");
        }
    }

    /**
     * 获取老师所要教学的课程
     * @param pageNum
     * @param cName
     * @param cType
     * @param request
     * @return
     */
    @RequestMapping(value = "/getAllTeacherCourse")
    public String getAllTeacherCourse(@RequestParam String pageNum, String cName, String cType, HttpServletRequest request) {
        if("".equals(pageNum)||pageNum== null){
            pageNum="1";
        }
        if("".equals(cType)||cType==null){
            cType="10";
        }
        Map map = new HashMap();
        map.put("tId",request.getSession().getAttribute("tId"));
        map.put("cName",cName);
        map.put("cType",cType);
        PageHelper.startPage(Integer.parseInt(pageNum), 10,true);
        List<Course> lc = courseService.getAllTeacherCourse(map);
        PageInfo<Course> ps = new PageInfo<Course>(lc);
        if(ps.getTotal()!=0){
            return ResponseData.buildList(lc,ps);
        }
        return ResponseData.error("没有课程");
    }

    /**
     * 获取学生选择的课程
     * @param pageNum
     * @param request
     * @return
     */
    @RequestMapping(value = "/getAllStudentCourse")
    public String getAllStudentCourse(@RequestParam String pageNum, HttpServletRequest request) {
        if("".equals(pageNum)||pageNum== null){
            pageNum="1";
        }
        Integer stuId = (Integer) request.getSession().getAttribute("stuId");
        PageHelper.startPage(Integer.parseInt(pageNum), 10,true);
        List<Course> lc = courseService.getAllStudentCourse(stuId);
        PageInfo<Course> ps = new PageInfo<Course>(lc);
        if(ps.getTotal()!=0){
            return ResponseData.buildList(lc,ps);
        }
        return ResponseData.error("没有课程");
    }

}
