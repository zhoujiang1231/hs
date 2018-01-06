package com.hs.controller.User;

import com.hs.entity.User;
import com.hs.entity.common.ResponseData;
import com.hs.service.UserService;
import com.hs.utils.SecurityCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
@RequestMapping(value = "/user")
public class UserController {
    @Resource private UserService userService;
    @RequestMapping("/login")
    @ResponseBody
    public ResponseData login(String user_name,String user_password,String code,HttpServletRequest httpServletRequest){
        User user = new User(user_name,user_password);
        HttpSession httpSession = httpServletRequest.getSession();
        if(!code.equals(httpSession.getAttribute(SecurityCodeUtil.SECURITY_CODE))){
            return new ResponseData("1","验证码错误");
        }
        User user1 = userService.getLoginUser(user);
        if(user1!=null&& user1.getUser_id()>0){
            httpSession.setAttribute("user",user1);
            return ResponseData.success();
        }
        else{
            return new ResponseData("1","用户名或密码错误");
        }
    }
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
        return "/login";
    }
    @RequestMapping(value = "/deleteUser")
    @ResponseBody
    public ResponseData deleteUser(User user){
        if(userService.deleteUser(user))
            return ResponseData.success();
        else
            return new ResponseData("1","删除失败");
    }
    @RequestMapping(value = "/addUser")
    @ResponseBody
    public ResponseData addUser(User user){
        if(userService.addUser(user))
            return ResponseData.success();
        else
            return new ResponseData("1","添加失败");
    }
    @RequestMapping(value = "/getAllStudent")
    @ResponseBody
    public ResponseData getAllStudent(){
       List<User> lu = userService.getAllStudent();
       return new ResponseData(lu,null,"0","success");
    }
    @RequestMapping(value = "/updateUser")
    @ResponseBody
    public  ResponseData updateUser(User user){
        return new ResponseData("0","success");
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
