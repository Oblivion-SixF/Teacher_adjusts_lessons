package com.lessons.DAO;

import com.lessons.POJO.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author MECHREVO
 */
public interface AdminMapper {

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

    int updatePassword(@Param("account") String account, @Param("password") String password, @Param("passwordNew") String passwordNew);

    int insertEmail(@Param("email") String email, @Param("profession") String profession, @Param("grade") String grade);

}
