package com.management.component.mvc.controller;

import com.github.pagehelper.PageInfo;
import com.management.component.service.interf.MemberService;
import com.management.entity.Member;
import com.management.utils.util.ResultEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @RequestMapping(value = "/admin/get/member/info.json",method = RequestMethod.POST)
    @ResponseBody
    public ResultEntity<PageInfo<Member>> showMemberInfo(
            @RequestParam(value = "pageNum" ,defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
            @RequestParam(value = "keyword" ,defaultValue = "")String keyword){
        PageInfo<Member> memberPageInfo = memberService.getMemberByKeyword(pageNum, pageSize, keyword);
        return ResultEntity.successWithData(memberPageInfo);
    }
    @RequestMapping("/admin/do/update_user/page.json")
    @ResponseBody
    public ResultEntity<String> doUpdateUser(Member member){
        ResultEntity<String> memberUpdateResultEntity = memberService.updateUser(member);
        return memberUpdateResultEntity;
    }
    @RequestMapping("/admin/do/remove_users/page.json")
    @ResponseBody
    public ResultEntity<String> removeUser(@RequestBody List<Integer> idList){
        memberService.deleteUser(idList);
        System.out.println(idList.get(0));
        return ResultEntity.successWithoutData();
    }
    @RequestMapping("/admin/do/add_user/page.json")
    @ResponseBody
    public ResultEntity<String> addUser(Member member){
        ResultEntity<String> memberResultEntity = memberService.addUsers(member);
        return memberResultEntity;
    }
}
