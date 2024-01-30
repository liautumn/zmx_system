package com.autumn.project.vaccines.service.impl;

import com.alibaba.fastjson2.JSON;
import com.autumn.common.mail.MailBean;
import com.autumn.common.mail.MailUtil;
import com.autumn.common.utils.DateUtils;
import com.autumn.common.utils.SecurityUtils;
import com.autumn.project.common.StaticState;
import com.autumn.project.system.domain.SysUser;
import com.autumn.project.vaccines.domain.AgeVaccinesInfo;
import com.autumn.project.vaccines.domain.UserFillInfo;
import com.autumn.project.vaccines.domain.VaccinesInfo;
import com.autumn.project.vaccines.mapper.AgeVaccinesInfoMapper;
import com.autumn.project.vaccines.mapper.UserFillInfoMapper;
import com.autumn.project.vaccines.mapper.VaccinesInfoMapper;
import com.autumn.project.vaccines.service.IUserFillInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户填报信息Service业务层处理
 *
 * @author autumn
 * @date 2024-01-23
 */
@Service
public class UserFillInfoServiceImpl implements IUserFillInfoService {
    public static final String MSG1 = "未匹配到数据，请工作人员选择";
    public static final String MSG2 = "孩子存在过敏，请工作人员选择";

    @Autowired
    private UserFillInfoMapper userFillInfoMapper;
    @Autowired
    private VaccinesInfoMapper vaccinesInfoMapper;
    @Autowired
    private MailUtil mailUtil;
    @Autowired
    private AgeVaccinesInfoMapper ageVaccinesInfoMapper;

    /**
     * 查询用户填报信息
     *
     * @param id 用户填报信息主键
     * @return 用户填报信息
     */
    @Override
    public UserFillInfo selectUserFillInfoById(Long id) {
        return userFillInfoMapper.selectUserFillInfoById(id);
    }

    /**
     * 查询用户填报信息列表
     *
     * @param userFillInfo 用户填报信息
     * @return 用户填报信息
     */
    @Override
    public List<UserFillInfo> selectUserFillInfoList(UserFillInfo userFillInfo) {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        if (!user.isAdmin()) {
            userFillInfo.setUserId(user.getUserId());
        }
        userFillInfo.setExt5("0");
        return userFillInfoMapper.selectUserFillInfoList(userFillInfo);
    }

    /**
     * 新增用户填报信息
     *
     * @param userFillInfo 用户填报信息
     * @return 结果
     */
    @Override
    public int insertUserFillInfo(UserFillInfo userFillInfo) {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        userFillInfo.setUserId(user.getUserId());
        userFillInfo.setCreateBy(user.getUserName());
        userFillInfo.setCreateTime(DateUtils.getNowDate());
        if (userFillInfo.getRoleFlag().equals(StaticState.ONE)) {
            userFillInfo.setState(StaticState.ONE);
        }
        if (userFillInfo.getRoleFlag().equals(StaticState.TWO)) {
            userFillInfo.setState(StaticState.TWO);
            userFillInfo = getymData(userFillInfo);
        }
        userFillInfo.setExt5("0");
        userFillInfo.setExt3(null);
        return userFillInfoMapper.insertUserFillInfo(userFillInfo);
    }

    /**
     * 修改用户填报信息
     *
     * @param userFillInfo 用户填报信息
     * @return 结果
     */
    @Override
    public int updateUserFillInfo(UserFillInfo userFillInfo) {

        if (StringUtils.isNotBlank(userFillInfo.getRoleFlag())) {
            if (userFillInfo.getRoleFlag().equals(StaticState.ONE)) {
                userFillInfo.setState(StaticState.ONE);
            }
            if (userFillInfo.getRoleFlag().equals(StaticState.TWO)) {
                userFillInfo.setState(StaticState.TWO);
                userFillInfo = getymData(userFillInfo);
            }
        }

        String ext2 = userFillInfo.getExt2();
        boolean notBlank = StringUtils.isNotBlank(ext2);
        if (notBlank) {
            if (ext2.equals("1")) {
                //需要人工添加数据
                if (StringUtils.isNotBlank(userFillInfo.getExt3())) {
                    Map map = new HashMap();
                    map.put("vaccinesCodes", JSON.parse(userFillInfo.getExt3()));
                    List<VaccinesInfo> vaccinesInfoList = vaccinesInfoMapper.getIntervalDataByMap(map);
                    String msg = "";
                    for (VaccinesInfo vaccinesInfo : vaccinesInfoList) {
                        if (msg.equals("")) {
                            msg = vaccinesInfo.getVaccinesName() + "-" + vaccinesInfo.getVaccinationMethodName();
                        } else {
                            msg = msg + " 或 " + vaccinesInfo.getVaccinesName() + "-" + vaccinesInfo.getVaccinationMethodName();
                        }
                    }
                    userFillInfo.setExt1(msg);
                    if (!msg.equals("")) {
                        userFillInfo.setState(StaticState.THREE);
                    }
                    //标记位不需要人工选择
                    userFillInfo.setExt2("0");
                }
            }
        }

        if (StringUtils.isNotBlank(userFillInfo.getRoleFlag())) {
            if (userFillInfo.getRoleFlag().equals(StaticState.FOUR)) {
                userFillInfo.setState(StaticState.FOUR);
            }
            if (userFillInfo.getRoleFlag().equals(StaticState.FIVE)) {
                userFillInfo.setState(StaticState.FIVE);
            }
        }
        int i = userFillInfoMapper.updateUserFillInfo(userFillInfo);

        if (i > 0) {
            if (userFillInfo.getState().equals(StaticState.FOUR)) {

                UserFillInfo finalUserFillInfo = userFillInfo;
                new Thread(() -> {
                    //发送邮件
                    MailBean mailBean = new MailBean();
                    mailBean.setRecipient(finalUserFillInfo.getExt4());
                    mailBean.setSubject("疫苗接种申请通过提醒");
                    mailBean.setContent("尊贵的 " + finalUserFillInfo.getUserName() + " 您好，您申请的 " + finalUserFillInfo.getChildrenName() + " 疫苗接种申请通过了请到平台查收！");
                    mailUtil.sendSimpleMail(mailBean);
                }).start();
            }
        }

        return i;
    }

    public UserFillInfo getymData(UserFillInfo userFillInfo) {
        //系统根据数据选择
        String childrenAllergy = userFillInfo.getChildrenAllergy();
        boolean notBlank = StringUtils.isBlank(childrenAllergy);
        if (notBlank) {
            //计算年龄天数
            Date today = userFillInfo.getToday();
            Date childrenBirthday = userFillInfo.getChildrenBirthday();
            int days = DateUtils.differentDaysByMillisecond(childrenBirthday, today);
            if (days == 0) {
                days = 1;
            }

            Map map = new HashMap();
            map.put("age", days);
            List<AgeVaccinesInfo> ageVaccinesInfos = ageVaccinesInfoMapper.getAgeIntervalData(map);
            if (!CollectionUtils.isEmpty(ageVaccinesInfos)) {

                String msg = MSG1;
                String flag = "0";
                AgeVaccinesInfo ageVaccinesInfo = ageVaccinesInfos.get(0);
                String vaccinesCodes = ageVaccinesInfo.getVaccinesCodes();
                String[] vaccinesCodeList = JSON.parseObject(vaccinesCodes, String[].class);
                Map map1 = new HashMap();
                map1.put("vaccinesCodes", vaccinesCodeList);
                List<VaccinesInfo> vaccinesInfoList = vaccinesInfoMapper.getIntervalDataByMap(map1);
                if (!CollectionUtils.isEmpty(vaccinesInfoList)) {
                    for (VaccinesInfo vaccinesInfo : vaccinesInfoList) {
                        if (msg.equals(MSG1)) {
                            msg = vaccinesInfo.getVaccinesName() + "-" + vaccinesInfo.getVaccinationMethodName();
                        } else {
                            msg = msg + " 或 " + vaccinesInfo.getVaccinesName() + "-" + vaccinesInfo.getVaccinationMethodName();
                        }
                    }
                } else {
                    flag = "1";
                }
                userFillInfo.setExt1(msg);
                if (!msg.equals(MSG1)) {
                    userFillInfo.setState(StaticState.THREE);
                }
                //标记位是否需要人工选择
                userFillInfo.setExt2(flag);
            } else {
                userFillInfo.setExt1(MSG1);
                //标记位需要人工选择
                userFillInfo.setExt2("1");
            }
        } else {
            userFillInfo.setExt1(MSG2);
            //标记位需要人工选择
            userFillInfo.setExt2("1");
        }
        return userFillInfo;
    }

    /**
     * 批量删除用户填报信息
     *
     * @param ids 需要删除的用户填报信息主键
     * @return 结果
     */
    @Override
    public int deleteUserFillInfoByIds(Long[] ids) {
        return userFillInfoMapper.deleteUserFillInfoByIds(ids);
    }

    /**
     * 删除用户填报信息信息
     *
     * @param id 用户填报信息主键
     * @return 结果
     */
    @Override
    public int deleteUserFillInfoById(Long id) {
        return userFillInfoMapper.deleteUserFillInfoById(id);
    }
}
