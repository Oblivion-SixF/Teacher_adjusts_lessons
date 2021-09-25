package com.lessons;

import com.lessons.service.TestService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-DAO.xml",
        "classpath:applicationContext-service.xml"})
public class SpringMybatisTest {

    @Autowired
    private TestService testService;

    @Test
    public void test1(){
        System.out.println(testService.findById(1));
    }
}
