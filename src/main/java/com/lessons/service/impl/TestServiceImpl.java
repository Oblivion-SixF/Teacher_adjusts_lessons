package com.lessons.service.impl;

import com.lessons.DAO.TestMapper;
import com.lessons.POJO.Test;
import com.lessons.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class TestServiceImpl implements TestService {

    @Resource
    private TestMapper testMapper;

    @Override
    public Test findById(int id) {
        return testMapper.findById(id);
    }
}
