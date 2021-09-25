package com.lessons.DAO;

import com.lessons.POJO.AdjustClass;
import com.lessons.POJO.FeedbackTb;
import com.lessons.POJO.SupplementClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {

    List<AdjustClass> findAllAdjust(String teacher_account);

    List<SupplementClass> findAllSupplement(String teacher_account);

    int insertAdjust(AdjustClass adjustClass);

    int insertSupplement(SupplementClass supplementClass);

    int insertFeedback(FeedbackTb feedbackTb);

    int updatePassword(@Param("account") String account, @Param("password") String password, @Param("passwordNew") String passwordNew);

    List<AdjustClass> findNoAdjust(String teacher_account);

    List<SupplementClass> findNoSupplement(String teacher_account);

    String findEmail(@Param("profession") String profession, @Param("grade") String grade);

    int updateNotice(String id);

    int updateNoticeTwo(String id);

}
