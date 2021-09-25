package com.lessons.POJO;

public class Leadership {
    private String leadership_account;
    private String leadership_password;
    private String leadership_name;
    private String leadership_college;

    @Override
    public String toString() {
        return "Leadership{" +
                "leadership_account='" + leadership_account + '\'' +
                ", leadership_password='" + leadership_password + '\'' +
                ", leadership_name='" + leadership_name + '\'' +
                ", leadership_collage='" + leadership_college + '\'' +
                '}';
    }

    public String getLeadership_account() {
        return leadership_account;
    }

    public void setLeadership_account(String leadership_account) {
        this.leadership_account = leadership_account;
    }

    public String getLeadership_password() {
        return leadership_password;
    }

    public void setLeadership_password(String leadership_password) {
        this.leadership_password = leadership_password;
    }

    public String getLeadership_name() {
        return leadership_name;
    }

    public void setLeadership_name(String leadership_name) {
        this.leadership_name = leadership_name;
    }

    public String getLeadership_college() {
        return leadership_college;
    }

    public void setLeadership_college(String leadership_college) {
        this.leadership_college = leadership_college;
    }
}
