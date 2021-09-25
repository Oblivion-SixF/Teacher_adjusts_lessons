package com.lessons.controller;


import com.lessons.POJO.AdjustClass;
import com.lessons.POJO.FeedbackTb;
import com.lessons.POJO.SupplementClass;
import com.lessons.service.LeadershipService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LeadershipController {

    @Resource
    private LeadershipService leadershipService;

    /**
     *recording
     */
    @RequestMapping(value = "/leadership/me",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public Map<String,Object> find(@RequestParam("college")String college){
        List<AdjustClass> allAdjust = leadershipService.findAllAdjust(college);
        List<SupplementClass> allSupplement = leadershipService.findAllSupplement(college);
        HashMap<String, Object> allMap = new HashMap<>();
        allMap.put("adjust",allAdjust);
        allMap.put("supplement",allSupplement);
        System.out.println(college);
        return allMap;
    }

    /**
     * adjustClass
     */
    @RequestMapping(value = "leadership/adjust",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public List<AdjustClass> findA(@RequestParam("college") String college){
        return leadershipService.findAno(college);
    }

    /**
     * makeUpAMissedLesson
     */
    @RequestMapping(value = "leadership/supplement",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public List<SupplementClass> findS(@RequestParam("college") String college){
        return leadershipService.findSno(college);
    }

    /**
     * yes
     */
    @RequestMapping(value = "leadership/yes",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int updateAdjustY(@RequestParam("id")int id){
        return leadershipService.updateStatusYes(id);
    }

    /**
     * no
     */
    @RequestMapping(value = "leadership/no",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int updateAdjustN(@RequestParam("id")int id){
        return leadershipService.updateStatusNo(id);
    }

    /**
     * ZMYes
     */
    @RequestMapping(value = "leadership/by",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int updateAdjustZM(@RequestParam("id")int id){
        return leadershipService.updateStatusZMYes(id);
    }

    /**
     * feedback_submission
     */
    @RequestMapping(value = "/leadership/feedback",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int insertF(@RequestBody FeedbackTb feedbackTb) {
        System.out.println(leadershipService.insertFeedback(feedbackTb));
        return leadershipService.insertFeedback(feedbackTb);
    }

    /**
     * change_password
     */
    @RequestMapping(value = "/leadership/password",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int updateP(@RequestBody Map<String,String> map) {
        String account = map.get("account");
        String password = map.get("password");
        String passwordNew = map.get("passwordNew");
        return leadershipService.updatePassword(account,password,passwordNew);
    }
}
