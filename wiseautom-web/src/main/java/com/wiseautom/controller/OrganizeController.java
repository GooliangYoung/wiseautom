package com.wiseautom.controller;

import com.wiseautom.annotation.SysLog;
import com.wiseautom.entity.Organize;
import com.wiseautom.enumresource.StateEnum;
import com.wiseautom.enumresource.TopMenuEnum;
import com.wiseautom.service.OrganizeService;
import com.wiseautom.service.SysMenuService;
import com.wiseautom.utils.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * 记录组织机构管理信息
 *
 * @author GooliangYoung
 */
@Controller
@RequestMapping("organize")
public class OrganizeController {
    @Autowired
    private OrganizeService organizeService;
    @Autowired
    private SysMenuService sysMenuService;

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("organize:list")
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<Organize> organizeList = organizeService.queryList(query);
        int total = organizeService.queryTotal(query);
        for (Organize organize : organizeList) {
            if (TopMenuEnum.TopMenu.getCode().equals(organize.getParentOrgId())) {
                organize.setParentOrgName(TopMenuEnum.TopMenu.getDesc());
                organize.setParentOrgId("-");
            }
        }

        PageUtils pageUtil = new PageUtils(organizeList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 跳转到新增页面
     **/
    @RequestMapping("/add")
    @RequiresPermissions("organize:save")
    public String add() {
        return "organize/add.jsp";
    }

    /**
     * 选择菜单(添加、修改菜单)
     */
    @ResponseBody
    @RequestMapping("/select")
    public R select() {

        List<Organize> organizeList = organizeService.getList();

        //添加顶级菜单
        Organize root = new Organize();

        root.setOrgId(TopMenuEnum.TopOrg.getCode());
        root.setOrgName(TopMenuEnum.TopOrg.getDesc());
        root.setParentOrgId("-1");
        root.setOpen(true);
        organizeList.add(root);
        List<ZtreeBean> ztreeBeans = new ArrayList<>();
        for (Organize organize : organizeList) {
            ZtreeBean tree = new ZtreeBean();
            tree.setId(organize.getOrgId() + "");
            tree.setpId(organize.getParentOrgId() + "");
            tree.setName(organize.getOrgName());
            tree.setOpen(organize.isOpen() + "");
            tree.setChkDisabled("false");
            ztreeBeans.add(tree);
        }

        return R.ok().put("data", ztreeBeans);
    }

    /**
     * 跳转到修改页面
     **/
    @RequestMapping("/edit/{id}")
    @RequiresPermissions("organize:update")
    public String edit(Model model, @PathVariable("id") String id) {
        Organize organize = organizeService.queryObject(id);
        model.addAttribute("model", organize);
        return "organize/edit.jsp";
    }

    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{orgId}")
    @RequiresPermissions("organize:info")
    public R info(@PathVariable("orgId") String orgId) {
        Organize organize = organizeService.queryObject(orgId);
        return R.ok().put("organize", organize);
    }

    /**
     * 保存
     */
    @ResponseBody
    @SysLog("保存记录组织机构管理信息")
    @RequestMapping("/save")
    @RequiresPermissions("organize:save")
    public R save(@RequestBody Organize organize) {
        //判断部门编号是否存在
        Organize organize2 = organizeService.queryByOrgCode(organize.getOrgCode());
        if (!StringUtil.isNullOrEmpty(organize2)) {
            return R.error("部门编号已存在");
        }

        organizeService.save(organize);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @SysLog("修改记录组织机构管理信息")
    @RequestMapping("/update")
    @RequiresPermissions("organize:update")
    public R update(@RequestBody Organize organize) {

        organizeService.update(organize);

        return R.ok();
    }

    /**
     * 启用
     */
    @ResponseBody
    @SysLog("启用记录组织机构管理信息")
    @RequestMapping("/enable")
    @RequiresPermissions("organize:update")
    public R enable(@RequestBody String[] ids) {
        String stateValue = StateEnum.ENABLE.getCode();
        organizeService.updateState(ids, stateValue);
        return R.ok();
    }

    /**
     * 禁用
     */
    @ResponseBody
    @SysLog("禁用记录组织机构管理信息")
    @RequestMapping("/limit")
    @RequiresPermissions("organize:update")
    public R limit(@RequestBody String[] ids) {
        String stateValue = StateEnum.LIMIT.getCode();
        organizeService.updateState(ids, stateValue);
        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @SysLog("删除记录组织机构管理信息")
    @RequestMapping("/delete")
    @RequiresPermissions("organize:delete")
    public R delete(@RequestBody String[] orgIds) {

        for (String orgId : orgIds) {
            organizeService.delete(orgId);
        }

        return R.ok();
    }

}
