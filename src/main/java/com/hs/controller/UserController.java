package com.hs.controller;

import com.hs.constant.Const;
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
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Created by zj on 2018年1年10日.
 */
@RestController
@RequestMapping(value = "/user",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class UserController {
    @Resource private AdminService adminService;
    @Resource private TeacherService teacherService;
    @Resource private StudentService studentService;
    @Resource private RedisTemplate redisTemplate;

    @PostMapping(value = "/login")
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
                    redisTemplate.opsForValue().set(session.getId()+"account",admin1,1L,TimeUnit.HOURS);
                    redisTemplate.opsForValue().set(session.getId()+"user_type",admin1.getUserType(),1L,TimeUnit.HOURS);
                    redisTemplate.opsForValue().set(session.getId()+"accountPsw",admin1.getAdminPassword(),1L,TimeUnit.HOURS);
                    return ResponseData.buildData(admin1);
                } else {
                    return ResponseData.error("用户名或密码错误");
                }
            }
            //老师登录
            if ("1".equals(userType)) {
                Teacher teacher = teacherService.getLoginTeacher(new Teacher(userName,authCode));
                if(teacher!=null&&teacher.gettId()!=-1){
                    redisTemplate.opsForValue().set(session.getId()+"account",teacher,1L,TimeUnit.HOURS);
                    redisTemplate.opsForValue().set(session.getId()+"user_type",teacher.getUserType(),1L,TimeUnit.HOURS);
                    redisTemplate.opsForValue().set(session.getId()+"accountPsw",teacher.gettPassword(),1L,TimeUnit.HOURS);
                    redisTemplate.opsForValue().set(session.getId()+"teacher",teacher.gettName(),1L,TimeUnit.HOURS);

                    return ResponseData.buildData(teacher);
                } else {
                    return ResponseData.error("用户名或密码错误");
                }
            }
            //学生登录
            if ("2".equals(userType)) {
                Student student = studentService.getLoginStudent(new Student(userName,authCode));
                if(student!=null&&student.getStuId()!=-1){
                    redisTemplate.opsForValue().set(session.getId()+"account",student,1L,TimeUnit.HOURS);
                    redisTemplate.opsForValue().set(session.getId()+"user_type",student.getUserType(),1L,TimeUnit.HOURS);
                    redisTemplate.opsForValue().set(session.getId()+"accountPsw",student.getStuPassword(),1L,TimeUnit.HOURS);
                    return ResponseData.buildData(student);
                } else {
                    return ResponseData.error("用户名或密码错误");
                }
            }
            return ResponseData.error("系统异常");
        }
    }
    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        redisTemplate.delete(session.getId()+"*");
        session.invalidate();
        return ResponseData.success();
    }
    @PostMapping(value = "/addUser")
    public String addUser(String userName,String userPassword,String user_type){
        if("".equals(userName)){
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
            return ResponseData.error("添加失败");
        }
    }

    @PostMapping(value = "/updateUserPsw")
    public String updateUserPsw(@RequestBody Map map ,HttpServletRequest request){
        Integer userId = (Integer) map.get("userId");
        String authCode = (String) map.get("authCode");
            HttpSession session = request.getSession();
        int user_type= (Integer) redisTemplate.opsForValue().get(session.getId()+"user_type");
        boolean flag = false;
        switch (user_type){
            case Const.ADMIN_TYPE:
                Admin admin = new Admin();
                admin.setAdminId(userId);
                admin.setAdminPassword(authCode);
                flag = adminService.updateAdminPsw(admin);
                break;
            case Const.TEACHER_TYPE:
                Teacher teacher = new Teacher();
                teacher.settId(userId);
                teacher.settPassword(authCode);
                flag = teacherService.updateTeacherPsw(teacher);
                break;
            case Const.STUDENT_TYPE:
                Student student = new Student();
                student.setStuId(userId);
                student.setStuPassword(authCode);
                flag = studentService.updateStudentPsw(student);
                break;
        }
        if(flag) {
            redisTemplate.opsForValue().set(session.getId()+"accountPsw",authCode);
            return ResponseData.success("修改成功");
        }
        return ResponseData.error("修改失败");
    }

    @GetMapping(value = "/loginSecurityCodeImage")
    public String securityCodeImage(HttpServletRequest request, HttpServletResponse response) {
        BufferedImage imgBuf = SecurityCodeUtil.initImage();
        String scode = SecurityCodeUtil.generateSecurityCode(imgBuf);
        // 将生成的验证码写入session
        HttpSession session = request.getSession();
        redisTemplate.opsForValue().set(session.getId()+SecurityCodeUtil.SECURITY_CODE,scode,1L,TimeUnit.HOURS);
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
