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

    public boolean choeseCourse(Map map) throws Exception{
        if(courseDao.choseCourse(map)>0&&courseDao.addCourseStudent(map)>0){
            return true;
        }
        return false;
    }

    public boolean unchoeseCourse(Map map) throws Exception {
        if(courseDao.unchoseCourse(map)>0&&courseDao.deleteCourseStudent(map)>0){
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
        if (courseDao.deleteCourse(cId) > 0 && courseDao.deleteCourseForStudent(cId) != -1) {
            return true;
        }
        return false;
    }

    public boolean deleteCourseBatch(int[] cId) {
        if(courseDao.deleteCourseBatch(cId)>0&&courseDao.deleteCourseForStudentBatch(cId)!= -1){
            return true;
        }
        return false;
    }
}
