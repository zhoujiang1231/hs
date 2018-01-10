package com.hs.service;

import com.hs.entity.Admin;

import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
public interface AdminService {
    /**
     * 获取登录用户信息
     * @param admin
     * @return
     */
    public Admin getLoginAdmin(Admin admin);

    /**
     * 添加用户
     * @param admin
     * @return
     */
    public boolean addAdmin(Admin admin);

    /**
     * 修改密码
     * @param admin
     * @return
     */
    public boolean updateAdminPsw(Admin admin);

    /**
     * 获取所有用户
     * @return
     */
    public List<Admin> getAllAdmin();


    /**
     * 删除用户
     * @param admin
     * @return
     */
    public boolean deleteAdmin(Admin admin);

}
