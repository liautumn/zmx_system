package com.autumn.project.vaccines.mapper;

import com.autumn.project.vaccines.domain.VaccinesInfo;

import java.util.List;
import java.util.Map;

/**
 * 疫苗信息Mapper接口
 *
 * @author autumn
 * @date 2024-01-23
 */
public interface VaccinesInfoMapper {
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
     * 删除疫苗信息
     *
     * @param id 疫苗信息主键
     * @return 结果
     */
    public int deleteVaccinesInfoById(Long id);

    /**
     * 批量删除疫苗信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVaccinesInfoByIds(Long[] ids);

    List<VaccinesInfo> getAgeIntervalData(Map map);

    List<VaccinesInfo> getIntervalDataByMap(Map map);
}
