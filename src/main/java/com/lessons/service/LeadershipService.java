package com.lessons.service;

import com.lessons.POJO.AdjustClass;
import com.lessons.POJO.FeedbackTb;
import com.lessons.POJO.SupplementClass;

import java.util.List;

public interface LeadershipService {

    List<AdjustClass> findAllAdjust(String leadership_college);

    List<SupplementClass> findAllSupplement(String leadership_college);

    List<AdjustClass> findAno(String leadership_college);

    List<SupplementClass> findSno(String leadership_college);

    int updateStatusYes(int id);

    int updateStatusNo(int id);

    int updateStatusZMYes(int id);

    int insertFeedback(FeedbackTb feedbackTb);

    int updatePassword(String account, String password, String passwordNew);
}
