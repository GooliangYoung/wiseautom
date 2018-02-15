package com.wiseautom.controller;

import com.wiseautom.annotation.SysLog;
import com.wiseautom.entity.Area;
import com.wiseautom.enumresource.StateEnum;
import com.wiseautom.enumresource.WhetherEnum;
import com.wiseautom.service.AreaService;
import com.wiseautom.utils.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author GooliangYoung
 */
@Controller
@RequestMapping("area")
public class AreaController {
    @Autowired
    private AreaService areaService;

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("area:list")
    public R list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);

        List<Area> areaList = areaService.queryList(query);
        int total = areaService.queryTotal(query);

        PageUtils pageUtil = new PageUtils(areaList, total, query.getLimit(), query.getPage());

        return R.ok().put("page", pageUtil);
    }

    /**
     * 获取下级地区
     */
    @ResponseBody
    @RequestMapping("normalList/{parentAreaId}")
    public R normalList(@PathVariable String parentAreaId) {
        List<EnumBean> list = new ArrayList<>();
        HashMap<String, Object> paraMap = new HashMap<>(2);
        paraMap.put("parentAreaId", parentAreaId);
        paraMap.put("state", WhetherEnum.YES.getCode());
        List<Area> areaList = areaService.getAreaListByIsShow(paraMap);

        for (Area area : areaList) {
            EnumBean bean = new EnumBean();
            bean.setCode(area.getAreaId());
            bean.setValue(area.getAreaName());
            list.add(bean);
        }
        return R.ok().put("data", list);
    }


    /**
     * 跳转到新增页面
     *
     * @return str
     */
    @RequestMapping("/add")
    @RequiresPermissions("area:save")
    public String add() {
        return "area/add.jsp";
    }

    /**
     * 跳转到修改页面
     *
     * @param request request
     * @param model   model
     * @param id      id
     * @return str
     */
    @RequestMapping("/edit/{id}")
    @RequiresPermissions("area:update")
    public String edit(HttpServletRequest request, Model model, @PathVariable("id") String id) {
        Area area = areaService.queryObject(id);
        model.addAttribute("model", area);
        return "area/edit.jsp";
    }

    /**
     * 信息
     *
     * @param areaId areaId
     * @return r
     */
    @ResponseBody
    @RequestMapping("/info/{areaId}")
    @RequiresPermissions("area:info")
    public R info(@PathVariable("areaId") String areaId) {
        Area area = areaService.queryObject(areaId);

        return R.ok().put("area", area);
    }

    /**
     * 保存
     *
     * @param area area
     * @return r
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("area:save")
    public R save(@RequestBody Area area) {
        verifyForm(area);
        //随机生成十位字符做为菜单标识
        String areaId = RandomCharUtil.getNumberRand();
        //算出子菜单的等级
        area.setAreaId(areaId);
        //设置拼音
        String pinyin = ChineseToEnglishUtil.getPingYin(area.getAreaName().trim()).trim();
        area.setEnName(pinyin);
        area.setWordIndex(pinyin.substring(0, 1).toUpperCase());
        //设置排序
        area.setSortNo(0);
        //设置 area_level;//lev+1
        area.setLevelArea("0");
        area.setIsCity("0");
        String[] parentIds = area.getParentAreaIds();
        String parentId = parentIds[parentIds.length - 1];
        if ("".equals(parentId)) {
            parentId = parentIds[parentIds.length - 2];
        }
        area.setParentAreaId(parentId.substring(parentId.length() - 10, parentId.length()));
        //设置行政级别（上级行政级别+1）
        Area parent = areaService.queryObject(parentId.substring(parentId.length() - 10, parentId.length()));
        int parentLevel = parent.getAreaLevel();
        if (parentLevel == -1) {
            parentLevel = 0;
        }
        if (parentLevel < 4) {
            parentLevel = parentLevel + 1;
        }
        area.setAreaLevel(parentLevel);
        area.setState(area.getState());
        areaService.save(area);

        return R.ok();
    }

    /**
     * 验证表码
     *
     * @param area area
     */
    private void verifyForm(Area area) {
        int count;
        Map<String, Object> params = new HashMap<>();
        params.put("areaName", area.getAreaName());
        count = areaService.getCount(params);
        if (count > 0) {
            throw new RRException("地区名称已存在");
        }
        params.clear();
        params.put("xzCode", area.getXzCode());
        count = areaService.getCount(params);
        if (count > 0) {
            throw new RRException("行政编码已存在");
        }

    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("area:update")
    public R update(@RequestBody Area area) {
        Area oldArea = areaService.queryObject(area.getAreaId());
        String oldAreaName = oldArea.getAreaName();
        String oldXzCode = oldArea.getXzCode();
        int count;
        if (!oldAreaName.equals(area.getAreaName())) {
            Map<String, Object> params = new HashMap<>();
            params.put("areaName", area.getAreaName());
            count = areaService.getCount(params);
            if (count > 0) {
                throw new RRException("地区名称已存在");
            }
        }
        if (!area.getXzCode().equals(oldXzCode)) {
            Map<String, Object> params = new HashMap<>();
            params.put("xzCode", area.getXzCode());
            count = areaService.getCount(params);
            if (count > 0) {
                throw new RRException("行政编码已存在");
            }
        }
        areaService.update(area);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("area:delete")
    public R delete(@RequestBody String[] areaIds) {
        areaService.deleteBatch(areaIds);

        return R.ok();
    }

    /**
     * 启用
     */
    @ResponseBody
    @SysLog("启用地区")
    @RequestMapping("/enable")
    @RequiresPermissions("area:update")
    public R enable(@RequestBody String[] ids) {
        String stateValue = StateEnum.ENABLE.getCode();
        areaService.updateState(ids, stateValue);
        return R.ok();
    }

    /**
     * 禁用
     */
    @ResponseBody
    @SysLog("禁用地区")
    @RequestMapping("/limit")
    @RequiresPermissions("area:update")
    public R limit(@RequestBody String[] ids) {
        String stateValue = StateEnum.LIMIT.getCode();
        areaService.updateState(ids, stateValue);
        return R.ok();
    }
}
