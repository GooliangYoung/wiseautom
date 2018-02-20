package com.wiseautom.util;

import java.util.UUID;

/**
 * @author GooliangYoung
 */
public class UUIDUtils {
    /**
     * 获取36位UUID
     *
     * @return UUID
     */
    public static String uuid36() {
        return UUID.randomUUID().toString();
    }
}
