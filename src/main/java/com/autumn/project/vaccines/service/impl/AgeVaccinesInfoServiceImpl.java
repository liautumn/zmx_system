package com.autumn.project.vaccines.service.impl;

import com.autumn.common.utils.DateUtils;
import com.autumn.common.utils.SecurityUtils;
import com.autumn.project.system.domain.SysUser;
import com.autumn.project.vaccines.domain.AgeVaccinesInfo;
import com.autumn.project.vaccines.mapper.AgeVaccinesInfoMapper;
import com.autumn.project.vaccines.service.IAgeVaccinesInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 各年龄段需打疫苗信息Service业务层处理
 *
 * @author autumn
 * @date 2024-01-26
 */
@Service
public class AgeVaccinesInfoServiceImpl implements IAgeVaccinesInfoService {
    @Autowired
    private AgeVaccinesInfoMapper ageVaccinesInfoMapper;

    public static String calculateAge(Long days) {
        // 计算年龄
        double ageInYears = days / 365.0;  // 每年按365天计算
        // 根据年龄输出
        if (ageInYears < 1) {
            double ageInMonths = (days / 30.0);  // 每月按30天计算
            return String.format("%.1f月", ageInMonths);
        } else {
            return String.format("%.1f岁", ageInYears);
        }
    }

    public static void main(String[] args) {
        System.out.println("calculateAge(50L) = " + calculateAge(50L));
    }

    /**
     * 查询各年龄段需打疫苗信息
     *
     * @param id 各年龄段需打疫苗信息主键
     * @return 各年龄段需打疫苗信息
     */
    @Override
    public AgeVaccinesInfo selectAgeVaccinesInfoById(Long id) {
        return ageVaccinesInfoMapper.selectAgeVaccinesInfoById(id);
    }

    /**
     * 查询各年龄段需打疫苗信息列表
     *
     * @param ageVaccinesInfo 各年龄段需打疫苗信息
     * @return 各年龄段需打疫苗信息
     */
    @Override
    public List<AgeVaccinesInfo> selectAgeVaccinesInfoList(AgeVaccinesInfo ageVaccinesInfo) {
        return ageVaccinesInfoMapper.selectAgeVaccinesInfoList(ageVaccinesInfo);
    }

    /**
     * 新增各年龄段需打疫苗信息
     *
     * @param ageVaccinesInfo 各年龄段需打疫苗信息
     * @return 结果
     */
    @Override
    public int insertAgeVaccinesInfo(AgeVaccinesInfo ageVaccinesInfo) {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        ageVaccinesInfo.setCreateBy(user.getCreateBy());
        ageVaccinesInfo.setCreateTime(DateUtils.getNowDate());
        String min = calculateAge(ageVaccinesInfo.getAgeMin());
        String max = calculateAge(ageVaccinesInfo.getAgeMax());
        ageVaccinesInfo.setAge(min + " - " + max);
        return ageVaccinesInfoMapper.insertAgeVaccinesInfo(ageVaccinesInfo);
    }

    /**
     * 修改各年龄段需打疫苗信息
     *
     * @param ageVaccinesInfo 各年龄段需打疫苗信息
     * @return 结果
     */
    @Override
    public int updateAgeVaccinesInfo(AgeVaccinesInfo ageVaccinesInfo) {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        ageVaccinesInfo.setUpdateBy(user.getCreateBy());
        ageVaccinesInfo.setUpdateTime(DateUtils.getNowDate());
        String min = calculateAge(ageVaccinesInfo.getAgeMin());
        String max = calculateAge(ageVaccinesInfo.getAgeMax());
        ageVaccinesInfo.setAge(min + " - " + max);
        return ageVaccinesInfoMapper.updateAgeVaccinesInfo(ageVaccinesInfo);
    }

    /**
     * 批量删除各年龄段需打疫苗信息
     *
     * @param ids 需要删除的各年龄段需打疫苗信息主键
     * @return 结果
     */
    @Override
    public int deleteAgeVaccinesInfoByIds(Long[] ids) {
        return ageVaccinesInfoMapper.deleteAgeVaccinesInfoByIds(ids);
    }

    /**
     * 删除各年龄段需打疫苗信息信息
     *
     * @param id 各年龄段需打疫苗信息主键
     * @return 结果
     */
    @Override
    public int deleteAgeVaccinesInfoById(Long id) {
        return ageVaccinesInfoMapper.deleteAgeVaccinesInfoById(id);
    }
}
