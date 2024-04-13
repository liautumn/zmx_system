package com.autumn.project.vaccines.service;

import java.util.List;
import com.autumn.project.vaccines.domain.NurseInfo;

/**
 * 护士信息Service接口
 * 
 * @author autumn
 * @date 2024-04-13
 */
public interface INurseInfoService 
{
    /**
     * 查询护士信息
     * 
     * @param id 护士信息主键
     * @return 护士信息
     */
    public NurseInfo selectNurseInfoById(Long id);

    /**
     * 查询护士信息列表
     * 
     * @param nurseInfo 护士信息
     * @return 护士信息集合
     */
    public List<NurseInfo> selectNurseInfoList(NurseInfo nurseInfo);

    /**
     * 新增护士信息
     * 
     * @param nurseInfo 护士信息
     * @return 结果
     */
    public int insertNurseInfo(NurseInfo nurseInfo);

    /**
     * 修改护士信息
     * 
     * @param nurseInfo 护士信息
     * @return 结果
     */
    public int updateNurseInfo(NurseInfo nurseInfo);

    /**
     * 批量删除护士信息
     * 
     * @param ids 需要删除的护士信息主键集合
     * @return 结果
     */
    public int deleteNurseInfoByIds(Long[] ids);

    /**
     * 删除护士信息信息
     * 
     * @param id 护士信息主键
     * @return 结果
     */
    public int deleteNurseInfoById(Long id);
}
