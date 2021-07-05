package com.management.component.service.impl;

import com.management.component.mapper.RoleMapper;
import com.management.component.service.interf.RoleService;
import com.management.entity.Role;
import com.management.entity.RoleExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public List<Role> getRoleListById(List<Integer> adminIdList) {
        RoleExample roleExample=new RoleExample();
        RoleExample.Criteria criteria= roleExample.createCriteria();
        criteria.andIdIn(adminIdList);
        List<Role> roleList = roleMapper.selectByExample(roleExample);
        return roleList;
    }


    public List<Integer> getRoleIdList(List<Integer> adminIdList){
        List<Integer> list = roleMapper.selectRoleIdByAdminIds(adminIdList);
        return list;
    }

    @Override
    public List<Integer> getRoleIdListByAdminId(Integer adminId) {
        List<Integer> list = roleMapper.selectRoleIdByAdminId(adminId);
        return list;
    }
}
