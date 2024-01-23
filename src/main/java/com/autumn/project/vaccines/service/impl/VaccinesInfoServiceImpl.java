package com.autumn.project.vaccines.service.impl;

import com.autumn.common.utils.DateUtils;
import com.autumn.common.utils.SecurityUtils;
import com.autumn.project.vaccines.domain.VaccinesInfo;
import com.autumn.project.vaccines.mapper.VaccinesInfoMapper;
import com.autumn.project.vaccines.service.IVaccinesInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 疫苗信息Service业务层处理
 *
 * @author autumn
 * @date 2024-01-23
 */
@Service
public class VaccinesInfoServiceImpl implements IVaccinesInfoService {
    @Autowired
    private VaccinesInfoMapper vaccinesInfoMapper;

    /**
     * 查询疫苗信息
     *
     * @param id 疫苗信息主键
     * @return 疫苗信息
     */
    @Override
    public VaccinesInfo selectVaccinesInfoById(Long id) {
        return vaccinesInfoMapper.selectVaccinesInfoById(id);
    }

    /**
     * 查询疫苗信息列表
     *
     * @param vaccinesInfo 疫苗信息
     * @return 疫苗信息
     */
    @Override
    public List<VaccinesInfo> selectVaccinesInfoList(VaccinesInfo vaccinesInfo) {
        return vaccinesInfoMapper.selectVaccinesInfoList(vaccinesInfo);
    }

    /**
     * 新增疫苗信息
     *
     * @param vaccinesInfo 疫苗信息
     * @return 结果
     */
    @Override
    public int insertVaccinesInfo(VaccinesInfo vaccinesInfo) {
        String username = SecurityUtils.getLoginUser().getUsername();
        vaccinesInfo.setCreateBy(username);
        vaccinesInfo.setCreateTime(DateUtils.getNowDate());
        return vaccinesInfoMapper.insertVaccinesInfo(vaccinesInfo);
    }

    /**
     * 修改疫苗信息
     *
     * @param vaccinesInfo 疫苗信息
     * @return 结果
     */
    @Override
    public int updateVaccinesInfo(VaccinesInfo vaccinesInfo) {
        String username = SecurityUtils.getLoginUser().getUsername();
        vaccinesInfo.setUpdateBy(username);
        vaccinesInfo.setUpdateTime(DateUtils.getNowDate());
        return vaccinesInfoMapper.updateVaccinesInfo(vaccinesInfo);
    }

    /**
     * 批量删除疫苗信息
     *
     * @param ids 需要删除的疫苗信息主键
     * @return 结果
     */
    @Override
    public int deleteVaccinesInfoByIds(Long[] ids) {
        return vaccinesInfoMapper.deleteVaccinesInfoByIds(ids);
    }

    /**
     * 删除疫苗信息信息
     *
     * @param id 疫苗信息主键
     * @return 结果
     */
    @Override
    public int deleteVaccinesInfoById(Long id) {
        return vaccinesInfoMapper.deleteVaccinesInfoById(id);
    }
}
