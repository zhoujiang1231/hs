package com.hs.service;

import com.hs.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
public interface UserService {
    /**
     * 获取登录用户信息
     * @param user
     * @return
     */
    public User getLoginUser(User user);

    /**
     * 添加用户
     * @param user
     * @return
     */
    public boolean addUser(User user);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    public boolean updateUser(User user);

    /**
     * 修改密码
     * @param user
     * @return
     */
    public boolean updateUserPsw(User user);

    /**
     * 获取所有用户
     * @return
     */
    public List<User> getAllUser();

    /**
     * 获取所有学生
     * @return
     */
    public List<User> getAllStudent();

    /**
     * 获取所有老师
     * @return
     */
    public List<User> getAllTeacher();

    /**
     * 删除用户
     * @param user
     * @return
     */
    public boolean deleteUser(User user);

    /**
     * 查询用户
     * @param user
     * @return
     */
    public List<User> getUsersByCondition(User user);

    /**
     * 添加学生
     * @param user
     * @return
     */
    public boolean addStudent(User user);

    /**
     * 检查登录名是否唯一
     * @param username
     * @return
     */
    public boolean checkUserNameUnique(String username);

    /**
     * 检查学号是否唯一
     * @param sno
     * @return
     */
    public boolean checkSno(String sno);
}
