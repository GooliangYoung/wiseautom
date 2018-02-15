package com.wiseautom.controller;

import com.wiseautom.entity.SysLog;
import com.wiseautom.service.SysLogService;
import com.wiseautom.utils.PageUtils;
import com.wiseautom.utils.Query;
import com.wiseautom.utils.R;
import com.wiseautom.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 系统日志
 *
 * @author GooliangYoung
 */
@Controller
@RequestMapping("/sys/log")
public class SysLogController {
    @Autowired
    private SysLogService sysLogService;

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("sys:log:list")
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<SysLog> sysLogList = sysLogService.queryList(query);
        int total = sysLogService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(sysLogList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }


    /**
     * 新增
     **/
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("sys:log:add")
    public R save(@RequestBody SysLog syslog) {
        ValidatorUtils.validateEntity(syslog);
        syslog.setCreateDate(new Date());
        syslog.setIp("1231454685");
        syslog.setMethod("asd");
        syslog.setOperation("asdawd");
        syslog.setParams("asdawdaw");
        sysLogService.save(syslog);

        return R.ok();
    }

    /**
     * 修改
     **/
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("sys:log:edit")
    public R update(@RequestBody SysLog syslog) {
        ValidatorUtils.validateEntity(syslog);
        sysLogService.update(syslog);
        return R.ok();
    }

    /**
     * 跳转到新增页面
     **/
    @RequestMapping("/add")
    @RequiresPermissions("sys:log:add")
    public String add() {
        return "syslog/add.jsp";
    }

    /**
     * 跳转到修改页面
     **/
    @RequestMapping("/edit/{id}")
    @RequiresPermissions("sys:log:edit")
    public String edit(HttpServletRequest request, Model model, @PathVariable("id") Long id) {
        SysLog sysLog = sysLogService.queryObject(id);
        model.addAttribute("model", sysLog);
        return "syslog/edit.jsp";
    }

    /**
     * 删除
     **/
    @ResponseBody
    @RequestMapping("/deleteBatch")
    @RequiresPermissions("sys:log:delete")
    public R deleteBatch(@RequestBody Long[] ids) {
        sysLogService.deleteBatch(ids);
        return R.ok();
    }
}
