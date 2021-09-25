package com.lessons.DAO;

import com.lessons.POJO.AdjustClass;
import com.lessons.POJO.FeedbackTb;
import com.lessons.POJO.SupplementClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LeadershipMapper {

    List<AdjustClass> findAllAdjust(String leadership_college);

    List<SupplementClass> findAllSupplement(String leadership_college);

    List<AdjustClass> findAno(String leadership_college);

    List<SupplementClass> findSno(String leadership_college);

    int updateStatusYes(int id);

    int updateStatusNo(int id);

    int updateStatusZMYes(int id);

    int insertFeedback(FeedbackTb feedbackTb);

    int updatePassword(@Param("account") String account, @Param("password") String password, @Param("passwordNew") String passwordNew);


}
