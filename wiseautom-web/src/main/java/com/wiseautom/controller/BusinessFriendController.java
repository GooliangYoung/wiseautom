package com.wiseautom.controller;

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

import com.wiseautom.entity.BusinessFriend;
import com.wiseautom.service.BusinessFriendService;
import com.wiseautom.utils.PageUtils;
import com.wiseautom.utils.Query;
import com.wiseautom.utils.R;


/**
 * 商业伙伴干系人
 *
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
@Controller
@RequestMapping("businessfriend")
public class BusinessFriendController {
    @Autowired
    private BusinessFriendService businessFriendService;

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("businessfriend:list")
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<BusinessFriend> businessFriendList = businessFriendService.getList(query);
        int total = businessFriendService.getCount(query);

        PageUtils pageUtil = new PageUtils(businessFriendList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 跳转到新增页面
     **/
    @RequestMapping("/add")
    @RequiresPermissions("businessfriend:save")
    public String add() {
        return "businessfriend/add.jsp";
    }

    /**
     * 跳转到修改页面
     **/
    @RequestMapping("/edit/{id}")
    @RequiresPermissions("businessfriend:update")
    public String edit(Model model, @PathVariable("id") String id) {
        BusinessFriend businessFriend = businessFriendService.get(id);
        model.addAttribute("model", businessFriend);
        return "businessfriend/edit.jsp";
    }

    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{objId}")
    @RequiresPermissions("businessfriend:info")
    public R info(@PathVariable("objId") String objId) {
        BusinessFriend businessFriend = businessFriendService.get(objId);
        return R.ok().put("businessFriend", businessFriend);
    }

    /**
     * 保存
     */
    @ResponseBody
    @SysLog("保存商业伙伴干系人")
    @RequestMapping("/save")
    @RequiresPermissions("businessfriend:save")
    public R save(@RequestBody BusinessFriend businessFriend) {
        businessFriend.setObjId(UUIDUtils.uuid36());
        businessFriendService.save(businessFriend);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @SysLog("修改商业伙伴干系人")
    @RequestMapping("/update")
    @RequiresPermissions("businessfriend:update")
    public R update(@RequestBody BusinessFriend businessFriend) {
        businessFriendService.update(businessFriend);

        return R.ok();
    }

    /**
     * 启用
     */
    @ResponseBody
    @SysLog("启用商业伙伴干系人")
    @RequestMapping("/enable")
    @RequiresPermissions("businessfriend:update")
    public R enable(@RequestBody String[] ids) {
        String stateValue = StateEnum.ENABLE.getCode();
        businessFriendService.updateState(ids, stateValue);
        return R.ok();
    }

    /**
     * 禁用
     */
    @ResponseBody
    @SysLog("禁用商业伙伴干系人")
    @RequestMapping("/limit")
    @RequiresPermissions("businessfriend:update")
    public R limit(@RequestBody String[] ids) {
        String stateValue = StateEnum.LIMIT.getCode();
        businessFriendService.updateState(ids, stateValue);
        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @SysLog("删除商业伙伴干系人")
    @RequestMapping("/delete")
    @RequiresPermissions("businessfriend:delete")
    public R delete(@RequestBody String[] objIds) {
        businessFriendService.deleteBatch(objIds);

        return R.ok();
    }

}
