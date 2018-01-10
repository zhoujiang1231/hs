package com.hs.dao;

import com.hs.entity.Admin;

import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */

public interface AdminDao {
    /**
     * 获取登录管理员信息
     * @param admin
     * @return
     */
    public Admin getLoginAdmin(Admin admin);

    /**
     * 添加管理员
     * @param admin
     * @return
     */
    public int addAdmin(Admin admin);

    /**
     * 修改密码
     * @param admin
     * @return
     */
    public int updateAdminPsw(Admin admin);

    /**
     * 获取所有管理员
     * @return
     */
    public List<Admin> getAllAdmin();

    /**
     * 删除管理员
     * @param admin
     * @return
     */
    public int deleteAdmin(Admin admin);

}
