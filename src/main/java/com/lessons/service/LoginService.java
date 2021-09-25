package com.lessons.service;

import com.lessons.POJO.Admin;
import com.lessons.POJO.Leadership;
import com.lessons.POJO.Teacher;

public interface LoginService {

    Admin findByAdmin(String account, String password);

    Teacher findByTeacher(String account, String password);

    Leadership findByLeadership(String account, String password);

}
