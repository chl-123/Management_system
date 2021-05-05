package com.management.component.mvc.controller;

import com.management.component.service.interf.UserService;
import com.management.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping(value = "/admin/do/login/page.html",method = RequestMethod.POST)
    @ResponseBody
    public String getUser(@RequestParam("loginAccount")String loginAccount,@RequestParam("loginPassword")String loginPassword){
        System.out.println(loginAccount);
        return "targe";
    }
    @RequestMapping("/admin/to/login/page.html")
    public String toLoginPage(){
        return "login";
    }
}
