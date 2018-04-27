package com.hs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hs.constant.Const;
import com.hs.entity.Teacher;
import com.hs.entity.common.ResponseData;
import com.hs.service.TeacherService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zj on 2018年1年10日.
 */
@RestController
@RequestMapping(value = "/teacher",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class TeacherController {
    @Resource private TeacherService teacherService;

    @GetMapping(value = "/getAllTeacher")
    public String getAllTeacher(@RequestParam Integer start, @RequestParam Integer limit,Teacher teacher, HttpServletRequest request) {
        if(start== null){
            start= Const.PAGE_START;
        }
        if(limit== null){
            limit=Const.PAGE_LIMIT;
        }
        PageHelper.startPage(start, limit,true);
        List<Teacher> lt = teacherService.getAllTeacher(teacher.gettName());
        PageInfo<Teacher> pt = new PageInfo<Teacher>(lt);
        if (pt.getTotal() != 0) {
            return ResponseData.buildList(lt,pt);
        }
        return ResponseData.error("没有教师");
    }

    @GetMapping(value = "/getAllTeacherIdAndName")
    public String getAllTeacherIdAndName(HttpServletRequest request) {
        List<Teacher> lt = teacherService.getAllTeacher("");
        return ResponseData.buildList(lt);
    }


    @DeleteMapping(value = "/deleteTeacher/{tId}")
    public String deleteTeacher(@PathVariable Integer tId) {
        Teacher teacher = new Teacher(tId);
        if(teacherService.deleteTeacher(teacher)){
            return ResponseData.success("删除成功");
        }
        return ResponseData.error("删除失败");
    }


    @PostMapping(value = "/addTeacher")
    public String addTeacher(@RequestBody Teacher teacher) {
        if(teacher.gettName()==""||teacher.gettName()==null){
            return ResponseData.error("姓名为空");
        }
        if(teacher.gettPassword()==""||teacher.gettPassword()==null){
            teacher.settPassword("888888");
        }
        if(teacherService.addTeacher(teacher)){
            return ResponseData.success("添加成功");
        }
        return ResponseData.error("添加失败");
    }

    @RequestMapping(value = "/updateTeacherPswAll")
    public String updateUserPsw(String[] tId) {
        if(teacherService.updateTeacherPswAll(tId)){
            return ResponseData.success("密码重置成功");
        }
        return ResponseData.error("重置密码失败");
    }
}
