package com.autumn.project.system.controller;

import com.alibaba.fastjson2.JSON;
import com.autumn.common.mail.MailBean;
import com.autumn.common.mail.MailUtil;
import com.autumn.common.utils.StringUtils;
import com.autumn.framework.security.RegisterBody;
import com.autumn.framework.security.service.SysRegisterService;
import com.autumn.framework.web.controller.BaseController;
import com.autumn.framework.web.domain.AjaxResult;
import com.autumn.project.system.service.ISysConfigService;
import com.autumn.project.vaccines.domain.AgeVaccinesInfo;
import com.autumn.project.vaccines.domain.VaccinesInfo;
import com.autumn.project.vaccines.mapper.VaccinesInfoMapper;
import com.autumn.project.vaccines.service.IAgeVaccinesInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 注册验证
 *
 * @author ruoyi
 */
@RestController
public class SysRegisterController extends BaseController {

    public static final String MSG1 = "未匹配到数据，请联系工作人员";

    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private IAgeVaccinesInfoService ageVaccinesInfoService;

    @Autowired
    private VaccinesInfoMapper vaccinesInfoMapper;

    @Autowired
    private MailUtil mailUtil;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user) {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
            return error("当前系统没有开启注册功能！");
        }
        String msg = registerService.register(user);
        boolean empty = StringUtils.isEmpty(msg);
        if (empty) {
            //注册成功，发送流程
            //查询流程
            AgeVaccinesInfo ageVaccinesInfo1 = new AgeVaccinesInfo();
            ageVaccinesInfo1.setState("0");
            List<AgeVaccinesInfo> ageVaccinesInfos = ageVaccinesInfoService.selectAgeVaccinesInfoList(ageVaccinesInfo1);
            String text = "";
            if (!CollectionUtils.isEmpty(ageVaccinesInfos)) {
                for (AgeVaccinesInfo ageVaccinesInfo : ageVaccinesInfos) {
                    Map map1 = new HashMap();
                    map1.put("vaccinesCodes", JSON.parseObject(ageVaccinesInfo.getVaccinesCodes(), String[].class));
                    List<VaccinesInfo> vaccinesInfoList = vaccinesInfoMapper.getIntervalDataByMap(map1);
                    String msg1 = MSG1;
                    if (!CollectionUtils.isEmpty(vaccinesInfoList)) {
                        for (VaccinesInfo vaccinesInfo : vaccinesInfoList) {
                            if (msg1.equals(MSG1)) {

                                msg1 = vaccinesInfo.getVaccinesName() + "-" + vaccinesInfo.getVaccinationMethodName();
                            } else {
                                msg1 = msg1 + " 或 " + vaccinesInfo.getVaccinesName() + "-" + vaccinesInfo.getVaccinationMethodName();
                            }
                        }
                    }
                    text = text +
                            "<div>\n" +
                            ageVaccinesInfo.getAge() + "(" + ageVaccinesInfo.getAgeMin() + "天 - " + ageVaccinesInfo.getAgeMax() + "天)" + " 所要打的疫苗：(" + msg1 + ")" + "\n" +
                            "</div>\n" +
                            "<br/>\n";
                }
            }

            String finalText = text;
            new Thread(() -> {
                MailBean mailBean = new MailBean();
                mailBean.setRecipient(user.getEmail());
                mailBean.setSubject("疫苗流程提醒");

                String htmlMsg = "<h3>\n" +
                        "尊贵的 " + user.getUsername() + " 您好，恭喜你注册成功！\n" +
                        "</h3>\n" +
                        "<h4>\n" +
                        "以下是疫苗各年龄段要打的疫苗数据：\n" +
                        "</h4>\n" +
                        finalText;

                mailBean.setContent(htmlMsg);
                mailUtil.sendSimpleMail(mailBean, true);
            }).start();
        }
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
