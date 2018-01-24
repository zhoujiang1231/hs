package com.hs.service.impl;

import com.hs.dao.CourseDao;
import com.hs.entity.Course;
import com.hs.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zj on 2018年1年9日.
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Resource private CourseDao courseDao;
    public List<Course> getAllCourse(Course course) {
        return courseDao.getAllCourse(course);
    }

    public List<Course> getAllTeacherCourse(Map map) {
        return courseDao.getAllTeacherCourse(map);
    }

    public List<Course> getAllStudentCourse(Integer stuId) {
        return courseDao.getAllStudentCourse(stuId);
    }

    public boolean choeseCourse(Map map){
        if(courseDao.choseCourse(map)>0&&courseDao.addCourseStudent(map)>0){
            return true;
        }
        return false;
    }

    public boolean unchoeseCourse(Map map){
        if(courseDao.deleteCourseStudent(map)!=0&&courseDao.unchoseCourse(map)>0){
            return true;
        }
        return false;
    }

    public boolean addCourse(Course course) {
        if(courseDao.addCourse(course)>0) {
            Map map = new HashMap();
            map.put("tName",course.getcTeacher());
            map.put("cId",course.getcId());
            courseDao.addCourseTeacher(map);
            return true;
        }
        return false;
    }

    public boolean deleteCourse(int cId){
        if (courseDao.deleteCourse(cId) > 0){
            courseDao.deleteCourseForStudent(cId);
            return true;
        }
        return false;
    }

    public boolean deleteCourseBatch(int[] cId) {
        if(courseDao.deleteCourseBatch(cId)>0){
            courseDao.deleteCourseForStudentBatch(cId);
            return true;
        }
        return false;
    }

    public List<Course> getAllStudentCourse(int stuId) {
        return courseDao.getAllStudentCourse(stuId);
    }
}
