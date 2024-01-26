package com.autumn.project.vaccines.controller;

import com.autumn.common.utils.SecurityUtils;
import com.autumn.common.utils.poi.ExcelUtil;
import com.autumn.framework.aspectj.lang.annotation.Log;
import com.autumn.framework.aspectj.lang.enums.BusinessType;
import com.autumn.framework.web.controller.BaseController;
import com.autumn.framework.web.domain.AjaxResult;
import com.autumn.framework.web.page.TableDataInfo;
import com.autumn.project.common.StaticState;
import com.autumn.project.system.domain.SysUser;
import com.autumn.project.vaccines.domain.UserFillInfo;
import com.autumn.project.vaccines.service.IUserFillInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        SysUser user = SecurityUtils.getLoginUser().getUser();
        Map map = new HashMap();
        if (user.isAdmin()) {
            //查询未读，已评价数量；
            UserFillInfo userFillInfo1 = new UserFillInfo();
            userFillInfo1.setState(StaticState.FIVE);
            userFillInfo1.setFlag1("1");
            List<UserFillInfo> userFillInfos = userFillInfoService.selectUserFillInfoList(userFillInfo1);
            map.put("adminYPJ", userFillInfos.size());
            UserFillInfo userFillInfo2 = new UserFillInfo();
            userFillInfo2.setStateIn(new String[]{"2", "3"});
            List<UserFillInfo> fillInfos = userFillInfoService.selectUserFillInfoList(userFillInfo2);
            map.put("adminWD", fillInfos.size());
        } else {
            //查询未读，待评价数量；
            UserFillInfo userFillInfo1 = new UserFillInfo();
            userFillInfo1.setState(StaticState.FIVE);
            userFillInfo1.setFlag2("1");
            List<UserFillInfo> userFillInfos = userFillInfoService.selectUserFillInfoList(userFillInfo1);
            map.put("DPJ", userFillInfos.size());
            UserFillInfo userFillInfo2 = new UserFillInfo();
            userFillInfo2.setState(StaticState.FOUR);
            List<UserFillInfo> userFillInfos2 = userFillInfoService.selectUserFillInfoList(userFillInfo2);
            map.put("WD", userFillInfos2.size());
        }
        return getDataTable2(list, map);
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
    @Transactional
    @PreAuthorize("@ss.hasPermi('vaccines:userFillInfo:add')")
    @Log(title = "用户填报信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserFillInfo userFillInfo) {
        return toAjax(userFillInfoService.insertUserFillInfo(userFillInfo));
    }

    /**
     * 修改用户填报信息
     */
    @Transactional
    @PreAuthorize("@ss.hasPermi('vaccines:userFillInfo:edit')")
    @Log(title = "用户填报信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserFillInfo userFillInfo) {
        return toAjax(userFillInfoService.updateUserFillInfo(userFillInfo));
    }

    /**
     * 删除用户填报信息
     */
    @Transactional
    @PreAuthorize("@ss.hasPermi('vaccines:userFillInfo:remove')")
    @Log(title = "用户填报信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(userFillInfoService.deleteUserFillInfoByIds(ids));
    }
}
