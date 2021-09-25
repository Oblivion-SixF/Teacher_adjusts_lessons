package com.lessons.controller;


import com.lessons.POJO.AdjustClass;
import com.lessons.POJO.FeedbackTb;
import com.lessons.POJO.SupplementClass;
import com.lessons.POJO.Teacher;
import com.lessons.service.TeacherService;
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
public class TeacherController {

    @Resource
    private TeacherService teacherService;

    /**
     * my information inquiry
     * **/
    @RequestMapping(value = "/teacher/me",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public Map<String,Object> find(@RequestParam("account")String account){
        List<AdjustClass> allAdjust = teacherService.findAllAdjust(account);
        List<SupplementClass> allSupplement = teacherService.findAllSupplement(account);
        HashMap<String, Object> allMap = new HashMap<>();
        allMap.put("adjust",allAdjust);
        allMap.put("supplement",allSupplement);
        System.out.println(allMap);
        return allMap;
    }

    /**
     * application-data-entry
     */
    @RequestMapping(value = "/teacher/adjust",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int insertA(@RequestBody AdjustClass adjustClass) {
        return teacherService.insertAdjust(adjustClass);
    }


    /**
     * proof_of_data_entry
     */
    @RequestMapping(value = "/teacher/supplement",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int insertS(@RequestBody SupplementClass supplementClass) {
        return teacherService.insertSupplement(supplementClass);
    }

    /**
     * feedback_submission
     */
    @RequestMapping(value = "/teacher/feedback",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int insertF(@RequestBody FeedbackTb feedbackTb) {
        return teacherService.insertFeedback(feedbackTb);
    }

    /**
     * change_password
     */
    @RequestMapping(value = "/teacher/password",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int updateP(@RequestBody Map<String,String> map) {
        String account = map.get("account");
        String password = map.get("password");
        String passwordNew = map.get("passwordNew");
        return teacherService.updatePassword(account,password,passwordNew);
    }

    /**
     * NoNotice
     * **/
    @RequestMapping(value = "/teacher/advice",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public Map<String,Object> findNo(@RequestParam("account")String account){
        List<AdjustClass> allAdjust = teacherService.findNoAdjust(account);
        List<SupplementClass> allSupplement = teacherService.findNoSupplement(account);
        HashMap<String, Object> noMap = new HashMap<>();
        noMap.put("adjust",allAdjust);
        noMap.put("supplement",allSupplement);
        System.out.println(noMap);
        return noMap;
    }

    /**
     * update Notice
     * **/
    @RequestMapping(value = "/teacher/notice",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int notice(@RequestBody Map<String,String> map) throws Exception {
        String profession = map.get("profession");
        String grade = map.get("grade");
        String email = teacherService.findEmail(profession,grade);
        EmailSender emailSender = new EmailSender();
        emailSender.emailSend(map,email);
        System.out.println(map.get("type"));
        String id = map.get("id");
        if ("BkTz".equals(map.get("type"))){
            teacherService.updateNotice(id);
        }else {
            teacherService.updateNoticeTwo(id);
        }
        return 1;
    }

}
