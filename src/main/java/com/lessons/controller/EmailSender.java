package com.lessons.controller;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Map;
import java.util.Properties;

public class EmailSender {

    public void emailSend(Map<String,String> map,String email_to) throws Exception {
        Properties prop = new Properties();
        prop.setProperty("mail.host", "smtp.qq.com");
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.auth", "true");

        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.socketFactory", sf);

        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("1023970167@qq.com", "hmzjhoixuztpbgab");
            }
        });

        session.setDebug(true);

        Transport ts = session.getTransport();
        ts.connect("smtp.qq.com", "1023970167@qq.com", "hmzjhoixuztpbgab");
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress("1023970167@qq.com"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email_to));
        if ("BkTz".equals(map.get("type"))){
            message.setSubject("课程调整通知");
            String sendText = map.get("profession") + "专业" + map.get("grade") + "班" +
                    map.get("lesson") + "课程发生调整<br>调整至" + map.get("date") + "," + map.get("time") + "课节，在"
                    + map.get("classroom") + "教室上课";
            message.setContent(sendText, "text/html;charset=UTF-8");
        }else {
            message.setSubject("补课完成通知");
            String sendOneText = "<h3>" + map.get("profession") + "专业" + map.get("grade") + "班" +
                    map.get("lesson") + "课程已完成补课<br>补课信息为" + map.get("date") + "," + map.get("time") + "课节，在"
                    + map.get("classroom") + "教室完成补课</h3>";
            message.setContent(sendOneText, "text/html;charset=UTF-8");
        }
        ts.sendMessage(message, message.getAllRecipients());
        ts.close();
    }

}
