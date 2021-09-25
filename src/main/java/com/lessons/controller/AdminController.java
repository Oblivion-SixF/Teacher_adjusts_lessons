package com.lessons.controller;


import com.lessons.POJO.*;
import com.lessons.service.AdminService;
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
public class AdminController {

    @Resource
    private AdminService adminService;

    /**
     * get user
     */
    @RequestMapping(value = "/admin/user",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public Map<String,Object> findUser(){
        HashMap<String, Object> map = new HashMap<>();
        List<Teacher> teacher = adminService.findAllTeacher();
        List<Leadership> leadership = adminService.findAllLeadership();
        map.put("teacher",teacher);
        map.put("leadership",leadership);
        return map;
    }

    /**
     * get date
     */
    @RequestMapping(value = "/admin/data",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public Map<String,Object> findData(){
        HashMap<String, Object> map = new HashMap<>();
        List<AdjustClass> adjust = adminService.findAllAdjust();
        List<SupplementClass> supplement = adminService.findAllSupplement();
        map.put("adjust",adjust);
        map.put("supplement",supplement);
        return map;
    }

    /**
     * delete
     */
    @RequestMapping(value = "/admin/delete",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int findData(@RequestBody Map<String,String> map){
        String id = map.get("id");
        System.out.println(id);
        String table = map.get("table");
        System.out.println(table);
        if ("teacher".equals(table)){
            return adminService.deleteTeacher(id);
        }else if ("leadership".equals(table)){
            return adminService.deleteLeadership(id);
        }else if ("adjust".equals(table)){
            return adminService.deleteAdjust(id);
        }else {
            return adminService.deleteSupplement(id);
        }
    }

    /**
     * update
     */
    @RequestMapping(value = "/admin/update",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int update(@RequestBody Map<String,String> map){
        String id = map.get("id");
        String table = map.get("table");
        if ("teacher".equals(table)){
            return adminService.updateTeacher(id);
        }else {
            return adminService.updateLeadership(id);
        }
    }

    /**
     * insertTeacher
     */
    @RequestMapping(value = "/admin/insertT",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int insertT(@RequestBody Teacher teacher){
        return adminService.insertTeacher(teacher);
    }

    /**
     * insertLeadership
     */
    @RequestMapping(value = "/admin/insertL",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int insertL(@RequestBody Leadership leadership){
        return adminService.insertLeadership(leadership);
    }

    /**
     * change_password
     */
    @RequestMapping(value = "/admin/password",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int updateP(@RequestBody Map<String,String> map) {
        String account = map.get("account");
        String password = map.get("password");
        String passwordNew = map.get("passwordNew");
        return adminService.updatePassword(account,password,passwordNew);
    }

    /**
     * feedback
     */
    @RequestMapping(value = "/admin/feedback",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public List<FeedbackTb> findFeedback(){
        return adminService.findFeedback();
    }

    /**
     *
     */
    @RequestMapping(value = "/admin/email",produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public int insertEmail(@RequestBody Map<String,String> map) {
        String email = map.get("email");
        String profession = map.get("profession");
        String grade = map.get("grade");
        return adminService.insertEmail(email,profession,grade);
    }

}
