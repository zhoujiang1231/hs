package com.hs.mapper;

import com.hs.entity.Teacher;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Mapper
public interface TeacherMapper {
    /**
     * 获取登录老师信息
     * @param teacher
     * @return
     */
    public Teacher getLoginTeacher(Teacher teacher);

    /**
     * 添加老师
     * @param teacher
     * @return
     */
    public int addTeacher(Teacher teacher);

    /**
     * 修改密码
     * @param teacher
     * @return
     */
    public int updateTeacherPsw(Teacher teacher);

    /**
     * 获取所有老师
     * @return
     */
    public List<Teacher> getAllTeacher(String tName);

    /**
     * 删除教师
     * @param teacher
     * @return
     */
    public int deleteTeacher(Teacher teacher);

    /**
     * 删除教师对应的课程
     * @param teacher
     * @return
     */
    public int deleteCourseStudent(Teacher teacher);

    /**
     * 重置密码
     * @param tId
     * @return
     */
    public int updateTeacherPswAll(String[] tId);

}
