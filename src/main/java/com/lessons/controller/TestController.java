package com.lessons.controller;


import com.lessons.POJO.Test;
import com.lessons.service.TestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/test")
public class TestController {

    @Resource
    private TestService testService;

    @RequestMapping("/show/{id}")
    public String findById(@PathVariable("id") int id, Model model){
        Test test = testService.findById(id);
        model.addAttribute("index",test);
        return "login";
    }
}
