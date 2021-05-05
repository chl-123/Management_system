package com.management.component.service.impl;

import com.management.component.mapper.UserMapper;
import com.management.component.service.interf.UserService;
import com.management.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServerImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    public User getUser(Integer id){
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }
}
