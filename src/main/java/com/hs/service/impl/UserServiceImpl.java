package com.hs.service.impl;

import com.hs.dao.UserDao;
import com.hs.entity.User;
import com.hs.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource private UserDao userDao;
    public User getLoginUser(User user) {
        return userDao.getLoginUser(user);
    }

    public boolean addUser(User user) {
        if(userDao.addUser(user)>0){
            return true;
        }
        return false;
    }

    public boolean updateUser(User user) {
       if(userDao.updateUser(user)>0) {
           return true;
       }
        return false;
    }

    public boolean updateUserPsw(User user) {
        if(userDao.updateUserPsw(user)>0) {
            return true;
        }
        return false;
    }

    public List<User> getAllUser() {
        return userDao.getAllUser();
    }

    public List<User> getAllStudent() {
        return userDao.getAllStudent();
    }

    public List<User> getAllTeacher() {
        return userDao.getAllTeacher();
    }

    public boolean deleteUser(User user) {
        if(userDao.deleteUser(user)>0) {
            return true;
        }
        return false;
    }

    public List<User> getUsersByCondition(User user) {
        return userDao.getUsersByCondition(user);
    }

    public boolean addStudent(User user) {
        if(userDao.addStudent(user)>0) {
            return true;
        }
        return false;
    }

    public boolean checkUserNameUnique(String username) {
        User user = userDao.checkUserNameUnique(username);
        if(user!=null&&user.getUser_name()!=null) {
            return true;
        }
        return false;
    }

    public boolean checkSno(String sno) {
        User user = userDao.checkSno(sno);
        if(user!=null&&user.getSno()!=null) {
            return true;
        }
        return false;
    }
}
