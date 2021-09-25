package com.lessons.service.impl;

import com.lessons.DAO.LoginMapper;
import com.lessons.POJO.Admin;
import com.lessons.POJO.Leadership;
import com.lessons.POJO.Teacher;
import com.lessons.service.LoginService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

    @Resource
    private LoginMapper loginMapper;

    @Override
    public Admin findByAdmin(String account, String password) {
        return loginMapper.findByAdmin(account,password);
    }

    @Override
    public Teacher findByTeacher(String account, String password) {
        return loginMapper.findByTeacher(account,password);
    }

    @Override
    public Leadership findByLeadership(String account, String password) {
        return loginMapper.findByLeadership(account,password);
    }
}
