package com.autumn.project.vaccines.controller;

import com.autumn.common.utils.poi.ExcelUtil;
import com.autumn.framework.aspectj.lang.annotation.Log;
import com.autumn.framework.aspectj.lang.enums.BusinessType;
import com.autumn.framework.web.controller.BaseController;
import com.autumn.framework.web.domain.AjaxResult;
import com.autumn.framework.web.page.TableDataInfo;
import com.autumn.project.vaccines.domain.VaccinationMethodInfo;
import com.autumn.project.vaccines.service.IVaccinationMethodInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 接种方法信息Controller
 *
 * @author autumn
 * @date 2024-01-23
 */
@RestController
@RequestMapping("/vaccines/vaccinationMethodInfo")
public class VaccinationMethodInfoController extends BaseController {
    @Autowired
    private IVaccinationMethodInfoService vaccinationMethodInfoService;

    /**
     * 查询接种方法信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinationMethodInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(VaccinationMethodInfo vaccinationMethodInfo) {
        startPage();
        List<VaccinationMethodInfo> list = vaccinationMethodInfoService.selectVaccinationMethodInfoList(vaccinationMethodInfo);
        return getDataTable(list);
    }

    /**
     * 导出接种方法信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinationMethodInfo:export')")
    @Log(title = "接种方法信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VaccinationMethodInfo vaccinationMethodInfo) {
        List<VaccinationMethodInfo> list = vaccinationMethodInfoService.selectVaccinationMethodInfoList(vaccinationMethodInfo);
        ExcelUtil<VaccinationMethodInfo> util = new ExcelUtil<VaccinationMethodInfo>(VaccinationMethodInfo.class);
        util.exportExcel(response, list, "接种方法信息数据");
    }

    /**
     * 获取接种方法信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinationMethodInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(vaccinationMethodInfoService.selectVaccinationMethodInfoById(id));
    }

    /**
     * 新增接种方法信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinationMethodInfo:add')")
    @Log(title = "接种方法信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VaccinationMethodInfo vaccinationMethodInfo) {
        return toAjax(vaccinationMethodInfoService.insertVaccinationMethodInfo(vaccinationMethodInfo));
    }

    /**
     * 修改接种方法信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinationMethodInfo:edit')")
    @Log(title = "接种方法信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VaccinationMethodInfo vaccinationMethodInfo) {
        return toAjax(vaccinationMethodInfoService.updateVaccinationMethodInfo(vaccinationMethodInfo));
    }

    /**
     * 删除接种方法信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:vaccinationMethodInfo:remove')")
    @Log(title = "接种方法信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(vaccinationMethodInfoService.deleteVaccinationMethodInfoByIds(ids));
    }
}
