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
        mailBean.setSubject("疫苗接种提醒");
        mailBean.setContent("最贵的用户你好，提醒注册用户疫苗流程如下：");
        mailUtil.sendSimpleMail(mailBean);

    }

}
