package com.lessons.POJO;

public class Teacher {
    private String teacher_account;
    private String teacher_password;
    private String teacher_name;
    private String teacher_college;

    @Override
    public String toString() {
        return "Teacher{" +
                "teacher_account='" + teacher_account + '\'' +
                ", teacher_password='" + teacher_password + '\'' +
                ", teacher_name='" + teacher_name + '\'' +
                ", teacher_collage='" + teacher_college + '\'' +
                '}';
    }

    public String getTeacher_account() {
        return teacher_account;
    }

    public void setTeacher_account(String teacher_account) {
        this.teacher_account = teacher_account;
    }

    public String getTeacher_password() {
        return teacher_password;
    }

    public void setTeacher_password(String teacher_password) {
        this.teacher_password = teacher_password;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public String getTeacher_college() {
        return teacher_college;
    }

    public void setTeacher_college(String teacher_college) {
        this.teacher_college = teacher_college;
    }
}
