package com.hs.service;

import com.hs.entity.Grade;
import com.hs.mapper.GradeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @Author: zj
 * @Date: 2018-05-02
 **/
@Service
public class GradeService {
    @Resource
    private GradeMapper gradeMapper;

    public List<Grade> getStudentGrade(Grade grade){
        return gradeMapper.getStudentGrade(grade);
    }

    public boolean updateGrade(Grade grade){
        if(gradeMapper.updateGrade(grade)>0) return true;
        return false;
    }

    public boolean addStudentGrade(Grade grade){
        if(gradeMapper.addStudentGrade(grade)>0) return true;
        return false;
    }

    public boolean deleteStudentGrade(Grade grade){
        if(gradeMapper.deleteStudentGrade(grade)>0) return true;
        return false;
    }

    public List<Grade> getAllGradeByCourse(Integer cId){
        return gradeMapper.getAllGradeByCourse(cId);
    }

    public List<Grade> getAllGrade(){
        return gradeMapper.getAllGrade();
    }

    public List<Grade> getAllGradeByCon(HashMap map){
        return gradeMapper.getAllGradeByCon(map);
    }
}
