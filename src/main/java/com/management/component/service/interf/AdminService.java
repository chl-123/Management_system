package com.management.component.service.interf;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.management.entity.Admin;
import com.management.entity.AdminInfo;

public interface AdminService {
    public Admin getAdmin(Integer id);
    Admin getAdminByLoginAccount(String loginAccount,String loginPassword);

    void saveAdmin(Admin admin);
    public PageInfo<AdminInfo> getAdminByKeyword(Integer pageNum, Integer pageSize, String keyword);
}
