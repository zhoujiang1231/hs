package com.hs.service.impl;

import com.hs.dao.AdminDao;
import com.hs.entity.Admin;
import com.hs.entity.Student;
import com.hs.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Resource private AdminDao adminDao;

    public Admin getLoginAdmin(Admin admin) {
        return adminDao.getLoginAdmin(admin);
    }

    public boolean addAdmin(Admin admin) {
        if(adminDao.addAdmin(admin)>0){
            return true;
        }
        return false;
    }

    public boolean updateAdminPsw(Admin admin) {
        if(adminDao.updateAdminPsw(admin)>0){
            return true;
        }
        return false;
    }

    public List<Admin> getAllAdmin() {
        return adminDao.getAllAdmin();
    }

    public boolean deleteAdmin(Admin admin) {
        if(adminDao.deleteAdmin(admin)>0){
            return true;
        }
        return false;
    }
}
