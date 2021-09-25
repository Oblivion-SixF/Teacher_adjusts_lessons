package com.lessons.service;

import com.lessons.POJO.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {

    List<Teacher> findAllTeacher();

    List<Leadership> findAllLeadership();

    List<AdjustClass> findAllAdjust();

    List<SupplementClass> findAllSupplement();

    int deleteTeacher(String account);

    int deleteLeadership(String account);

    int deleteAdjust(String id);

    int deleteSupplement(String id);

    int updateTeacher(String id);

    int updateLeadership(String id);

    int insertTeacher(Teacher teacher);

    int insertLeadership(Leadership leadership);

    List<FeedbackTb> findFeedback();

    int updatePassword(String account, String password, String passwordNew);

    int insertEmail(String email, String profession, String grade);


}
