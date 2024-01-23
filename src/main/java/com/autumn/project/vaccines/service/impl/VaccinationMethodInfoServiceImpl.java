package com.autumn.project.vaccines.service.impl;

import com.autumn.common.utils.DateUtils;
import com.autumn.common.utils.SecurityUtils;
import com.autumn.project.vaccines.domain.VaccinationMethodInfo;
import com.autumn.project.vaccines.mapper.VaccinationMethodInfoMapper;
import com.autumn.project.vaccines.service.IVaccinationMethodInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 接种方法信息Service业务层处理
 *
 * @author autumn
 * @date 2024-01-23
 */
@Service
public class VaccinationMethodInfoServiceImpl implements IVaccinationMethodInfoService {
    @Autowired
    private VaccinationMethodInfoMapper vaccinationMethodInfoMapper;

    /**
     * 查询接种方法信息
     *
     * @param id 接种方法信息主键
     * @return 接种方法信息
     */
    @Override
    public VaccinationMethodInfo selectVaccinationMethodInfoById(Long id) {
        return vaccinationMethodInfoMapper.selectVaccinationMethodInfoById(id);
    }

    /**
     * 查询接种方法信息列表
     *
     * @param vaccinationMethodInfo 接种方法信息
     * @return 接种方法信息
     */
    @Override
    public List<VaccinationMethodInfo> selectVaccinationMethodInfoList(VaccinationMethodInfo vaccinationMethodInfo) {
        return vaccinationMethodInfoMapper.selectVaccinationMethodInfoList(vaccinationMethodInfo);
    }

    /**
     * 新增接种方法信息
     *
     * @param vaccinationMethodInfo 接种方法信息
     * @return 结果
     */
    @Override
    public int insertVaccinationMethodInfo(VaccinationMethodInfo vaccinationMethodInfo) {
        String username = SecurityUtils.getLoginUser().getUsername();
        vaccinationMethodInfo.setCreateBy(username);
        vaccinationMethodInfo.setCreateTime(DateUtils.getNowDate());
        return vaccinationMethodInfoMapper.insertVaccinationMethodInfo(vaccinationMethodInfo);
    }

    /**
     * 修改接种方法信息
     *
     * @param vaccinationMethodInfo 接种方法信息
     * @return 结果
     */
    @Override
    public int updateVaccinationMethodInfo(VaccinationMethodInfo vaccinationMethodInfo) {
        String username = SecurityUtils.getLoginUser().getUsername();
        vaccinationMethodInfo.setUpdateBy(username);
        vaccinationMethodInfo.setUpdateTime(DateUtils.getNowDate());
        return vaccinationMethodInfoMapper.updateVaccinationMethodInfo(vaccinationMethodInfo);
    }

    /**
     * 批量删除接种方法信息
     *
     * @param ids 需要删除的接种方法信息主键
     * @return 结果
     */
    @Override
    public int deleteVaccinationMethodInfoByIds(Long[] ids) {
        return vaccinationMethodInfoMapper.deleteVaccinationMethodInfoByIds(ids);
    }

    /**
     * 删除接种方法信息信息
     *
     * @param id 接种方法信息主键
     * @return 结果
     */
    @Override
    public int deleteVaccinationMethodInfoById(Long id) {
        return vaccinationMethodInfoMapper.deleteVaccinationMethodInfoById(id);
    }
}
