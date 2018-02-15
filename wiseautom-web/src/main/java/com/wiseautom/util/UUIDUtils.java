package com.wiseautom.util;

import java.util.UUID;

/**
 * @author GooliangYoung
 */
public class UUIDUtils {
    public static String uuid() {
        String s = UUID.randomUUID().toString();
        String uuid = s.replace("-", "");
        return uuid;
    }

    public static void main(String[] args) {
        System.out.println(UUIDUtils.uuid());
    }
}
