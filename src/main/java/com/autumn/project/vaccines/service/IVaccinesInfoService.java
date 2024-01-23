package com.autumn.project.vaccines.service;

import java.util.List;
import com.autumn.project.vaccines.domain.VaccinesInfo;

/**
 * 疫苗信息Service接口
 * 
 * @author autumn
 * @date 2024-01-23
 */
public interface IVaccinesInfoService 
{
    /**
     * 查询疫苗信息
     * 
     * @param id 疫苗信息主键
     * @return 疫苗信息
     */
    public VaccinesInfo selectVaccinesInfoById(Long id);

    /**
     * 查询疫苗信息列表
     * 
     * @param vaccinesInfo 疫苗信息
     * @return 疫苗信息集合
     */
    public List<VaccinesInfo> selectVaccinesInfoList(VaccinesInfo vaccinesInfo);

    /**
     * 新增疫苗信息
     * 
     * @param vaccinesInfo 疫苗信息
     * @return 结果
     */
    public int insertVaccinesInfo(VaccinesInfo vaccinesInfo);

    /**
     * 修改疫苗信息
     * 
     * @param vaccinesInfo 疫苗信息
     * @return 结果
     */
    public int updateVaccinesInfo(VaccinesInfo vaccinesInfo);

    /**
     * 批量删除疫苗信息
     * 
     * @param ids 需要删除的疫苗信息主键集合
     * @return 结果
     */
    public int deleteVaccinesInfoByIds(Long[] ids);

    /**
     * 删除疫苗信息信息
     * 
     * @param id 疫苗信息主键
     * @return 结果
     */
    public int deleteVaccinesInfoById(Long id);
}
