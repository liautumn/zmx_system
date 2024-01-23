package com.autumn.project.vaccines.service;

import java.util.List;
import com.autumn.project.vaccines.domain.UserFillInfo;

/**
 * 用户填报信息Service接口
 * 
 * @author autumn
 * @date 2024-01-23
 */
public interface IUserFillInfoService 
{
    /**
     * 查询用户填报信息
     * 
     * @param id 用户填报信息主键
     * @return 用户填报信息
     */
    public UserFillInfo selectUserFillInfoById(Long id);

    /**
     * 查询用户填报信息列表
     * 
     * @param userFillInfo 用户填报信息
     * @return 用户填报信息集合
     */
    public List<UserFillInfo> selectUserFillInfoList(UserFillInfo userFillInfo);

    /**
     * 新增用户填报信息
     * 
     * @param userFillInfo 用户填报信息
     * @return 结果
     */
    public int insertUserFillInfo(UserFillInfo userFillInfo);

    /**
     * 修改用户填报信息
     * 
     * @param userFillInfo 用户填报信息
     * @return 结果
     */
    public int updateUserFillInfo(UserFillInfo userFillInfo);

    /**
     * 批量删除用户填报信息
     * 
     * @param ids 需要删除的用户填报信息主键集合
     * @return 结果
     */
    public int deleteUserFillInfoByIds(Long[] ids);

    /**
     * 删除用户填报信息信息
     * 
     * @param id 用户填报信息主键
     * @return 结果
     */
    public int deleteUserFillInfoById(Long id);
}
