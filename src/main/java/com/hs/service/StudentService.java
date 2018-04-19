package com.hs.service;

import com.hs.mapper.StudentMapper;
import com.hs.entity.Student;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Service
public class StudentService {
    @Resource private StudentMapper studentMapper;

    public Student getLoginStudent(Student student) {
        return studentMapper.getLoginStudent(student);
    }

    public boolean addStudent(Student student) {
        if(studentMapper.addStudent(student)>0){
            return true;
        }
        return false;
    }

    public boolean updateStudentPsw(Student student) {
        if(studentMapper.updateStudentPsw(student)>0){
            return true;
        }
        return false;
    }

    public boolean updateStudentPswAll(String[] stuId) {
        if(studentMapper.updateStudentPswAll(stuId)>0) {
            return true;
        }
        return false;
    }

    public boolean updateStudent(Student student) {
        if(studentMapper.updateStudent(student)>0){
            return true;
        }
        return false;
    }

    public List<Student> getAllStudent(Student student) {
        return studentMapper.getAllStudent(student);
    }

    public List<Student> getStudentByCondition(Student student) {
        return studentMapper.getStudentByCondition(student);
    }

    public boolean deleteStudent(Student student) {
        if(studentMapper.deleteStudent(student)>0&& studentMapper.deleteStudentCourse(student)!=-1){
            return true;
        }
        return false;
    }
}
