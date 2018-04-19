package com.hs.service;

import com.hs.mapper.TeacherMapper;
import com.hs.entity.Teacher;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Service
public class TeacherService {
    @Resource private TeacherMapper teacherMapper;

    public Teacher getLoginTeacher(Teacher teacher) {
        return teacherMapper.getLoginTeacher(teacher);
    }

    public boolean addTeacher(Teacher teacher) {
        if(teacherMapper.addTeacher(teacher)>0){
            return true;
        }
        return false;
    }

    public boolean updateTeacherPsw(Teacher teacher) {
        if(teacherMapper.updateTeacherPsw(teacher)>0){
            return true;
        }
        return false;
    }

    public List<Teacher> getAllTeacher(String tName) {
        return teacherMapper.getAllTeacher(tName);
    }


    public boolean deleteTeacher(Teacher teacher) {
        if(teacherMapper.deleteTeacher(teacher)>0&& teacherMapper.deleteCourseStudent(teacher)!=-1){
            return true;
        }
        return false;
    }

    public boolean updateTeacherPswAll(String[] tId) {
        if(teacherMapper.updateTeacherPswAll(tId)>0){
            return true;
        }
        return false;
    }
}
