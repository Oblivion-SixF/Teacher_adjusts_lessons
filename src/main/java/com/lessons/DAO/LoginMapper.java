package com.lessons.DAO;

import com.lessons.POJO.Admin;
import com.lessons.POJO.Leadership;
import com.lessons.POJO.Teacher;
import org.apache.ibatis.annotations.Param;

public interface LoginMapper {

    Admin findByAdmin(@Param("account") String account,@Param("password") String password);

    Teacher findByTeacher(@Param("account") String account,@Param("password") String password);

    Leadership findByLeadership(@Param("account") String account,@Param("password") String password);

}
