package com.wiseautom.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import com.wiseautom.enumresource.StateEnum;
import com.wiseautom.annotation.SysLog;
import com.wiseautom.util.UUIDUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.wiseautom.entity.ProjectPaymentDetial;
import com.wiseautom.service.ProjectPaymentDetialService;
import com.wiseautom.utils.PageUtils;
import com.wiseautom.utils.Query;
import com.wiseautom.utils.R;


/**
 * 项目回款明细
 *
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
@Controller
@RequestMapping("projectpaymentdetial")
public class ProjectPaymentDetialController {
    @Autowired
    private ProjectPaymentDetialService projectPaymentDetialService;

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("projectpaymentdetial:list")
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<ProjectPaymentDetial> projectPaymentDetialList = projectPaymentDetialService.getList(query);
        int total = projectPaymentDetialService.getCount(query);

        PageUtils pageUtil = new PageUtils(projectPaymentDetialList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 跳转到新增页面
     **/
    @RequestMapping("/add")
    @RequiresPermissions("projectpaymentdetial:save")
    public String add() {
        return "projectpaymentdetial/add.jsp";
    }

    /**
     * 跳转到修改页面
     **/
    @RequestMapping("/edit/{id}")
    @RequiresPermissions("projectpaymentdetial:update")
    public String edit(Model model, @PathVariable("id") String id) {
        ProjectPaymentDetial projectPaymentDetial = projectPaymentDetialService.get(id);
        model.addAttribute("model", projectPaymentDetial);
        return "projectpaymentdetial/edit.jsp";
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{objId}")
    @RequiresPermissions("projectpaymentdetial:info")
    public String info(Model model, @PathVariable("objId") String objId) {
        ProjectPaymentDetial projectPaymentDetial = projectPaymentDetialService.get(objId);
        model.addAttribute("model", projectPaymentDetial);
        model.addAttribute("paymentDate", DateUtil.format(projectPaymentDetial.getPaymentDate(), DatePattern.NORM_DATETIME_PATTERN));
        return "projectpaymentdetial/info.jsp";
    }

    /**
     * 保存
     */
    @ResponseBody
    @SysLog("保存项目回款明细")
    @RequestMapping("/save")
    @RequiresPermissions("projectpaymentdetial:save")
    public R save(@RequestBody ProjectPaymentDetial projectPaymentDetial) {
        projectPaymentDetial.setObjId(UUIDUtils.uuid36());
        projectPaymentDetial.setPaymentDate(new Date());
        projectPaymentDetialService.save(projectPaymentDetial);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @SysLog("修改项目回款明细")
    @RequestMapping("/update")
    @RequiresPermissions("projectpaymentdetial:update")
    public R update(@RequestBody ProjectPaymentDetial projectPaymentDetial) {
        projectPaymentDetialService.update(projectPaymentDetial);

        return R.ok();
    }

    /**
     * 启用
     */
    @ResponseBody
    @SysLog("启用项目回款明细")
    @RequestMapping("/enable")
    @RequiresPermissions("projectpaymentdetial:update")
    public R enable(@RequestBody String[] ids) {
        String stateValue = StateEnum.ENABLE.getCode();
        projectPaymentDetialService.updateState(ids, stateValue);
        return R.ok();
    }

    /**
     * 禁用
     */
    @ResponseBody
    @SysLog("禁用项目回款明细")
    @RequestMapping("/limit")
    @RequiresPermissions("projectpaymentdetial:update")
    public R limit(@RequestBody String[] ids) {
        String stateValue = StateEnum.LIMIT.getCode();
        projectPaymentDetialService.updateState(ids, stateValue);
        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @SysLog("删除项目回款明细")
    @RequestMapping("/delete")
    @RequiresPermissions("projectpaymentdetial:delete")
    public R delete(@RequestBody String[] objIds) {
        projectPaymentDetialService.deleteBatch(objIds);

        return R.ok();
    }

}
