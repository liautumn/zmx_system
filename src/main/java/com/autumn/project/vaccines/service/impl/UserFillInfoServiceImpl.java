package com.autumn.project.vaccines.service.impl;

import java.util.List;
import com.autumn.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.autumn.project.vaccines.mapper.UserFillInfoMapper;
import com.autumn.project.vaccines.domain.UserFillInfo;
import com.autumn.project.vaccines.service.IUserFillInfoService;

/**
 * 用户填报信息Service业务层处理
 * 
 * @author autumn
 * @date 2024-01-23
 */
@Service
public class UserFillInfoServiceImpl implements IUserFillInfoService 
{
    @Autowired
    private UserFillInfoMapper userFillInfoMapper;

    /**
     * 查询用户填报信息
     * 
     * @param id 用户填报信息主键
     * @return 用户填报信息
     */
    @Override
    public UserFillInfo selectUserFillInfoById(Long id)
    {
        return userFillInfoMapper.selectUserFillInfoById(id);
    }

    /**
     * 查询用户填报信息列表
     * 
     * @param userFillInfo 用户填报信息
     * @return 用户填报信息
     */
    @Override
    public List<UserFillInfo> selectUserFillInfoList(UserFillInfo userFillInfo)
    {
        return userFillInfoMapper.selectUserFillInfoList(userFillInfo);
    }

    /**
     * 新增用户填报信息
     * 
     * @param userFillInfo 用户填报信息
     * @return 结果
     */
    @Override
    public int insertUserFillInfo(UserFillInfo userFillInfo)
    {
        userFillInfo.setCreateTime(DateUtils.getNowDate());
        return userFillInfoMapper.insertUserFillInfo(userFillInfo);
    }

    /**
     * 修改用户填报信息
     * 
     * @param userFillInfo 用户填报信息
     * @return 结果
     */
    @Override
    public int updateUserFillInfo(UserFillInfo userFillInfo)
    {
        return userFillInfoMapper.updateUserFillInfo(userFillInfo);
    }

    /**
     * 批量删除用户填报信息
     * 
     * @param ids 需要删除的用户填报信息主键
     * @return 结果
     */
    @Override
    public int deleteUserFillInfoByIds(Long[] ids)
    {
        return userFillInfoMapper.deleteUserFillInfoByIds(ids);
    }

    /**
     * 删除用户填报信息信息
     * 
     * @param id 用户填报信息主键
     * @return 结果
     */
    @Override
    public int deleteUserFillInfoById(Long id)
    {
        return userFillInfoMapper.deleteUserFillInfoById(id);
    }
}
