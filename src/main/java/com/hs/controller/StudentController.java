package com.hs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hs.entity.Student;
import com.hs.entity.Teacher;
import com.hs.entity.common.ResponseData;
import com.hs.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Controller
@RequestMapping(value = "/student",produces = "text/html;charset=UTF-8")
public class StudentController {
    @Resource private StudentService studentService;
    
    @RequestMapping(value = "/deleteStudent")
    @ResponseBody
    public String deleteStudent(Student student){
        if(studentService.deleteStudent(student))
            return ResponseData.success("删除成功");
        else
            return ResponseData.error("删除失败");
    }
    @RequestMapping(value = "/addStudent")
    @ResponseBody
    public String addStudent(Student student){
        if("".equals(student.getStuName())){
            return ResponseData.error("姓名为空");
        }
        if("".equals(student.getStuNo())){
            return ResponseData.error("学号为空");
        }
        /*if("".equals(student.getStuIdcard())){
            return ResponseData.error("身份证为空");
        }*/
        else {
            if (studentService.addStudent(student)) {
                return ResponseData.success("添加成功");
            } else {
                return ResponseData.error("添加失败");
            }
        }
    }

    @RequestMapping(value = "/getAllStudent")
    @ResponseBody
    public String getAllStudent(@RequestParam String pageNum, String stuName, String stuDepart, String stuSex,HttpServletRequest request) {
        if("".equals(pageNum)||pageNum== null){
            pageNum="1";
        }
        if("".equals(stuSex)||stuSex==null){
            stuSex="10";
        }
        Student student = new Student();
        student.setStuName(stuName);
        student.setStuDepart(stuDepart);
        student.setStuSex(Integer.parseInt(stuSex));
        PageHelper.startPage(Integer.parseInt(pageNum), 10,true);
        List<Student> ls = studentService.getAllStudent(student);
        PageInfo<Student> ps = new PageInfo<Student>(ls);
        if(ps.getTotal()!=0){
            return ResponseData.buildList(ls,ps);
        }
        return ResponseData.error("没有学生");
    }

    @RequestMapping(value = "/getUserByCondition")
    @ResponseBody
    public String getAllStudent(Student student){
        List<Student> lu = studentService.getStudentByCondition(student);
        return ResponseData.buildList(lu);
    }
    @RequestMapping(value = "/updateStudentPsw",method = RequestMethod.POST)
    @ResponseBody
    public  String updateStudentPsw(Student student, @RequestParam String oldpsw, HttpServletRequest httpServletRequest){
        if(oldpsw.equals(httpServletRequest.getSession().getAttribute("student_password"))){
            return  ResponseData.error("旧密码输入错误");
        }
        if(studentService.updateStudentPsw(student)) {
            return ResponseData.success("修改成功");
        }
        else
            return ResponseData.error("系统异常");
    }
    @RequestMapping(value = "/updateStudent",method = RequestMethod.POST)
    @ResponseBody
    public String updateStudent(Student student, HttpServletRequest request){
        if (studentService.updateStudent(student)){
            request.getSession().setAttribute("stuSex", student.getStuSex());
            request.getSession().setAttribute("stuAddress", student.getStuAddress());
            request.getSession().setAttribute("stuTel", student.getStuTel());
            request.getSession().setAttribute("stuEmail", student.getStuEmail());
            return ResponseData.success("修改成功");
        }
        return ResponseData.error("修改失败");

    }

    @RequestMapping(value = "/updateStudentPswAll")
    @ResponseBody
    public String updateStudentPswAll(String[] stuId) {
        if(studentService.updateStudentPswAll(stuId)){
            return ResponseData.success("密码重置成功");
        }
        return ResponseData.error("重置密码失败");
    }

}
