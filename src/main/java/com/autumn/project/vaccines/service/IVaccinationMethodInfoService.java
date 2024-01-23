package com.autumn.project.vaccines.service;

import com.autumn.project.vaccines.domain.VaccinationMethodInfo;

import java.util.List;

/**
 * 接种方法信息Service接口
 *
 * @author autumn
 * @date 2024-01-23
 */
public interface IVaccinationMethodInfoService {
    /**
     * 查询接种方法信息
     *
     * @param id 接种方法信息主键
     * @return 接种方法信息
     */
    public VaccinationMethodInfo selectVaccinationMethodInfoById(Long id);

    /**
     * 查询接种方法信息列表
     *
     * @param vaccinationMethodInfo 接种方法信息
     * @return 接种方法信息集合
     */
    public List<VaccinationMethodInfo> selectVaccinationMethodInfoList(VaccinationMethodInfo vaccinationMethodInfo);

    /**
     * 新增接种方法信息
     *
     * @param vaccinationMethodInfo 接种方法信息
     * @return 结果
     */
    public int insertVaccinationMethodInfo(VaccinationMethodInfo vaccinationMethodInfo);

    /**
     * 修改接种方法信息
     *
     * @param vaccinationMethodInfo 接种方法信息
     * @return 结果
     */
    public int updateVaccinationMethodInfo(VaccinationMethodInfo vaccinationMethodInfo);

    /**
     * 批量删除接种方法信息
     *
     * @param ids 需要删除的接种方法信息主键集合
     * @return 结果
     */
    public int deleteVaccinationMethodInfoByIds(Long[] ids);

    /**
     * 删除接种方法信息信息
     *
     * @param id 接种方法信息主键
     * @return 结果
     */
    public int deleteVaccinationMethodInfoById(Long id);
}
