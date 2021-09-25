package com.lessons.service.impl;

import com.lessons.DAO.AdminMapper;
import com.lessons.POJO.*;
import com.lessons.service.AdminService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public List<Teacher> findAllTeacher() {
        return adminMapper.findAllTeacher();
    }

    @Override
    public List<Leadership> findAllLeadership() {
        return adminMapper.findAllLeadership();
    }

    @Override
    public List<AdjustClass> findAllAdjust() {
        return adminMapper.findAllAdjust();
    }

    @Override
    public List<SupplementClass> findAllSupplement() {
        return adminMapper.findAllSupplement();
    }

    @Override
    public int deleteTeacher(String account) {
        return adminMapper.deleteTeacher(account);
    }

    @Override
    public int deleteLeadership(String account) {
        return adminMapper.deleteLeadership(account);
    }

    @Override
    public int deleteAdjust(String id) {
        return adminMapper.deleteAdjust(id);
    }

    @Override
    public int deleteSupplement(String id) {
        return adminMapper.deleteSupplement(id);
    }

    @Override
    public int updateTeacher(String id) {
        return adminMapper.updateTeacher(id);
    }

    @Override
    public int updateLeadership(String id) {
        return adminMapper.updateLeadership(id);
    }

    @Override
    public int insertTeacher(Teacher teacher) {
        return adminMapper.insertTeacher(teacher);
    }

    @Override
    public int insertLeadership(Leadership leadership) {
        return adminMapper.insertLeadership(leadership);
    }

    @Override
    public List<FeedbackTb> findFeedback() {
        return adminMapper.findFeedback();
    }

    @Override
    public int updatePassword(String account, String password, String passwordNew) {
        return adminMapper.updatePassword(account,password,passwordNew);
    }

    @Override
    public int insertEmail(String email, String profession, String grade) {
        return adminMapper.insertEmail(email,profession,grade);
    }
}
