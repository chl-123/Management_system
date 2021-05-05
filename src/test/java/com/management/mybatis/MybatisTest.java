package com.management.mybatis;

import com.management.component.service.interf.UserService;
import com.management.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/*.xml"})
public class MybatisTest {
    @Autowired
    private UserService userService;
    @Test
    public void test(){
        User user = userService.getUser(1);
        System.out.println(user.getUserName());
    }
}
