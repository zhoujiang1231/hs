package com.hs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hs.constant.Const;
import com.hs.entity.Student;
import com.hs.entity.common.ResponseData;
import com.hs.service.StudentService;
import com.hs.utils.StringUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@RestController
@RequestMapping(value = "/student",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class StudentController {
    @Resource private StudentService studentService;
    @Resource private RedisTemplate redisTemplate;
    
    @DeleteMapping(value = "/deleteStudent/{stuId}")
    public String deleteStudent(@PathVariable Integer stuId){
        Student student = new Student();
        student.setStuId(stuId);
        if(studentService.deleteStudent(student))
            return ResponseData.success("删除成功");
        else
            return ResponseData.error("删除失败");
    }
    @PostMapping(value = "/addStudent")
    public String addStudent(@RequestBody Student student){
        if("".equals(student.getStuName())){
            return ResponseData.error("姓名为空");
        }
        if("".equals(student.getStuNo())){
            return ResponseData.error("学号为空");
        }
        Student student1 = studentService.checkUniqueStuNo(student.getStuNo());
        if(student1!=null){
            return ResponseData.error("学号重复");
        }

        if(StringUtil.isNotEmpty(student.getStuIdcard())) {
            Student student2 = studentService.checkUniqueIdCard(student.getStuIdcard());
            if (student2 != null) {
                return ResponseData.error("身份证重复");
            }
        }
        if (studentService.addStudent(student)) {
            return ResponseData.success("添加成功");
        } else {
            return ResponseData.error("添加失败");
        }
    }

    @GetMapping(value = "/getAllStudent")
    public String getAllStudent(@RequestParam Integer start,Integer limit, Student student, HttpServletRequest request) {
        if(start== null){
            start= Const.PAGE_START;
        }
        if(limit== null){
            limit=Const.PAGE_LIMIT;
        }
        if(student.getStuSex()==null){
            student.setStuSex(10);
        }
        PageHelper.startPage(start, limit,true);
        List<Student> ls = studentService.getAllStudent(student);
        PageInfo ps = new PageInfo(ls);
        if(ps.getTotal()!=0){
            return ResponseData.buildList(ls,ps);
        }
        return ResponseData.error("没有学生");
    }

    @GetMapping(value = "/getStudentByCourse")
    public String getStudentByCourse(@RequestParam Integer cId, HttpServletRequest request) {
        if(cId == null){
            return ResponseData.error("请选择课程号");
        }
        List<Student> ls = studentService.getStudentByCourse(cId);
        if(ls!=null && ls.size()!=0){
            return ResponseData.buildList(ls);
        }
        return ResponseData.error("没有学生选择该门课");
    }

    @GetMapping(value = "/getUserByCondition")
    public String getAllStudent(Student student){
        List<Student> lu = studentService.getStudentByCondition(student);
        return ResponseData.buildList(lu);
    }

    @PostMapping(value = "/updateStudent")
    public String updateStudent(@RequestBody Student student, HttpServletRequest request){
        if (studentService.updateStudent(student)){
            HttpSession session = request.getSession();
            return ResponseData.success("修改成功");
        }
        return ResponseData.error("修改失败");

    }

    @GetMapping(value = "/updateStudentPswAll")
    public String updateStudentPswAll(String[] stuId) {
        if(studentService.updateStudentPswAll(stuId)){
            return ResponseData.success("密码重置成功");
        }
        return ResponseData.error("重置密码失败");
    }

}
