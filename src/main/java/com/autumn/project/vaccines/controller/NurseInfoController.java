package com.autumn.project.vaccines.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.autumn.framework.aspectj.lang.annotation.Log;
import com.autumn.framework.aspectj.lang.enums.BusinessType;
import com.autumn.project.vaccines.domain.NurseInfo;
import com.autumn.project.vaccines.service.INurseInfoService;
import com.autumn.framework.web.controller.BaseController;
import com.autumn.framework.web.domain.AjaxResult;
import com.autumn.common.utils.poi.ExcelUtil;
import com.autumn.framework.web.page.TableDataInfo;

/**
 * 护士信息Controller
 * 
 * @author autumn
 * @date 2024-04-13
 */
@RestController
@RequestMapping("/vaccines/nurseInfo")
public class NurseInfoController extends BaseController
{
    @Autowired
    private INurseInfoService nurseInfoService;

    /**
     * 查询护士信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:nurseInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(NurseInfo nurseInfo)
    {
        startPage();
        List<NurseInfo> list = nurseInfoService.selectNurseInfoList(nurseInfo);
        return getDataTable(list);
    }

    /**
     * 导出护士信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:nurseInfo:export')")
    @Log(title = "护士信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, NurseInfo nurseInfo)
    {
        List<NurseInfo> list = nurseInfoService.selectNurseInfoList(nurseInfo);
        ExcelUtil<NurseInfo> util = new ExcelUtil<NurseInfo>(NurseInfo.class);
        util.exportExcel(response, list, "护士信息数据");
    }

    /**
     * 获取护士信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:nurseInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(nurseInfoService.selectNurseInfoById(id));
    }

    /**
     * 新增护士信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:nurseInfo:add')")
    @Log(title = "护士信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody NurseInfo nurseInfo)
    {
        return toAjax(nurseInfoService.insertNurseInfo(nurseInfo));
    }

    /**
     * 修改护士信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:nurseInfo:edit')")
    @Log(title = "护士信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody NurseInfo nurseInfo)
    {
        return toAjax(nurseInfoService.updateNurseInfo(nurseInfo));
    }

    /**
     * 删除护士信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:nurseInfo:remove')")
    @Log(title = "护士信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(nurseInfoService.deleteNurseInfoByIds(ids));
    }
}
