package com.hs.dao;

import com.hs.entity.Course;

import java.util.List;
import java.util.Map;

/**
 * Created by zj on 2018年1年9日.
 */
public interface CourseDao {
    public List<Course> getAllCourse();

    public int choseCourse(Map map);
    public int addCourseStudent(Map map);
    public int deleteCourseStudent(Integer csId);
}
