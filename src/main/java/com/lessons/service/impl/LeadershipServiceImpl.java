package com.lessons.service.impl;

import com.lessons.DAO.LeadershipMapper;
import com.lessons.POJO.AdjustClass;
import com.lessons.POJO.FeedbackTb;
import com.lessons.POJO.SupplementClass;
import com.lessons.service.LeadershipService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
@Transactional
public class LeadershipServiceImpl implements LeadershipService {

    @Resource
    private LeadershipMapper leadershipMapper;

    @Override
    public List<AdjustClass> findAllAdjust(String leadership_college) {
        return leadershipMapper.findAllAdjust(leadership_college);
    }

    @Override
    public List<SupplementClass> findAllSupplement(String leadership_college) {
        return leadershipMapper.findAllSupplement(leadership_college);
    }

    @Override
    public List<AdjustClass> findAno(String leadership_college) {
        return leadershipMapper.findAno(leadership_college);
    }

    @Override
    public List<SupplementClass> findSno(String leadership_college) {
        return leadershipMapper.findSno(leadership_college);
    }

    @Override
    public int updateStatusYes(int id) {
        return leadershipMapper.updateStatusYes(id);
    }

    @Override
    public int updateStatusNo(int id) {
        return leadershipMapper.updateStatusNo(id);
    }

    @Override
    public int updateStatusZMYes(int id) {
        return leadershipMapper.updateStatusZMYes(id);
    }

    @Override
    public int insertFeedback(FeedbackTb feedbackTb) {
        return leadershipMapper.insertFeedback(feedbackTb);
    }

    @Override
    public int updatePassword(String account, String password, String passwordNew) {
        return leadershipMapper.updatePassword(account,password,passwordNew);
    }
}
