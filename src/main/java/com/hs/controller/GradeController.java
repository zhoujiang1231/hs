package com.hs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hs.constant.Const;
import com.hs.entity.Course;
import com.hs.entity.ExportGradeEntity;
import com.hs.entity.Grade;
import com.hs.entity.common.ResponseData;
import com.hs.service.CourseService;
import com.hs.service.GradeService;
import com.hs.utils.ExcelExporterUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: zj
 * @Date: 2018-05-02
 **/
@RestController
@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class GradeController {


    private static String[] gradeFieldValue = new String[] { "课程名称", "课程类型", "课程教师",
            "成绩"};
    private static String[] gradeFields = new String[] { "cName","cType","cTeacher","grade"};
    private static String[] gradeFieldsType = new String[] { ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,ExcelExporterUtil.EXPORT_FIELD_TYPE_STRING,
            ExcelExporterUtil.EXPORT_FIELD_TYPE_DOUBLE
    };

    @Resource
    private GradeService gradeService;
    @Resource
    private RedisTemplate redisTemplate;
    @Resource
    private CourseService courseService;

    @GetMapping("/")
    public String index(){
        return "欢迎进入选课系统!";
    }

    @GetMapping("/studentGrade")
    public String getStudentGrade(Integer start,Integer limit,Grade grade){
        if(start== null){
            start= Const.PAGE_START;
        }
        if(limit== null){
            limit=Const.PAGE_LIMIT;
        }
        if(grade.getStuId()==null){
           return ResponseData.error("请选择学生!");
        }
        PageHelper.startPage(start, limit,true);
        List<Grade> lg = gradeService.getStudentGrade(grade);
        PageInfo<Grade> ps = new PageInfo<Grade>(lg);
        if(ps.getTotal()!=0){
            return ResponseData.buildList(lg,ps);
        }
        return ResponseData.error("没有成绩");
    }

    @PutMapping("/studentGrade")
    public String updateGrade(@RequestBody Grade grade){
        if(grade.getgId() == null ){
            return ResponseData.error("请选择一门成绩!");
        }
        if(grade.getGrade()<=0){
            return ResponseData.error("请填写正确的分数!");
        }
        if(gradeService.updateGrade(grade)) {
            return ResponseData.success("修改成功!");
        }
        return ResponseData.error("修改失败!");
    }

    @PostMapping("/studentGrade")
    public String addStudentGrade(@RequestBody Grade grade){
        if(grade.getcId() == null){
            return ResponseData.error("请选择课程!");
        }
        if(grade.getStuId() == null){
            return ResponseData.error("请选择学生!");
        }
        if(grade.getGrade() <0){
            return ResponseData.error("请填写正确的分数!");
        }
        Grade grade1 = gradeService.getGradeByCourseAndStu(grade);
        if(grade1 != null){
            return ResponseData.error("该门课程的学生已有成绩!");
        }
        if(gradeService.addStudentGrade(grade)){
            return ResponseData.success();
        }
        return ResponseData.error("添加失败");
    }

    @DeleteMapping("/courseGrade/{gId}")
    public String deleteStudentGrade(@PathVariable Integer gId){
        if(gId == null){
            return ResponseData.error("请选择一门成绩!");
        }
        Grade grade = new Grade();
        grade.setgId(gId);
        if(gradeService.deleteStudentGrade(grade)){
            return ResponseData.success();
        }
        return ResponseData.error("删除失败");
    }

    @GetMapping("/courseGrade")
    public String getAllGradeByCourse(Integer start,Integer limit,Integer cId,HttpServletRequest request){
        Map map = new HashMap();
        map.put("tId",redisTemplate.opsForValue().get(request.getRequestedSessionId()+"tId"));
        List<Course> lc = courseService.getAllTeacherCourse(map);
        if(lc == null){
            return ResponseData.error("你没有开课!");
        }
        boolean flag = false;
        /*lc.forEach(o ->{
            if(o.getcId() == cId) flag = true;
        });*/
        for (Course course : lc) {
            if(course.getcId() == cId) flag = true;
        }
        if(flag == false){
            return ResponseData.error("不是你的课程!");
        }
        if(start== null){
            start= Const.PAGE_START;
        }
        if(limit== null){
            limit=Const.PAGE_LIMIT;
        }
        if(cId==null){
            return ResponseData.error("请选择一门课程!");
        }
        PageHelper.startPage(start, limit,true);
        List<Grade> lg = gradeService.getAllGradeByCourse(cId);
        PageInfo<Grade> ps = new PageInfo<Grade>(lg);
        if(ps.getTotal()!=0){
            return ResponseData.buildList(lg,ps);
        }
        return ResponseData.error("没有成绩");
    }

    @GetMapping("/allGrade")
    public String getAllGrade(Integer start,Integer limit){
        if(start== null){
            start= Const.PAGE_START;
        }
        if(limit== null){
            limit=Const.PAGE_LIMIT;
        }
        PageHelper.startPage(start, limit,true);
        List<Grade> lg = gradeService.getAllGrade();
        PageInfo<Grade> ps = new PageInfo<Grade>(lg);
        if(ps.getTotal()!=0){
            return ResponseData.buildList(lg,ps);
        }
        return ResponseData.error("没有成绩");
    }

    @GetMapping(value = "/grade/exportGrade")
    public String exportGrade(HttpServletRequest request, HttpServletResponse response) {
        try {
            Integer stuId = (Integer) redisTemplate.opsForValue().get(request.getRequestedSessionId()+"stuId");
            if(stuId == null ){
                return ResponseData.error("系统异常");
            }
            Grade grade = new Grade();
            grade.setStuId(stuId);
            /**先获取成绩**/
            List<Grade> list = gradeService.getStudentGrade(grade);
            /**再获取课程 把课程名等信息封装到list中**/
            List<Course> lc = courseService.getAllStudentCourseNoStatus();
            List<ExportGradeEntity> lg = new ArrayList<>();
            /*list.forEach(o ->{
                ExportGradeEntity entity = new ExportGradeEntity();
                entity.setGrade(o.getGrade());
                lc.forEach(oo->{
                    if(o.getcId() == oo.getcId()){
                        entity.setcName(oo.getcName());
                        entity.setcType(oo.getcType());
                        entity.setcTeacher(oo.getcTeacher());
                        lg.add(entity);
                    }
                });
            });*/
            for (int i = 0; i < list.size(); i++) {
                ExportGradeEntity entity = new ExportGradeEntity();
                entity.setGrade(list.get(i).getGrade());
                for (int j = 0; j < lc.size(); j++) {
                    if(list.get(i).getcId() == lc.get(j).getcId()){
                        entity.setcName(lc.get(j).getcName());
                        if(lc.get(j).getcType() == 0) {
                            entity.setcType("必修");
                        }else{
                            entity.setcType("选修");
                        }
                        entity.setcTeacher(lc.get(j).getcTeacher());
                        lg.add(entity);
                        break;
                    }
                }
            }
            ExcelExporterUtil.exportToExcel(request, response, lg, gradeFields, gradeFieldValue, gradeFieldsType, "myGrade.xls");
            return ResponseData.success();
        }catch(Exception e) {
            e.printStackTrace();
            return ResponseData.error("系统异常");
        }
    }
}
