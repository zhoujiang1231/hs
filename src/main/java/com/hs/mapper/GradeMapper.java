package com.hs.mapper;

import com.hs.entity.Grade;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

/**
 * @Author: zj
 * @Date: 2018-05-02
 **/
@Mapper
public interface GradeMapper {
    public List<Grade> getStudentGrade(Grade grade);

    public int updateGrade(Grade grade);

    public int addStudentGrade(Grade grade);

    public int deleteStudentGrade(Grade grade);

    public List<Grade> getAllGradeByCourse(Integer cId);

    public List<Grade> getAllGrade();

    public List<Grade> getAllGradeByCon(HashMap map);

    public Grade getGradeByCourseAndStu(Grade grade);
}
