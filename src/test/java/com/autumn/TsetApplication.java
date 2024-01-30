package com.autumn;

import com.autumn.common.mail.MailBean;
import com.autumn.common.mail.MailUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class TsetApplication {

    @Resource
    private MailUtil mailUtil;

    @Test
    void contextLoads() {

        MailBean mailBean = new MailBean();
        mailBean.setRecipient("1060590974@qq.com");
        mailBean.setSubject("测试标题");
        mailBean.setContent("测试邮件发送内容");
        mailUtil.sendSimpleMail(mailBean);

    }

}
