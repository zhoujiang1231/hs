package com.hs.service;

import com.hs.mapper.AdminMapper;
import com.hs.entity.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zj on 2018年1年6日.
 */
@Service
public class AdminService {
    @Resource private AdminMapper adminMapper;

    public Admin getLoginAdmin(Admin admin) {
        return adminMapper.getLoginAdmin(admin);
    }

    public boolean addAdmin(Admin admin) {
        if(adminMapper.addAdmin(admin)>0){
            return true;
        }
        return false;
    }

    public boolean updateAdminPsw(Admin admin) {
        if(adminMapper.updateAdminPsw(admin)>0){
            return true;
        }
        return false;
    }

    public List<Admin> getAllAdmin() {
        return adminMapper.getAllAdmin();
    }

    public boolean deleteAdmin(Admin admin) {
        if(adminMapper.deleteAdmin(admin)>0){
            return true;
        }
        return false;
    }
}
