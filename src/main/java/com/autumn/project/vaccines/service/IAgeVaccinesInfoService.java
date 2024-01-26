package com.autumn.project.vaccines.service;

import com.autumn.project.vaccines.domain.AgeVaccinesInfo;

import java.util.List;

/**
 * 各年龄段需打疫苗信息Service接口
 *
 * @author autumn
 * @date 2024-01-26
 */
public interface IAgeVaccinesInfoService {
    /**
     * 查询各年龄段需打疫苗信息
     *
     * @param id 各年龄段需打疫苗信息主键
     * @return 各年龄段需打疫苗信息
     */
    public AgeVaccinesInfo selectAgeVaccinesInfoById(Long id);

    /**
     * 查询各年龄段需打疫苗信息列表
     *
     * @param ageVaccinesInfo 各年龄段需打疫苗信息
     * @return 各年龄段需打疫苗信息集合
     */
    public List<AgeVaccinesInfo> selectAgeVaccinesInfoList(AgeVaccinesInfo ageVaccinesInfo);

    /**
     * 新增各年龄段需打疫苗信息
     *
     * @param ageVaccinesInfo 各年龄段需打疫苗信息
     * @return 结果
     */
    public int insertAgeVaccinesInfo(AgeVaccinesInfo ageVaccinesInfo);

    /**
     * 修改各年龄段需打疫苗信息
     *
     * @param ageVaccinesInfo 各年龄段需打疫苗信息
     * @return 结果
     */
    public int updateAgeVaccinesInfo(AgeVaccinesInfo ageVaccinesInfo);

    /**
     * 批量删除各年龄段需打疫苗信息
     *
     * @param ids 需要删除的各年龄段需打疫苗信息主键集合
     * @return 结果
     */
    public int deleteAgeVaccinesInfoByIds(Long[] ids);

    /**
     * 删除各年龄段需打疫苗信息信息
     *
     * @param id 各年龄段需打疫苗信息主键
     * @return 结果
     */
    public int deleteAgeVaccinesInfoById(Long id);
}
