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
     * 获取所有用户
     * @return
     */
    public List<User> getAllUser();
}
