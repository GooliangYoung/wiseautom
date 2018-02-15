package com.wiseautom.enumresource;

/**
 * @author GooliangYoung
 */
public enum TopCatEnum {
    /**
     * 等级
     */
    TopCat("0", "顶级分类");
    private final String desc;
    private final String code;

    TopCatEnum(String code, String desc) {
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
