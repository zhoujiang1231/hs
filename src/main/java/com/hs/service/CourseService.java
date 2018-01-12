package com.hs.service;

import com.hs.entity.Course;

import java.util.List;
import java.util.Map;

/**
 * Created by zj on 2018年1年9日.
 */
public interface CourseService {
    public List<Course> getAllCourse();

    public boolean choeseCourse(Map map) throws Exception;

    public boolean unchoeseCourse(Map map) throws Exception;
}
