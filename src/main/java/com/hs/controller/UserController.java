package com.hs.controller;

import com.hs.entity.Admin;
import com.hs.entity.Student;
import com.hs.entity.Teacher;
import com.hs.entity.common.ResponseData;
import com.hs.service.AdminService;
import com.hs.service.StudentService;
import com.hs.service.TeacherService;
import com.hs.utils.SecurityCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by zj on 2018年1年10日.
 */
@RestController
@RequestMapping(value = "/user",produces = "text/html;charset=UTF-8")
public class UserController {
    @Resource private AdminService adminService;
    @Resource private TeacherService teacherService;
    @Resource private StudentService studentService;

    @RequestMapping(value = "/login")
        public String login(String user_type, String user_name, String user_password, String code, HttpServletRequest request){
        HttpSession session = request.getSession();
        if(!session.getAttribute("SECURITY_CODE").equals(code)) {
            return ResponseData.error("验证码错误！");
        }
        else{
            //管理员登录
            if ("0".equals(user_type)) {
                Admin admin1 = adminService.getLoginAdmin(new Admin(user_name, user_password));
                if (admin1 != null && admin1.getAdminId() != -1) {
                    session.setAttribute("adminId", admin1.getAdminId());
                    session.setAttribute("adminName", admin1.getAdminName());
                    session.setAttribute("adminPassword", admin1.getAdminPassword());
                    session.setAttribute("user_type", "0");
                    return ResponseData.buildData(admin1);
                } else {
                    return ResponseData.error("用户名或密码错误");
                }
            }
            //老师登录
            if ("1".equals(user_type)) {
                Teacher teacher = teacherService.getLoginTeacher(new Teacher(user_name,user_password));
                if(teacher!=null&&teacher.gettId()!=-1){
                    session.setAttribute("tId", teacher.gettId());
                    session.setAttribute("tName", teacher.gettName());
                    session.setAttribute("tPassword", teacher.gettPassword());
                    session.setAttribute("user_type", "1");
                    session.setAttribute("creatTime", teacher.getCreatTime());
                    session.setAttribute("teacher_course_list",teacher.getLc());
                    return ResponseData.buildData(teacher);
                } else {
                    return ResponseData.error("用户名或密码错误");
                }
            }
            //学生登录
            if ("2".equals(user_type)) {
                Student student = studentService.getLoginStudent(new Student(user_name,user_password));
                if(student!=null&&student.getStuId()!=-1){
                    session.setAttribute("stuId", student.getStuId());
                    session.setAttribute("stuName", student.getStuName());
                    session.setAttribute("stuPassword", student.getStuPassword());
                    session.setAttribute("stuAddress", student.getStuAddress());
                    session.setAttribute("stuDepart", student.getStuDepart());
                    session.setAttribute("stuEmail", student.getStuEmail());
                    session.setAttribute("stuNo", student.getStuNo());
                    session.setAttribute("stuIdcard", student.getStuIdcard());
                    session.setAttribute("stuTel", student.getStuTel());
                    session.setAttribute("stuSex", student.getStuSex());
                    session.setAttribute("user_type", "2");
                    session.setAttribute("creatTime", student.getCreatTime());
                    session.setAttribute("student_course_list",student.getLc());
                    return ResponseData.buildData(student);
                } else {
                    return ResponseData.error("用户名或密码错误");
                }
            }
            return ResponseData.error("系统异常");
        }
    }
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
        return ResponseData.success();
    }
    @RequestMapping(value = "/addUser")
    public String addUser(String userName,String userPassword,String user_type){
        if(!"0".equals(user_type)&&!"1".equals(user_type)){
            return ResponseData.error("类型错误");
        }
        else if("".equals(userName)){
            return ResponseData.error("姓名为空");
        }
        else if("".equals(userPassword)){
            return ResponseData.error("密码为空");
        }
        else {
            //添加管理员
            if ("0".equals(user_type)) {
                boolean b = adminService.addAdmin(new Admin(userName,userPassword));
                if(b){
                    return ResponseData.success("添加成功");
                }
                else{
                    return ResponseData.error("添加失败");
                }
            }
            //添加老师
            else {
                boolean b = teacherService.addTeacher(new Teacher(userName,userPassword));
                if(b){
                    return ResponseData.success("添加成功");
                }
                else{
                    return ResponseData.error("添加失败");
                }

            }
        }
    }

    @RequestMapping(value = "/updateUserPsw")
    public String updateUserPsw(int userId,String oldpsw,String newpsw1,HttpServletRequest request){
        HttpSession session = request.getSession();
        String user_type= (String) session.getAttribute("user_type");
        if("0".equals(user_type)){
            if(!oldpsw.equals(session.getAttribute("adminPassword"))){
                return ResponseData.error("旧密码输入错误");
            }
            Admin admin = new Admin();
            admin.setAdminId(userId);
            admin.setAdminPassword(newpsw1);
            if(adminService.updateAdminPsw(admin)){
                return ResponseData.success("修改成功");
            }
            return ResponseData.error("修改失败");
        }
        if("1".equals(user_type)){
            if(!oldpsw.equals(session.getAttribute("tPassword"))){
                return ResponseData.error("旧密码输入错误");
            }
            Teacher teacher = new Teacher();
            teacher.settId(userId);
            teacher.settPassword(newpsw1);
            if(teacherService.updateTeacherPsw(teacher)){
                return ResponseData.success("修改成功");
            }
            return ResponseData.error("修改失败");
        }
        if("2".equals(user_type)){
            if(!oldpsw.equals(session.getAttribute("stuPassword"))){
                return ResponseData.error("旧密码输入错误");
            }
            Student student = new Student();
            student.setStuId(userId);
            student.setStuPassword(newpsw1);
            if(studentService.updateStudentPsw(student)){
                return ResponseData.success("修改成功");
            }
            return ResponseData.error("修改失败");
        }
        else{
            return ResponseData.error("系统异常");
        }
    }

    @RequestMapping(value = "/vcode_img")
    public String securityCodeImage(HttpServletRequest request, HttpServletResponse response) {
        BufferedImage imgBuf = SecurityCodeUtil.initImage();
        String scode = SecurityCodeUtil.generateSecurityCode(imgBuf);
        // 将生成的验证码写入session
        HttpSession session = request.getSession();
        session.setAttribute(SecurityCodeUtil.SECURITY_CODE, scode);
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos;
        try {
            sos = response.getOutputStream();
            ImageIO.write(imgBuf, "jpeg", sos);
            sos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
