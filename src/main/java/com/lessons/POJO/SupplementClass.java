package com.lessons.POJO;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class SupplementClass {
    private int id;
    private String teacher_account;
    private String profession;
    private String grade;
    private String lesson;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    private String classroom;
    private String time;
    private Integer status;
    private Integer notice;
    private String teacher_name;

    @Override
    public String toString() {
        return "SupplementClass{" +
                "id=" + id +
                ", teacher_account='" + teacher_account + '\'' +
                ", profession='" + profession + '\'' +
                ", grade='" + grade + '\'' +
                ", lesson='" + lesson + '\'' +
                ", date=" + date +
                ", classroom='" + classroom + '\'' +
                ", time='" + time + '\'' +
                ", status=" + status +
                ", notice=" + notice +
                ", teacher_name='" + teacher_name + '\'' +
                '}';
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTeacher_account() {
        return teacher_account;
    }

    public void setTeacher_account(String teacher_account) {
        this.teacher_account = teacher_account;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getLesson() {
        return lesson;
    }

    public void setLesson(String lesson) {
        this.lesson = lesson;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getNotice() {
        return notice;
    }

    public void setNotice(Integer notice) {
        this.notice = notice;
    }
}
