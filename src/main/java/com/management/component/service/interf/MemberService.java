package com.management.component.service.interf;

import com.github.pagehelper.PageInfo;
import com.management.entity.Member;
import com.management.utils.util.ResultEntity;

import java.util.List;

public interface MemberService {
    public Member getMemberById(Integer id);
    PageInfo<Member> getMemberByKeyword(Integer pageNum, Integer pageSize,String keyword);

    ResultEntity<String> updateUser(Member member);

    void deleteUser(List<Integer> idList);

    ResultEntity<String> addUsers(Member member);
}
