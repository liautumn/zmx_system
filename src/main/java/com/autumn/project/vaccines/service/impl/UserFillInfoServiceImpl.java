package com.autumn.project.vaccines.service.impl;

import com.autumn.common.utils.DateUtils;
import com.autumn.common.utils.SecurityUtils;
import com.autumn.project.common.StaticState;
import com.autumn.project.system.domain.SysUser;
import com.autumn.project.vaccines.domain.UserFillInfo;
import com.autumn.project.vaccines.mapper.UserFillInfoMapper;
import com.autumn.project.vaccines.service.IUserFillInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户填报信息Service业务层处理
 *
 * @author autumn
 * @date 2024-01-23
 */
@Service
public class UserFillInfoServiceImpl implements IUserFillInfoService {
    @Autowired
    private UserFillInfoMapper userFillInfoMapper;

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
        }
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
            }
            if (userFillInfo.getRoleFlag().equals(StaticState.THREE)) {
                userFillInfo.setState(StaticState.THREE);
            }
            if (userFillInfo.getRoleFlag().equals(StaticState.FOUR)) {
                userFillInfo.setState(StaticState.FOUR);
            }
            if (userFillInfo.getRoleFlag().equals(StaticState.FIVE)) {
                userFillInfo.setState(StaticState.FIVE);
            }
        }
        return userFillInfoMapper.updateUserFillInfo(userFillInfo);
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
