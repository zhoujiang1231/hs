package com.hs.service;

import com.hs.entity.Course;

import java.util.List;

/**
 * Created by zj on 2018年1年9日.
 */
public interface CourseService {
    public List<Course> getAllCourse(String user_id);
}
