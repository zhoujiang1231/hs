package com.hs.controller.User;

import com.hs.entity.User;
import com.hs.entity.common.ResponseData;
import com.hs.service.UserService;
import com.hs.utils.SecurityCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Controller
@RequestMapping(value = "/user",produces = "text/html;charset=UTF-8")
public class UserController {
    @Resource private UserService userService;
    @RequestMapping("/login")
    @ResponseBody
    public String login(String user_name,String user_password,String code,HttpServletRequest httpServletRequest){
        User user = new User(user_name,user_password);
        HttpSession httpSession = httpServletRequest.getSession();
        if(!code.equals(httpSession.getAttribute(SecurityCodeUtil.SECURITY_CODE))){
            return ResponseData.error("验证码错误");
        }
        User user1 = userService.getLoginUser(user);
        if(user1!=null&& user1.getUser_id()>0){
            httpSession.setAttribute("user_id",user1.getUser_id());
            httpSession.setAttribute("user_name",user1.getUser_name());
            httpSession.setAttribute("user_password",user1.getUser_password());
            httpSession.setAttribute("user_type",user1.getUser_type());
            httpSession.setAttribute("name",user1.getName());
            httpSession.setAttribute("email",user1.getEmail());
            httpSession.setAttribute("tel",user1.getTel());
            httpSession.setAttribute("sno",user1.getSno());
            httpSession.setAttribute("sex",user1.getSex());
            httpSession.setAttribute("idcard",user1.getIdcard());
            httpSession.setAttribute("creat_time",user1.getCreat_time());
            return ResponseData.success();
        }
        else{
            return  ResponseData.error("用户名或密码错误");
        }
    }
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
        return "/login";
    }
    @RequestMapping(value = "/deleteUser")
    @ResponseBody
    public String deleteUser(User user){
        if(userService.deleteUser(user))
            return ResponseData.success("删除成功");
        else
            return ResponseData.error("删除失败");
    }
    @RequestMapping(value = "/addUser")
    @ResponseBody
    public String addUser(User user){
        System.out.println("姓名："+user.getName());
        System.out.println("类型："+user.getUser_type());
        System.out.println("用户名："+user.getUser_name());
        System.out.println("密码："+user.getUser_password());
        System.out.println("学号："+user.getSno());
        System.out.println("性别："+user.getSex());

        if(user.getUser_type()==2) {
            if(!userService.checkSno(user.getSno())) {
                if (userService.addStudent(user)) {
                    return ResponseData.success("添加成功");
                }
                else {
                    return ResponseData.error("添加失败");
                }
            }
            else{
                return ResponseData.error("学号重复");
            }
        }
        else {
            if(!userService.checkUserNameUnique(user.getUser_name())) {
                if (userService.addUser(user)) {
                    return ResponseData.success("添加成功");
                }
                else {
                    return ResponseData.error("添加失败");
                }
            }
            else{
                return ResponseData.error("登录名重复");
            }
        }
    }
    @RequestMapping(value = "/getAllStudent")
    @ResponseBody
    public String getAllStudent(){
       List<User> lu = userService.getAllStudent();
       return ResponseData.buildList(lu);
    }
    @RequestMapping(value = "/updateUserPsw",method = RequestMethod.POST)
    @ResponseBody
    public  String updateUserPsw(User user,@RequestParam String oldpsw, HttpServletRequest httpServletRequest){
        if(oldpsw.equals(httpServletRequest.getSession().getAttribute("user_password"))){
            return  ResponseData.error("旧密码输入错误");
        }
        if(userService.updateUserPsw(user)) {
            return ResponseData.success("修改成功");
        }
        else
            return ResponseData.error("系统异常");
    }
    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    @ResponseBody
    public String updateUser(User user,HttpServletRequest request){
        if (userService.updateUser(user)){
            request.getSession().setAttribute("email",user.getEmail());
            request.getSession().setAttribute("tel",user.getTel());
            return ResponseData.success("修改成功");
        }
        return ResponseData.error("修改失败");

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
