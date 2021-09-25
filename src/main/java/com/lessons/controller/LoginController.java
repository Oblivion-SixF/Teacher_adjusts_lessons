package com.lessons.controller;

import com.lessons.POJO.Admin;
import com.lessons.POJO.Leadership;
import com.lessons.POJO.Teacher;
import com.lessons.service.LoginService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class LoginController {

    @Resource
    private LoginService loginService;
    /**
     * admin login
     */

    @RequestMapping("/login/admin")
    public String finByAdmin(@Param("account")String account, @Param("password")String password,Model model){
        Admin admin = loginService.findByAdmin(account,password);
        System.out.println(admin);
        if (admin==null || "".trim().equals(admin)){
            model.addAttribute("ok","0");
            return "views/login";
        }else {
            model.addAttribute("name",admin.getName());
        }
        return "views/admin";
    }

    /**
     * teacher login
     */

    @RequestMapping("/login/teacher")
    public String finByTeacher(@Param("account")String account, @Param("password")String password,Model model){
        Teacher teacher = loginService.findByTeacher(account,password);
        System.out.println(teacher);
        if (teacher==null || "".trim().equals(teacher)){
            model.addAttribute("ok","0");
            return "views/login";
        }else {
            model.addAttribute("name",teacher.getTeacher_name());
            model.addAttribute("college",teacher.getTeacher_college());
        }
        return "views/teacher";
    }

    /**
     * leadership login
     */

    @RequestMapping("/login/leadership")
    public String finByLeadership(@Param("account")String account, @Param("password")String password,Model model){
        Leadership leadership = loginService.findByLeadership(account,password);
        System.out.println(leadership);
        if (leadership==null || "".trim().equals(leadership)){
            model.addAttribute("ok","0");
            return "views/login";
        }else {
            model.addAttribute("name",leadership.getLeadership_name());
            model.addAttribute("college",leadership.getLeadership_college());
        }
        return "views/leadership";
    }


}
