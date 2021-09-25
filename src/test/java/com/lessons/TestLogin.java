package com.lessons;


import com.lessons.POJO.AdjustClass;
import com.lessons.POJO.Admin;
import com.lessons.POJO.SupplementClass;
import com.lessons.service.AdminService;
import com.lessons.service.LeadershipService;
import com.lessons.service.LoginService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext-DAO.xml",
        "classpath:applicationContext-service.xml"})
public class TestLogin {

    @Autowired
    private LoginService loginService;

    @Resource
    private LeadershipService leadershipService;

    @Resource
    private AdminService adminService;

    @Test
    public void testAdmin(){
        Admin admin = loginService.findByAdmin("admin", "123");
        System.out.println(admin);
    }

    @Test
    public void testLeadership(){
        List<AdjustClass> adjustClass = leadershipService.findAllAdjust("信息工程学院");
        for (AdjustClass aClass : adjustClass) {
            System.out.println(aClass);
        }
    }

    @Test
    public void test(){
        System.out.println(adminService.deleteAdjust("1"));
    }

}
