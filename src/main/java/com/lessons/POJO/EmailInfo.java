package com.lessons.POJO;

public class EmailInfo {
    private int id;
    private String profession;
    private String grade;
    private String email;

    @Override
    public String toString() {
        return "EmailInfo{" +
                "id=" + id +
                ", profession='" + profession + '\'' +
                ", grade='" + grade + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
