package com.hs.service;

import com.hs.mapper.CourseMapper;
import com.hs.entity.Course;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zj on 2018年1年9日.
 */
@Service
public class CourseService {
    @Resource private CourseMapper courseMapper;
    public List<Course> getAllCourse(Course course) {
        return courseMapper.getAllCourse(course);
    }

    public List<Course> getAllTeacherCourse(Map map) {
        return courseMapper.getAllTeacherCourse(map);
    }

    public List<Course> getAllStudentCourse(Integer stuId) {
        return courseMapper.getAllStudentCourse(stuId);
    }

    public boolean choeseCourse(Map map){
        if(courseMapper.choseCourse(map)>0&& courseMapper.addCourseStudent(map)>0){
            return true;
        }
        return false;
    }

    public boolean unchoeseCourse(Map map){
        if(courseMapper.deleteCourseStudent(map)!=0&& courseMapper.unchoseCourse(map)>0){
            return true;
        }
        return false;
    }

    public boolean addCourse(Course course) {
        if(courseMapper.addCourse(course)>0) {
            Map map = new HashMap();
            map.put("tName",course.getcTeacher());
            map.put("cId",course.getcId());
            courseMapper.addCourseTeacher(map);
            return true;
        }
        return false;
    }

    public boolean deleteCourse(int cId){
        if (courseMapper.deleteCourse(cId) > 0){
            courseMapper.deleteCourseForStudent(cId);
            return true;
        }
        return false;
    }

    public boolean deleteCourseBatch(int[] cId) {
        if(courseMapper.deleteCourseBatch(cId)>0){
            courseMapper.deleteCourseForStudentBatch(cId);
            return true;
        }
        return false;
    }

    public List<Course> getAllStudentCourseNoStatus() {
        return courseMapper.getAllStudentCourseNoStatus();
    }

}
