package com.wiseautom.enumresource;

import com.wiseautom.utils.EnumMessage;

/**
 * @author GooliangYoung
 */
public enum IsSupportEnum implements EnumMessage {
    /**
     * 支持
     */
    YES("1", "支持"),
    NO("0", "不支持");
    private final String code;
    private final String value;

    IsSupportEnum(String code, String value) {
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
