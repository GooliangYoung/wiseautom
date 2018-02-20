package com.wiseautom.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.wiseautom.enumresource.StateEnum;
import com.wiseautom.annotation.SysLog;
import com.wiseautom.util.UUIDUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.wiseautom.entity.ProjectManage;
import com.wiseautom.service.ProjectManageService;
import com.wiseautom.utils.PageUtils;
import com.wiseautom.utils.Query;
import com.wiseautom.utils.R;


/**
 * 项目管理表
 *
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
@Controller
@RequestMapping("projectmanage")
public class ProjectManageController {
    @Autowired
    private ProjectManageService projectManageService;

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("projectmanage:list")
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<ProjectManage> projectManageList = projectManageService.getList(query);
        int total = projectManageService.getCount(query);

        PageUtils pageUtil = new PageUtils(projectManageList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 跳转到新增页面
     **/
    @RequestMapping("/add")
    @RequiresPermissions("projectmanage:save")
    public String add() {
        return "projectmanage/add.jsp";
    }

    /**
     * 跳转到修改页面
     **/
    @RequestMapping("/edit/{id}")
    @RequiresPermissions("projectmanage:update")
    public String edit(Model model, @PathVariable("id") String id) {
        ProjectManage projectManage = projectManageService.get(id);
        model.addAttribute("model", projectManage);
        return "projectmanage/edit.jsp";
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{objId}")
    @RequiresPermissions("projectmanage:info")
    public String info(Model model, @PathVariable("objId") String objId) {
        ProjectManage projectManage = projectManageService.get(objId);
        model.addAttribute("model", projectManage);
        return "projectmanage/info.jsp";
    }

    /**
     * 保存
     */
    @ResponseBody
    @SysLog("保存项目管理表")
    @RequestMapping("/save")
    @RequiresPermissions("projectmanage:save")
    public R save(@RequestBody ProjectManage projectManage) {
        int count = projectManageService.queryByProjectCode(projectManage.getProjectCode());
        if (count > 0) {
            return R.error("项目编号已存在");
        }
        projectManage.setObjId(UUIDUtils.uuid36());
        projectManage.setCreateTime(new Date());
        projectManageService.save(projectManage);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @SysLog("修改项目管理表")
    @RequestMapping("/update")
    @RequiresPermissions("projectmanage:update")
    public R update(@RequestBody ProjectManage projectManage) {
        projectManageService.update(projectManage);

        return R.ok();
    }

    /**
     * 启用
     */
    @ResponseBody
    @SysLog("启用项目管理表")
    @RequestMapping("/enable")
    @RequiresPermissions("projectmanage:update")
    public R enable(@RequestBody String[] ids) {
        String stateValue = StateEnum.ENABLE.getCode();
        projectManageService.updateState(ids, stateValue);
        return R.ok();
    }

    /**
     * 禁用
     */
    @ResponseBody
    @SysLog("禁用项目管理表")
    @RequestMapping("/limit")
    @RequiresPermissions("projectmanage:update")
    public R limit(@RequestBody String[] ids) {
        String stateValue = StateEnum.LIMIT.getCode();
        projectManageService.updateState(ids, stateValue);
        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @SysLog("删除项目管理表")
    @RequestMapping("/delete")
    @RequiresPermissions("projectmanage:delete")
    public R delete(@RequestBody String[] objIds) {
        projectManageService.deleteBatch(objIds);

        return R.ok();
    }

}
