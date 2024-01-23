package com.autumn.project.vaccines.controller;

import com.autumn.common.utils.poi.ExcelUtil;
import com.autumn.framework.aspectj.lang.annotation.Log;
import com.autumn.framework.aspectj.lang.enums.BusinessType;
import com.autumn.framework.web.controller.BaseController;
import com.autumn.framework.web.domain.AjaxResult;
import com.autumn.framework.web.page.TableDataInfo;
import com.autumn.project.vaccines.domain.UserFillInfo;
import com.autumn.project.vaccines.service.IUserFillInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 用户填报信息Controller
 *
 * @author autumn
 * @date 2024-01-23
 */
@RestController
@RequestMapping("/vaccines/userFillInfo")
public class UserFillInfoController extends BaseController {
    @Autowired
    private IUserFillInfoService userFillInfoService;

    /**
     * 查询用户填报信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:userFillInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserFillInfo userFillInfo) {
        startPage();
        List<UserFillInfo> list = userFillInfoService.selectUserFillInfoList(userFillInfo);
        return getDataTable(list);
    }

    /**
     * 导出用户填报信息列表
     */
    @PreAuthorize("@ss.hasPermi('vaccines:userFillInfo:export')")
    @Log(title = "用户填报信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserFillInfo userFillInfo) {
        List<UserFillInfo> list = userFillInfoService.selectUserFillInfoList(userFillInfo);
        ExcelUtil<UserFillInfo> util = new ExcelUtil<UserFillInfo>(UserFillInfo.class);
        util.exportExcel(response, list, "用户填报信息数据");
    }

    /**
     * 获取用户填报信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:userFillInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(userFillInfoService.selectUserFillInfoById(id));
    }

    /**
     * 新增用户填报信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:userFillInfo:add')")
    @Log(title = "用户填报信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserFillInfo userFillInfo) {
        return toAjax(userFillInfoService.insertUserFillInfo(userFillInfo));
    }

    /**
     * 修改用户填报信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:userFillInfo:edit')")
    @Log(title = "用户填报信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserFillInfo userFillInfo) {
        return toAjax(userFillInfoService.updateUserFillInfo(userFillInfo));
    }

    /**
     * 删除用户填报信息
     */
    @PreAuthorize("@ss.hasPermi('vaccines:userFillInfo:remove')")
    @Log(title = "用户填报信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(userFillInfoService.deleteUserFillInfoByIds(ids));
    }
}
