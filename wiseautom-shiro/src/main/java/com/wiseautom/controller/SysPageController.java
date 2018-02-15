package com.wiseautom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统页面视图
 *
 * @author GooliangYoung
 */
@Controller
public class SysPageController {

    @RequestMapping("/page/{url}.jsp")
    public String jsp(@PathVariable("url") String url) {
        return "/page/" + url + ".jsp";
    }

}
