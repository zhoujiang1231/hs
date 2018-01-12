package com.hs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hs.entity.Teacher;
import com.hs.entity.common.ResponseData;
import com.hs.service.TeacherService;
import com.sun.org.apache.regexp.internal.RE;
import org.apache.ibatis.jdbc.Null;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by zj on 2018年1年10日.
 */
@Controller
@RequestMapping(value = "/teacher",produces = "text/html;charset=UTF-8")
public class TeacherController {
    @Resource private TeacherService teacherService;

    @RequestMapping(value = "/getAllTeacher")
    @ResponseBody
    public String getAllTeacher(@RequestParam String pageNum, @RequestParam String tName, HttpServletRequest request) {
        if("".equals(pageNum)||pageNum== null){
            pageNum="1";
        }
        PageHelper.startPage(Integer.parseInt(pageNum), 10,true);
        List<Teacher> lt = teacherService.getAllTeacher(tName);
        PageInfo<Teacher> pt = new PageInfo<Teacher>(lt);
        request.getSession().setAttribute("teacher_page",pt);
        if(pt.getTotal()!=0){
            return ResponseData.buildList(lt);
        }
        return ResponseData.error("没有教师");
    }
    @RequestMapping(value = "/deleteTeacher")
    @ResponseBody
    public String deleteTeacher(int tId) {
        if(teacherService.deleteTeacher(new Teacher(tId))){
            return ResponseData.success("删除成功");
        }
        return ResponseData.error("没有教师");
    }


    @RequestMapping(value = "/addTeacher")
    @ResponseBody
    public String addTeacher(Teacher teacher) {
        if(teacher.gettName()==""){
            return ResponseData.error("姓名为空");
        }
        if(teacher.gettPassword()==""){
            return ResponseData.error("密码为空");
        }
        if(teacherService.addTeacher(teacher)){
            return ResponseData.success("添加成功");
        }
        return ResponseData.error("添加失败");
    }

    @RequestMapping(value = "/updateTeacherPswAll")
    @ResponseBody
    public String updateUserPsw(String[] tId) {
        if(teacherService.updateTeacherPswAll(tId)){
            return ResponseData.success("密码重置成功");
        }
        return ResponseData.error("重置密码失败");
    }
}
