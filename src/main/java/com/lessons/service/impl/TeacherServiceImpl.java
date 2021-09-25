package com.lessons.service.impl;


import com.lessons.DAO.TeacherMapper;
import com.lessons.POJO.AdjustClass;
import com.lessons.POJO.FeedbackTb;
import com.lessons.POJO.SupplementClass;
import com.lessons.POJO.Teacher;
import com.lessons.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class TeacherServiceImpl implements TeacherService {

    @Resource
    private TeacherMapper teacherMapper;

    @Override
    public List<AdjustClass> findAllAdjust(String teacher_account) {
        return teacherMapper.findAllAdjust(teacher_account);
    }

    @Override
    public List<SupplementClass> findAllSupplement(String teacher_account) {
        return teacherMapper.findAllSupplement(teacher_account);
    }

    @Override
    public int insertAdjust(AdjustClass adjustClass) {
        return teacherMapper.insertAdjust(adjustClass);
    }

    @Override
    public int insertSupplement(SupplementClass supplementClass) {
        return teacherMapper.insertSupplement(supplementClass);
    }

    @Override
    public int insertFeedback(FeedbackTb feedbackTb) {
        return teacherMapper.insertFeedback(feedbackTb);
    }

    @Override
    public int updatePassword(String account, String password, String passwordNew) {
        return teacherMapper.updatePassword(account,password,passwordNew);
    }

    @Override
    public List<AdjustClass> findNoAdjust(String teacher_account) {
        return teacherMapper.findNoAdjust(teacher_account);
    }

    @Override
    public List<SupplementClass> findNoSupplement(String teacher_account) {
        return teacherMapper.findNoSupplement(teacher_account);
    }

    @Override
    public String findEmail(String profession, String grade) {
        return teacherMapper.findEmail(profession, grade);
    }

    @Override
    public int updateNotice(String id) {
        return teacherMapper.updateNotice(id);
    }

    @Override
    public int updateNoticeTwo(String id) {
        return teacherMapper.updateNoticeTwo(id);
    }
}
