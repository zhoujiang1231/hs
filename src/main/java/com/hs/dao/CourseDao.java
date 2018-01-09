package com.hs.dao;

import com.hs.entity.Course;

import java.util.List;

/**
 * Created by zj on 2018年1年9日.
 */
public interface CourseDao {
    public List<Course> getAllCourse(String user_id);
}
