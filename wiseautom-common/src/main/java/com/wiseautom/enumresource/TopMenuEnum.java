package com.wiseautom.enumresource;

/**
 * @author GooliangYoung
 */
public enum TopMenuEnum {
    /**
     * 菜单
     */
    TopMenu("0", "顶级菜单"),
    TopOrg("0", "顶级部门");
    private final String desc;
    private final String code;

    TopMenuEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    public String getCode() {
        return code;
    }
}
