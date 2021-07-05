package com.management.component.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.management.component.mapper.AdminMapper;
import com.management.component.mapper.AdminMapper;
import com.management.component.mapper.RoleMapper;
import com.management.component.service.interf.AdminService;
import com.management.component.service.interf.RoleService;
import com.management.entity.Admin;
import com.management.entity.AdminExample;
import com.management.entity.AdminInfo;
import com.management.entity.Role;
import com.management.utils.constant.Constant;
import com.management.utils.exception.LoginAcctAlreadyInUseException;
import com.management.utils.exception.LoginFailedException;
import com.management.utils.util.Util;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Service
public class AdminServerImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private RoleService roleService;
    public Admin getAdmin(Integer id){
        Admin admin = adminMapper.selectByPrimaryKey(id);
        return admin;
    }
    /*
    * 获取登录账号
    * */
    public Admin getAdminByLoginAccount(String loginAccount,String loginPassword){
        //创建AdminExample
        AdminExample adminExample=new AdminExample();
        //封装查询条件
        AdminExample.Criteria criteria=adminExample.createCriteria();
        criteria.andLoginAccountEqualTo(loginAccount);
        List<Admin> adminList= adminMapper.selectByExample(adminExample);
        if (adminList.size()==0||adminList==null) {
            throw  new LoginFailedException(Constant.MESSAGE_LOGIN_UserNameFAILED);
        }
        if (adminList.size()>1) {
            throw new LoginFailedException(Constant.MESSAGE_SYSTEM_ERROR_LOGIN_NOT_UNIQUE);
        }
        Admin admin = adminList.get(0);
        if (admin == null) {
            throw new LoginFailedException(Constant.MESSAGE_LOGIN_UserNameFAILED);
        }
        String encodePassword = Util.md5(loginPassword);
        String adminPassword = admin.getLoginPassword();
        if (!Objects.equals(encodePassword, adminPassword)) {
            throw new LoginFailedException(Constant.MESSAGE_LOGIN_PassWordFAILED);
        }

        return admin;
    }
    /*
    * 执行保存用户
    * */

    public void saveAdmin(Admin admin) {
        // 生成当前系统时间
        String DateFormat = "yyyy-MM-dd";
        admin.setCreateTime(new Date());
        // 对提交的密码加密
        String source = admin.getLoginPassword();
        String encoded = Util.md5(source);
        admin.setLoginPassword(encoded);
        try {
            adminMapper.insert(admin);
        } catch (Exception e) {
            e.printStackTrace();
            // 检测当前捕获的异常对象， 如果是 DuplicateKeyException 类型说明是账号重复导致的
            if (e instanceof DuplicateKeyException) {
                // 抛出自定义的 LoginAcctAlreadyInUseException 异常
                throw new LoginAcctAlreadyInUseException(Constant.MESSAGE_LOGIN_ACCT_ALREADY_IN_USE);
            }
        }
    }
    public PageInfo<AdminInfo> getAdminByKeyword(Integer pageNum, Integer pageSize,String keyword){
        PageHelper.startPage(pageNum,pageSize);
        List<Admin> adminList=adminMapper.selectAdminByKeyword(keyword);
        List<AdminInfo> adminInfoList=new ArrayList<>();
        for (Admin admin:adminList) {
            List<Role> roles=null;
            List<Integer> roleIdList = roleService.getRoleIdListByAdminId(admin.getId());
            if (roleIdList != null && roleIdList.size()!=0) {
                roles=roleService.getRoleListById(roleIdList);
                AdminInfo NewAdmin=new AdminInfo();
                BeanUtils.copyProperties(admin,NewAdmin);
                NewAdmin.setRoleList(roles);
                adminInfoList.add(NewAdmin);
            }else {
                AdminInfo NewAdmin=new AdminInfo();
                BeanUtils.copyProperties(admin,NewAdmin);
                NewAdmin.setRoleList(roles);
                adminInfoList.add(NewAdmin);
            }
        }
        PageInfo<AdminInfo> adminInfoPageInfo=new PageInfo<>();
        PageInfo<Admin> adminPageInfo=new PageInfo<>(adminList);
        BeanUtils.copyProperties(adminPageInfo,adminInfoPageInfo);
        adminInfoPageInfo.setList(adminInfoList);
        return adminInfoPageInfo;
    }


}
