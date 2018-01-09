package com.hs.service.impl;

import com.hs.dao.CourseDao;
import com.hs.entity.Course;
import com.hs.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zj on 2018年1年9日.
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Resource private CourseDao courseDao;
    public List<Course> getAllCourse(String user_id) {
        return courseDao.getAllCourse(user_id);
    }
}
