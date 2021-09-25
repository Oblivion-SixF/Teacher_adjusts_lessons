package com.lessons.service;


import com.lessons.POJO.AdjustClass;
import com.lessons.POJO.FeedbackTb;
import com.lessons.POJO.SupplementClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherService {

    List<AdjustClass> findAllAdjust(String teacher_account);

    List<SupplementClass> findAllSupplement(String teacher_account);

    int insertAdjust(AdjustClass adjustClass);

    int insertSupplement(SupplementClass supplementClass);

    int insertFeedback(FeedbackTb feedbackTb);

    int updatePassword(String account, String password, String passwordNew);

    List<AdjustClass> findNoAdjust(String teacher_account);

    List<SupplementClass> findNoSupplement(String teacher_account);

    String findEmail(String profession, String grade);

    int updateNotice(String id);

    int updateNoticeTwo(String id);


}
