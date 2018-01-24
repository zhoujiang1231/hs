package com.hs.service;

import com.hs.entity.Course;

import java.util.List;
import java.util.Map;

/**
 * Created by zj on 2018年1年9日.
 */
public interface CourseService {
    public List<Course> getAllCourse(Course course);

    public List<Course> getAllTeacherCourse(Map map);

    public List<Course> getAllStudentCourse(Integer sutId);

    public boolean choeseCourse(Map map);

    public boolean unchoeseCourse(Map map);

    public boolean addCourse(Course course);

    public boolean deleteCourse(int cId);

    public boolean deleteCourseBatch(int[] cId);
    public List<Course> getAllStudentCourse(int stuId);
}
