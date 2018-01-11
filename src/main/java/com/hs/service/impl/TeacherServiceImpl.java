package com.hs.service.impl;

import com.hs.dao.TeacherDao;
import com.hs.entity.Teacher;
import com.hs.service.TeacherService;
import com.hs.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Service
public class TeacherServiceImpl implements TeacherService {
    @Resource private TeacherDao teacherDao;

    public Teacher getLoginTeacher(Teacher teacher) {
        return teacherDao.getLoginTeacher(teacher);
    }

    public boolean addTeacher(Teacher teacher) {
        if(teacherDao.addTeacher(teacher)>0){
            return true;
        }
        return false;
    }

    public boolean updateTeacherPsw(Teacher teacher) {
        if(teacherDao.updateTeacherPsw(teacher)>0){
            return true;
        }
        return false;
    }

    public List<Teacher> getAllTeacher(String tName) {
        return teacherDao.getAllTeacher(tName);
    }


    public boolean deleteTeacher(Teacher teacher) {
        if(teacherDao.deleteTeacher(teacher)>0){
            return true;
        }
        return false;
    }

    public boolean updateTeacherPswAll(String[] tId) {
        if(teacherDao.updateTeacherPswAll(tId)>0){
            return true;
        }
        return false;
    }
}
