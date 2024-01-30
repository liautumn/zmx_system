package com.autumn.common.mail;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.internet.MimeMessage;

@Component
public class MailUtil {

    @Value("${spring.mail.username}")
    private String MAIL_SENDER; //邮件发送者

    @Autowired
    private JavaMailSenderImpl javaMailSender;

    private Logger logger = LoggerFactory.getLogger(MailUtil.class);

    /**
     * 发送文本邮件
     *
     * @param mailBean
     */
    public void sendSimpleMail(MailBean mailBean, Boolean html) {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            //邮箱发送内容组成
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setSubject(mailBean.getSubject());
            helper.setText(mailBean.getContent(), html);
            helper.setTo(mailBean.getRecipient());
            helper.setFrom("发件人名字" + '<' + MAIL_SENDER + '>');
            javaMailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("邮件发送失败", e.getMessage());
        }
    }

    public void sendSimpleMail(MailBean mailBean) {
        try {
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setFrom(MAIL_SENDER);//发送者
            mailMessage.setTo(mailBean.getRecipient());//接收者
            mailMessage.setSubject(mailBean.getSubject());//邮件标题
            mailMessage.setText(mailBean.getContent());
            javaMailSender.send(mailMessage);//发送邮箱
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("邮件发送失败", e.getMessage());
        }
    }
}
