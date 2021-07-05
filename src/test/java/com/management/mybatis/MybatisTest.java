package com.management.mybatis;

import com.github.pagehelper.PageInfo;
import com.management.component.service.interf.MemberService;
import com.management.component.service.interf.AdminService;
import com.management.component.service.interf.RoleService;
import com.management.entity.Admin;
import com.management.entity.AdminInfo;
import com.management.entity.Member;
import com.management.entity.Role;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/*.xml"})
public class MybatisTest {
    @Autowired
    private AdminService adminService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private RoleService roleService;
    @Test

    public void test(){
//        User user = userService.getUser(1);
//        System.out.println(user.getUserName());
//        Member member = memberService.getMemberById(1);
//        System.out.println(member.toString());
//        PageInfo<Member> memberByKeyword = memberService.getMemberByKeyword(1, 5, "");
//        System.out.println(memberByKeyword.toString());

//        List<Role> roleList=roleService.getRoleListByIdList(idList);
//        System.out.println(roleList.get(1).getName());
        PageInfo<AdminInfo> memberByKeyword = adminService.getAdminByKeyword(2,5,"");
        System.out.println(memberByKeyword.getList().get(3));

    }
}
