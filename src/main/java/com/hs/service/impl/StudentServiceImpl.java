package com.hs.service.impl;

import com.hs.dao.StudentDao;
import com.hs.entity.Student;
import com.hs.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Resource private StudentDao studentDao;

    public Student getLoginStudent(Student student) {
        return studentDao.getLoginStudent(student);
    }

    public boolean addStudent(Student student) {
        if(studentDao.addStudent(student)>0){
            return true;
        }
        return false;
    }

    public boolean updateStudentPsw(Student student) {
        if(studentDao.updateStudentPsw(student)>0){
            return true;
        }
        return false;
    }

    public boolean updateStudentPswAll(String[] stuId) {
        if(studentDao.updateStudentPswAll(stuId)>0) {
            return true;
        }
        return false;
    }

    public boolean updateStudent(Student student) {
        if(studentDao.updateStudent(student)>0){
            return true;
        }
        return false;
    }

    public List<Student> getAllStudent(Student student) {
        return studentDao.getAllStudent(student);
    }

    public List<Student> getStudentByCondition(Student student) {
        return studentDao.getStudentByCondition(student);
    }

    public boolean deleteStudent(Student student) {
        if(studentDao.deleteStudent(student)>0&&studentDao.deleteStudentCourse(student)!=-1){
            return true;
        }
        return false;
    }
}
