package com.hs.dao;

import com.hs.entity.Course;

import java.util.List;
import java.util.Map;

/**
 * Created by zj on 2018年1年9日.
 */
public interface CourseDao {
    public List<Course> getAllCourse(Course course);

    public List<Course> getAllTeacherCourse(Map map);

    public int choseCourse(Map map);

    public int unchoseCourse(Map map);

    public int addCourseStudent(Map map);

    public int deleteCourseStudent(Map map);

    public int addCourse(Course course);

    public int deleteCourse(int cId);

    public int deleteCourseForStudent(int cId);

    public int deleteCourseBatch(int[] cId);

    public int deleteCourseForStudentBatch(int[] cId);

    public int addCourseTeacher(Map map);
}
