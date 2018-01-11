package com.hs.service;

import com.hs.entity.Teacher;

import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
public interface TeacherService {
    /**
     * 获取登录用户信息
     * @param teacher
     * @return
     */
    public Teacher getLoginTeacher(Teacher teacher);

    /**
     * 添加用户
     * @param teacher
     * @return
     */
    public boolean addTeacher(Teacher teacher);

    /**
     * 修改密码
     * @param teacher
     * @return
     */
    public boolean updateTeacherPsw(Teacher teacher);

    /**
     * 获取所有用户
     * @return
     */
    public List<Teacher> getAllTeacher(String tName);


    /**
     * 删除用户
     * @param teacher
     * @return
     */
    public boolean deleteTeacher(Teacher teacher);

    /**
     * 重置密码
     * @param tId
     * @return
     */
    public boolean updateTeacherPswAll(String[] tId);

}
