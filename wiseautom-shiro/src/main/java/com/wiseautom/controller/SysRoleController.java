package com.wiseautom.controller;

import com.wiseautom.annotation.SysLog;
import com.wiseautom.entity.SysRole;
import com.wiseautom.service.SysRoleMenuService;
import com.wiseautom.service.SysRoleService;
import com.wiseautom.utils.*;
import com.wiseautom.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色管理
 *
 * @author GooliangYoung
 */
@Controller
@RequestMapping("/sys/role")
public class SysRoleController extends AbstractController {
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    /**
     * 角色列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("sys:role:list")
    public R list(@RequestParam Map<String, Object> params) {
        //如果不是超级管理员，则只查询自己创建的角色列表
        if (getUserId() != Constant.SUPER_ADMIN) {
            params.put("createUserId", getUserId());
        }

        //查询列表数据
        Query query = new Query(params);
        List<SysRole> list = sysRoleService.queryList(query);
        int total = sysRoleService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(list, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 跳转到添加页面
     **/
    @RequestMapping("/add")
    @RequiresPermissions("sys:role:list")
    public String add() {
        return "role/add.jsp";
    }

    /**
     * 跳转到修改页面
     **/
    @RequestMapping("/edit/{id}")
    @RequiresPermissions("sys:role:list")
    public String edit(Model model, @PathVariable("id") Long id) {
        SysRole role = sysRoleService.queryObject(id);
        model.addAttribute("model", role);
        return "/role/edit.jsp";
    }

    /**
     * 角色列表
     */
    @ResponseBody
    @RequestMapping("/findAll")
    @RequiresPermissions("sys:user:list")
    public R findAll() {
        Map<String, Object> map = new HashMap<>(1);
        //如果不是超级管理员，则只查询自己所拥有的角色列表
        if (getUserId() != Constant.SUPER_ADMIN) {
            map.put("createUserId", getUserId());
        }
        List<SysRole> list = sysRoleService.queryList(map);
        List<EnumBean> values = new ArrayList<>();
        for (SysRole role : list) {
            EnumBean enumBean = new EnumBean();
            enumBean.setCode(role.getRoleId() + "");
            enumBean.setValue(role.getRoleName());
            values.add(enumBean);
        }

        return R.ok().put("data", values);
    }

    /**
     * 角色列表
     */
    @ResponseBody
    @RequestMapping("/select")
    @RequiresPermissions("sys:role:select")
    public R select() {
        Map<String, Object> map = new HashMap<>(1);

        //如果不是超级管理员，则只查询自己所拥有的角色列表
        if (getUserId() != Constant.SUPER_ADMIN) {
            map.put("createUserId", getUserId());
        }
        List<SysRole> list = sysRoleService.queryList(map);

        return R.ok().put("list", list);
    }

    /**
     * 角色信息
     */
    @ResponseBody
    @RequestMapping("/info/{roleId}")
    @RequiresPermissions("sys:role:info")
    public R info(@PathVariable("roleId") Long roleId) {
        SysRole role = sysRoleService.queryObject(roleId);

        //查询角色对应的菜单
        List<Long> menuIdList = sysRoleMenuService.queryMenuIdList(roleId);
        role.setMenuIdList(menuIdList);

        return R.ok().put("role", role);
    }

    /**
     * 保存角色
     */
    @ResponseBody
    @SysLog("保存角色")
    @RequestMapping("/save")
    @RequiresPermissions("sys:role:save")
    public R save(@RequestBody SysRole role) {
        ValidatorUtils.validateEntity(role);
        //角色编码不能重复
        Map<String, Object> params = new HashMap<>(1);
        params.put("remark", role.getRemark());
        List<SysRole> roleList = sysRoleService.queryList(params);
        if (roleList != null && roleList.size() > 0) {
            throw new RRException("该角色编码已存在!");
        }
        role.setCreateUserId(getUserId());
        sysRoleService.save(role);

        return R.ok();
    }

    /**
     * 修改角色
     */
    @ResponseBody
    @SysLog("修改角色")
    @RequestMapping("/update")
    @RequiresPermissions("sys:role:update")
    public R update(@RequestBody SysRole role) {
        ValidatorUtils.validateEntity(role);

        role.setCreateUserId(getUserId());
        sysRoleService.update(role);

        return R.ok();
    }

    /**
     * 删除角色
     */
    @ResponseBody
    @SysLog("删除角色")
    @RequestMapping("/delete")
    @RequiresPermissions("sys:role:delete")
    public R delete(@RequestBody Long[] roleIds) {

        sysRoleService.deleteBatch(roleIds);


        return R.ok();
    }
}
