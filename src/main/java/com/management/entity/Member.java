package com.management.entity;

import java.util.Date;

public class Member {
    private Integer id;

    private String memberAccount;

    private String memberPassword;

    private String memberName;

    private Integer memberGender;

    private String memberPhonenum;

    private String memberEmail;

    private String memberAddress;

    private Date createTime;

    private Integer state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMemberAccount() {
        return memberAccount;
    }

    public void setMemberAccount(String memberAccount) {
        this.memberAccount = memberAccount == null ? null : memberAccount.trim();
    }

    public String getMemberPassword() {
        return memberPassword;
    }

    public void setMemberPassword(String memberPassword) {
        this.memberPassword = memberPassword == null ? null : memberPassword.trim();
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName == null ? null : memberName.trim();
    }

    public Integer getMemberGender() {
        return memberGender;
    }

    public void setMemberGender(Integer memberGender) {
        this.memberGender = memberGender;
    }

    public String getMemberPhonenum() {
        return memberPhonenum;
    }

    public void setMemberPhonenum(String memberPhonenum) {
        this.memberPhonenum = memberPhonenum == null ? null : memberPhonenum.trim();
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail == null ? null : memberEmail.trim();
    }

    public String getMemberAddress() {
        return memberAddress;
    }

    public void setMemberAddress(String memberAddress) {
        this.memberAddress = memberAddress == null ? null : memberAddress.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Member(Integer id, String memberAccount, String memberPassword, String memberName, Integer memberGender, String memberPhonenum, String memberEmail, String memberAddress, Date createTime, Integer state) {
        this.id = id;
        this.memberAccount = memberAccount;
        this.memberPassword = memberPassword;
        this.memberName = memberName;
        this.memberGender = memberGender;
        this.memberPhonenum = memberPhonenum;
        this.memberEmail = memberEmail;
        this.memberAddress = memberAddress;
        this.createTime = createTime;
        this.state = state;
    }

    public Member() {
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", memberAccount='" + memberAccount + '\'' +
                ", memberPassword='" + memberPassword + '\'' +
                ", memberName='" + memberName + '\'' +
                ", memberGender=" + memberGender +
                ", memberPhonenum='" + memberPhonenum + '\'' +
                ", memberEmail='" + memberEmail + '\'' +
                ", memberAddress='" + memberAddress + '\'' +
                ", createTime=" + createTime +
                ", state=" + state +
                '}';
    }
}