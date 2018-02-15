package com.wiseautom.enumresource;

import com.wiseautom.utils.EnumMessage;

/**
 * @author GooliangYoung
 */
public enum WhetherEnum implements EnumMessage {
    /**
     * 是否
     */
    YES("1", "是"),
    NO("0", "否");
    private final String code;
    private final String value;

    WhetherEnum(String code, String value) {
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
