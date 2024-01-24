package com.autumn.project.vaccines.controller;

import com.autumn.common.utils.poi.ExcelUtil;
import com.autumn.framework.aspectj.lang.annotation.Log;
import com.autumn.framework.aspectj.lang.enums.BusinessType;
import com.autumn.framework.web.controller.BaseController;
import com.autumn.framework.web.domain.AjaxResult;
import com.autumn.framework.web.page.TableDataInfo;
import com.autumn.project.vaccines.domain.VaccinationMethodInfo;
import com.autumn.project.vaccines.domain.VaccinesInfo;
import com.autumn.project.vaccines.service.IVaccinationMethodInfoService;
import com.autumn.project.vaccines.service.IVaccinesInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 疫苗信息Controller
 *
 * @author autumn
 * @date 2024-01-23
 */
@RestController
@RequestMapping("/vaccines/vaccinesInfo")
public class VaccinesInfoController extends BaseController {
    @Autowired
    private IVaccinesInfoService vaccinesInfoService;
    @Autowired
    private IVaccinationMethodInfoService vaccinationMethodInfoService;

    @GetMapping("/getVaccinationInfoByMapToLV")
    public AjaxResult getVaccinationInfoByMapToLV(VaccinesInfo vaccinesInfo) {
        vaccinesInfo.setState("0");
        List<VaccinesInfo> list = vaccinesInfoService.selectVaccinesInfoList(vaccinesInfo);
        List<Map> mapList = new ArrayList<>();
        for (VaccinesInfo info : list) {
            Map map = new HashMap();
            map.put("label", info.getVaccinesName());
            map.put("value", info.getVaccinesCode());
            mapList.add(map);
        }
        return AjaxResult.success(mapList);
    }

    /**
     * 查询疫苗信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinesInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(VaccinesInfo vaccinesInfo) {
        startPage();
        List<VaccinesInfo> list = vaccinesInfoService.selectVaccinesInfoList(vaccinesInfo);
        VaccinationMethodInfo vaccinationMethodInfo = new VaccinationMethodInfo();
        vaccinationMethodInfo.setState("0");
        List<VaccinationMethodInfo> vaccinationMethodInfos = vaccinationMethodInfoService.selectVaccinationMethodInfoList(vaccinationMethodInfo);
        if (!CollectionUtils.isEmpty(list)) {
            for (VaccinesInfo info : list) {
                for (VaccinationMethodInfo methodInfo : vaccinationMethodInfos) {
                    if (methodInfo.getVaccinationMethodCode().equals(info.getVaccinationMethodCode())) {
                        info.setVaccinationMethodCode(methodInfo.getVaccinationMethodName());
                        break;
                    }
                }
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出疫苗信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinesInfo:export')")
    @Log(title = "疫苗信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VaccinesInfo vaccinesInfo) {
        List<VaccinesInfo> list = vaccinesInfoService.selectVaccinesInfoList(vaccinesInfo);
        ExcelUtil<VaccinesInfo> util = new ExcelUtil<VaccinesInfo>(VaccinesInfo.class);
        util.exportExcel(response, list, "疫苗信息数据");
    }

    /**
     * 获取疫苗信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinesInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(vaccinesInfoService.selectVaccinesInfoById(id));
    }

    /**
     * 新增疫苗信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinesInfo:add')")
    @Log(title = "疫苗信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VaccinesInfo vaccinesInfo) {
        return toAjax(vaccinesInfoService.insertVaccinesInfo(vaccinesInfo));
    }

    /**
     * 修改疫苗信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinesInfo:edit')")
    @Log(title = "疫苗信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VaccinesInfo vaccinesInfo) {
        return toAjax(vaccinesInfoService.updateVaccinesInfo(vaccinesInfo));
    }

    /**
     * 删除疫苗信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinesInfo:remove')")
    @Log(title = "疫苗信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(vaccinesInfoService.deleteVaccinesInfoByIds(ids));
    }
}
