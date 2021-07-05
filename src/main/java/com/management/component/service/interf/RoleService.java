package com.management.component.service.interf;

import com.management.entity.Role;

import java.util.List;

public interface RoleService {

    List<Role> getRoleListById(List<Integer> adminIdList);


    public List<Integer> getRoleIdList(List<Integer> adminIdList);

    public List<Integer> getRoleIdListByAdminId(Integer adminId);
}
