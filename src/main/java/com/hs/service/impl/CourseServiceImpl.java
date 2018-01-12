package com.hs.service.impl;

import com.hs.dao.CourseDao;
import com.hs.entity.Course;
import com.hs.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by zj on 2018年1年9日.
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Resource private CourseDao courseDao;
    public List<Course> getAllCourse() {
        return courseDao.getAllCourse();
    }

    public boolean choeseCourse(Map map) throws Exception{
        if(courseDao.choseCourse(map)>0&&courseDao.addCourseStudent(map)>0){
            return true;
        }
        return false;
    }

    public boolean unchoeseCourse(Map map) throws Exception {
        Integer csId = (Integer) map.get("csId");
        if(courseDao.choseCourse(map)>0&&courseDao.deleteCourseStudent(csId)>0){
            return true;
        }
        return false;
    }
}
