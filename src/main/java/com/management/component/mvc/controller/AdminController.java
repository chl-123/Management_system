package com.management.component.mvc.controller;

import com.github.pagehelper.PageInfo;
import com.management.component.service.interf.AdminService;
import com.management.entity.Admin;
import com.management.entity.AdminInfo;
import com.management.entity.Member;
import com.management.utils.util.ResultEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping(value = "/admin/do/login/page.html",method = RequestMethod.POST)
    //@ResponseBody
    public String doLogin(@RequestParam("loginAccount")String loginAccount,@RequestParam("loginPassword")String loginPassword){
        Admin admin = adminService.getAdminByLoginAccount(loginAccount,loginPassword);
        return "user_list";
//        return "role";
    }
    /*
    * 去登录页面
    * */
    @RequestMapping("/admin/to/login/page.html")
    public String toLoginPage(){
        return "login";
    }
    /*
    *
    * 执行注册保存
    * */
    @RequestMapping("/admin/do/register/page.html")
    public String doRegister(Admin admin){
        adminService.saveAdmin(admin);
        System.out.println(admin.getPhoneNumber());
        return "redirect:/admin/to/login/page.html";
    }
    @RequestMapping("/admin/to/member_page/member_add/page.html")
    public String getMember_addPage(){
//        modelMap.addAttribute("url","http://localhost:8081/Management_System/member_page/member-add.jsp");
        return "member_page/member-add";
    }
    @RequestMapping(value = "/admin/get/admin/info.json",method = RequestMethod.POST)
    @ResponseBody
    public ResultEntity<PageInfo<AdminInfo>> showAdminInfo(
            @RequestParam(value = "pageNum" ,defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
            @RequestParam(value = "keyword" ,defaultValue = "")String keyword){
        PageInfo<AdminInfo> adminPageInfo = adminService.getAdminByKeyword(pageNum, pageSize, keyword);
        return ResultEntity.successWithData(adminPageInfo);
    }
}
