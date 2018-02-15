package com.wiseautom.enumresource;

import com.wiseautom.utils.EnumMessage;

/**
 * @author GooliangYoung
 */
public enum ProvinceEnum implements EnumMessage {
    /**
     * 省份
     */
    NEI_MENG_GU_ZI_ZHI_QU("111150000", "内蒙古自治区"),
    LIAO_NING_SHENG("1111210000", "辽宁省"),
    JI_LIN_SHENG("1111220000", "吉林省"),
    HEI_LONG_JIANG_SHENG("1111230000", "黑龙江省"),
    JIANG_SU_SHENG("1111320000", "江苏省"),
    ZHE_JIANG_SHENG("1111330000", "浙江省"),
    AN_HUI_SHENG("1111340000", "安徽省"),
    JIANG_XI_SHENG("1111360000", "江西省"),
    SHAN_DONG_SHENG("1111370000", "山东省"),
    SHAN_XI_SHENG("1111140000", "山西省"),
    HE_NAN_SHENG("1111410000", "河南省"),
    HU_NAN_SHENG("1111430000", "湖南省"),
    GUANG_DONG_SHENG("1111440000", "广东省"),
    GUANG_XI_ZHUANG_ZU_ZI_ZHI_QU("1111450000", "广西壮族自治区"),
    HAI_NAN_SHENG("1111460000", "海南省"),
    SI_CHUAN_SHENG("1111510000", "四川省"),
    GUI_ZHOU_SHENG("1111520000", "贵州省"),
    YUN_NAN_SHENG("1111530000", "云南省"),
    XI_ZANG_ZI_ZHI_QU("1111540000", "西藏自治区"),
    SHANN_XI_SHENG("1111610000", "陕西省"),
    GAN_SU_SHENG("1111620000", "甘肃省"),
    QING_HAI_SHENG("1111630000", "青海省"),
    NING_XIA_HUI_ZU_ZI_ZHI_QU("1111640000", "宁夏回族自治区"),
    XIN_JIANG_WEI_WU_ER_ZI_ZHI_QU("1111650000", "新疆维吾尔自治区"),
    TIAN_JIN("2111120000", "天津"),
    SHANG_HAI("2111310000", "上海"),
    CHONG_QING("2111500000", "重庆"),
    BEI_JING("2111110000", "北京"),
    HE_BEI("1111130000", "河北省"),
    FU_JIAN("1111350000", "福建省");

    private final String code;
    private final String value;

    ProvinceEnum(String code, String value) {
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

