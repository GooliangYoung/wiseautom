package com.wiseautom.enumresource;

import com.wiseautom.utils.EnumMessage;

/**
 * @author : GooliangYoung
 */
public enum DefaultEnum implements EnumMessage {
    /**
     * 超级账户
     */
    PARENT_ACCOUNT("yangguoliang", "默认超级账号"),
    /**
     * 默认密码
     */
    PASSWORD("8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92", "默认用户密码");
    private final String code;
    private final String value;

    DefaultEnum(String code, String value) {
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