package com.autumn.project.vaccines.service.impl;

import java.util.List;
import java.util.UUID;

import com.autumn.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.autumn.project.vaccines.mapper.NurseInfoMapper;
import com.autumn.project.vaccines.domain.NurseInfo;
import com.autumn.project.vaccines.service.INurseInfoService;

/**
 * 护士信息Service业务层处理
 *
 * @author autumn
 * @date 2024-04-13
 */
@Service
public class NurseInfoServiceImpl implements INurseInfoService {
    @Autowired
    private NurseInfoMapper nurseInfoMapper;

    /**
     * 查询护士信息
     *
     * @param id 护士信息主键
     * @return 护士信息
     */
    @Override
    public NurseInfo selectNurseInfoById(Long id) {
        return nurseInfoMapper.selectNurseInfoById(id);
    }

    /**
     * 查询护士信息列表
     *
     * @param nurseInfo 护士信息
     * @return 护士信息
     */
    @Override
    public List<NurseInfo> selectNurseInfoList(NurseInfo nurseInfo) {
        return nurseInfoMapper.selectNurseInfoList(nurseInfo);
    }

    /**
     * 新增护士信息
     *
     * @param nurseInfo 护士信息
     * @return 结果
     */
    @Override
    public int insertNurseInfo(NurseInfo nurseInfo) {
        nurseInfo.setNurseCode(UUID.randomUUID().toString().replace("-", ""));
        nurseInfo.setCreateTime(DateUtils.getNowDate());
        return nurseInfoMapper.insertNurseInfo(nurseInfo);
    }

    /**
     * 修改护士信息
     *
     * @param nurseInfo 护士信息
     * @return 结果
     */
    @Override
    public int updateNurseInfo(NurseInfo nurseInfo) {
        nurseInfo.setUpdateTime(DateUtils.getNowDate());
        return nurseInfoMapper.updateNurseInfo(nurseInfo);
    }

    /**
     * 批量删除护士信息
     *
     * @param ids 需要删除的护士信息主键
     * @return 结果
     */
    @Override
    public int deleteNurseInfoByIds(Long[] ids) {
        return nurseInfoMapper.deleteNurseInfoByIds(ids);
    }

    /**
     * 删除护士信息信息
     *
     * @param id 护士信息主键
     * @return 结果
     */
    @Override
    public int deleteNurseInfoById(Long id) {
        return nurseInfoMapper.deleteNurseInfoById(id);
    }
}
