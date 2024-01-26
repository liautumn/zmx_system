package com.autumn.project.vaccines.controller;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.autumn.common.utils.poi.ExcelUtil;
import com.autumn.framework.aspectj.lang.annotation.Log;
import com.autumn.framework.aspectj.lang.enums.BusinessType;
import com.autumn.framework.web.controller.BaseController;
import com.autumn.framework.web.domain.AjaxResult;
import com.autumn.framework.web.page.TableDataInfo;
import com.autumn.project.vaccines.domain.AgeVaccinesInfo;
import com.autumn.project.vaccines.service.IAgeVaccinesInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 各年龄段需打疫苗信息Controller
 *
 * @author autumn
 * @date 2024-01-26
 */
@RestController
@RequestMapping("/vaccines/ageVaccinesInfo")
public class AgeVaccinesInfoController extends BaseController {
    @Autowired
    private IAgeVaccinesInfoService ageVaccinesInfoService;

    /**
     * 查询各年龄段需打疫苗信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:ageVaccinesInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(AgeVaccinesInfo ageVaccinesInfo) {
        startPage();
        List<AgeVaccinesInfo> list = ageVaccinesInfoService.selectAgeVaccinesInfoList(ageVaccinesInfo);
        return getDataTable(list);
    }

    /**
     * 导出各年龄段需打疫苗信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:ageVaccinesInfo:export')")
    @Log(title = "各年龄段需打疫苗信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AgeVaccinesInfo ageVaccinesInfo) {
        List<AgeVaccinesInfo> list = ageVaccinesInfoService.selectAgeVaccinesInfoList(ageVaccinesInfo);
        ExcelUtil<AgeVaccinesInfo> util = new ExcelUtil<AgeVaccinesInfo>(AgeVaccinesInfo.class);
        util.exportExcel(response, list, "各年龄段需打疫苗信息数据");
    }

    /**
     * 获取各年龄段需打疫苗信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:ageVaccinesInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        AgeVaccinesInfo ageVaccinesInfo = ageVaccinesInfoService.selectAgeVaccinesInfoById(id);
        ageVaccinesInfo.setExt1(JSONObject.parseObject(ageVaccinesInfo.getVaccinesCodes(), String[].class));
        return success(ageVaccinesInfo);
    }

    /**
     * 新增各年龄段需打疫苗信息
     */
    @Transactional
    @PreAuthorize("@ss.hasPermi('vaccines:ageVaccinesInfo:add')")
    @Log(title = "各年龄段需打疫苗信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AgeVaccinesInfo ageVaccinesInfo) {
        ageVaccinesInfo.setVaccinesCodes(JSON.toJSONString(ageVaccinesInfo.getExt1()));
        int i = ageVaccinesInfoService.insertAgeVaccinesInfo(ageVaccinesInfo);
        return toAjax(i);
    }

    /**
     * 修改各年龄段需打疫苗信息
     */
    @Transactional
    @PreAuthorize("@ss.hasPermi('vaccines:ageVaccinesInfo:edit')")
    @Log(title = "各年龄段需打疫苗信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AgeVaccinesInfo ageVaccinesInfo) {
        ageVaccinesInfo.setVaccinesCodes(JSON.toJSONString(ageVaccinesInfo.getExt1()));
        return toAjax(ageVaccinesInfoService.updateAgeVaccinesInfo(ageVaccinesInfo));
    }

    /**
     * 删除各年龄段需打疫苗信息
     */
    @Transactional
    @PreAuthorize("@ss.hasPermi('vaccines:ageVaccinesInfo:remove')")
    @Log(title = "各年龄段需打疫苗信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(ageVaccinesInfoService.deleteAgeVaccinesInfoByIds(ids));
    }
}
