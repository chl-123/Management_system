package com.management.component.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.management.component.mapper.MemberMapper;
import com.management.component.service.interf.MemberService;
import com.management.entity.Member;
import com.management.entity.MemberExample;
import com.management.utils.constant.Constant;
import com.management.utils.util.ResultEntity;
import com.management.utils.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;
    @Override
    public Member getMemberById(Integer id) {
        Member member = memberMapper.selectByPrimaryKey(id);
        return member;
    }


    public PageInfo<Member> getMemberByKeyword(Integer pageNum, Integer pageSize,String keyword) {
        PageHelper.startPage(pageNum,pageSize);
        List<Member> memberList= memberMapper.selectMemberByKeyword(keyword);
        return new PageInfo<>(memberList);
    }

    @Override
    public ResultEntity<String> updateUser(Member member) {
        try {
            memberMapper.updateByPrimaryKeySelective(member);

            return ResultEntity.successWithoutData();
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof DuplicateKeyException) {
                return ResultEntity.failed(Constant.MESSAGE_LOGIN_ACCT_ALREADY_IN_USE);
            }
            return ResultEntity.failed(e.getMessage());
        }
    }

    @Override
    public void deleteUser(List<Integer> IdLists) {
        MemberExample memberExample=new MemberExample();
        MemberExample.Criteria memberExampleCriteria = memberExample.createCriteria();
        memberExampleCriteria.andIdIn(IdLists);
        memberMapper.deleteByExample(memberExample);
    }

    @Override
    public ResultEntity<String> addUsers(Member member) {
        String initial_password="123456789";
        member.setCreateTime(new Date());
        String password= Util.md5(initial_password);
        member.setMemberPassword(password);
        member.setState(1);

        try {
            memberMapper.insert(member);
            return ResultEntity.successWithoutData();
        } catch (Exception e) {
            e.printStackTrace();
            if (e instanceof DuplicateKeyException) {
                return ResultEntity.failed(Constant.MESSAGE_LOGIN_ACCT_ALREADY_IN_USE);
            }
            return ResultEntity.failed(e.getMessage());
        }
    }
}
