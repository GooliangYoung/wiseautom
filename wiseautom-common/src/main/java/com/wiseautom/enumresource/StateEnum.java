package com.wiseautom.enumresource;

import com.wiseautom.utils.EnumMessage;

/**
 * @author GooliangYoung
 */
public enum StateEnum implements EnumMessage {
    /**
     * 状态
     */
    ENABLE("1", "启用"),
    LIMIT("0", "禁用");
    private final String code;
    private final String value;

    StateEnum(String code, String value) {
        this.code = code;
        this.value = value;
    }

    @Override
    public String getCode() {
        return code;
    }

    @Override
    public String getValue() {
        return value;
    }
}
