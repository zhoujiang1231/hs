package com.hs.controller;

import com.hs.entity.Admin;
import com.hs.entity.Student;
import com.hs.entity.Teacher;
import com.hs.entity.common.ResponseData;
import com.hs.service.AdminService;
import com.hs.service.StudentService;
import com.hs.service.TeacherService;
import com.hs.utils.SecurityCodeUtil;
import com.hs.utils.StringUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
import java.util.Map;

/**
 * Created by zj on 2018年1年10日.
 */
@RestController
@RequestMapping(value = "/user",produces = "text/html;charset=UTF-8")
public class UserController {
    @Resource private AdminService adminService;
    @Resource private TeacherService teacherService;
    @Resource private StudentService studentService;
    @Resource private RedisTemplate redisTemplate;

    @RequestMapping(value = "/login")
        public String login(@RequestBody Map map, HttpServletRequest request){
        String userType = (String) map.get("userType");
        String securityCode = (String) map.get("securityCode");
        String userName = (String) map.get("userName");
        String authCode = (String) map.get("authCode");
        HttpSession session = request.getSession();
        if(StringUtil.isEmpty(userType)){
            return ResponseData.error("请选择用户类型!");
        }
        if(!redisTemplate.opsForValue().get(session.getId()+"SECURITY_CODE").equals(securityCode)) {
            return ResponseData.error("验证码错误！");
        }
        else{
            //管理员登录
            if ("0".equals(userType)) {
                Admin admin1 = adminService.getLoginAdmin(new Admin(userName, authCode));
                if (admin1 != null && admin1.getAdminId() != -1) {
                    redisTemplate.opsForValue().set(session.getId()+"account",admin1);
                    redisTemplate.opsForValue().set(session.getId()+"user_type",admin1.getUserType());
                    redisTemplate.opsForValue().set(session.getId()+"accountPsw",admin1.getAdminPassword());
                    return ResponseData.buildData(admin1);
                } else {
                    return ResponseData.error("用户名或密码错误");
                }
            }
            //老师登录
            if ("1".equals(userType)) {
                Teacher teacher = teacherService.getLoginTeacher(new Teacher(userName,authCode));
                if(teacher!=null&&teacher.gettId()!=-1){
                    redisTemplate.opsForValue().set(session.getId()+"account",teacher);
                    redisTemplate.opsForValue().set(session.getId()+"user_type",teacher.getUserType());
                    redisTemplate.opsForValue().set(session.getId()+"accountPsw",teacher.gettPassword());

                    return ResponseData.buildData(teacher);
                } else {
                    return ResponseData.error("用户名或密码错误");
                }
            }
            //学生登录
            if ("2".equals(userType)) {
                Student student = studentService.getLoginStudent(new Student(userName,authCode));
                if(student!=null&&student.getStuId()!=-1){
                    redisTemplate.opsForValue().set(session.getId()+"account",student);
                    redisTemplate.opsForValue().set(session.getId()+"user_type",student.getUserType());
                    redisTemplate.opsForValue().set(session.getId()+"accountPsw",student.getStuPassword());
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
        HttpSession session = httpServletRequest.getSession();
        redisTemplate.delete(session.getId()+"*");
        session.invalidate();
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
        String user_type= (String) redisTemplate.opsForValue().get(session.getId()+"user_type");
        String accountPsw = (String) redisTemplate.opsForValue().get(session.getId()+"accountPsw");
        if("0".equals(user_type)){
            if(!oldpsw.equals(accountPsw)){
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
            if(!oldpsw.equals(accountPsw)){
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
            if(!oldpsw.equals(accountPsw)){
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

    @RequestMapping(value = "/loginSecurityCodeImage")
    public String securityCodeImage(HttpServletRequest request, HttpServletResponse response) {
        BufferedImage imgBuf = SecurityCodeUtil.initImage();
        String scode = SecurityCodeUtil.generateSecurityCode(imgBuf);
        // 将生成的验证码写入session
        HttpSession session = request.getSession();
        redisTemplate.opsForValue().set(session.getId()+SecurityCodeUtil.SECURITY_CODE,scode);
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
