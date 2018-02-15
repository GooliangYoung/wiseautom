package com.wiseautom.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class AmountUtil {


    /**
     * 金额元转分
     *
     * @param amount 金额
     * @return 转换结果
     */
    public static String amountToBranch(String amount) {
        if (StringUtil.isEmpty(amount)) {
            return "0";
        }
        BigDecimal bigAmount = new BigDecimal(amount);
        BigDecimal divisor = new BigDecimal(100);
        DecimalFormat df = new DecimalFormat("#0.000");
        String newAmount = df.format(bigAmount.multiply(divisor));
        //截取两位
        if (newAmount.length() > 1) {
            newAmount = newAmount.substring(0, newAmount.length() - 1);
        }
        return newAmount;
    }


    /**
     * @param
     * @Description 金额分转元
     * @date 2017-5-17 下午4:37:39
     */
    public static String amountToPrimary(String amount) {
        if (StringUtil.isEmpty(amount)) {
            return "0";
        }
        BigDecimal bigAmount = new BigDecimal(amount);
        BigDecimal divisor = new BigDecimal(100);
        DecimalFormat df = new DecimalFormat("#0.000");
        String newAmount = df.format(bigAmount.divide(divisor));
        //截取两位
        if (newAmount.length() > 1) {
            newAmount = newAmount.substring(0, newAmount.length() - 1);
        }
        return newAmount;
    }


    /**
     * @param
     * @Description 金额分转元，不保留小数
     * @date 2017年7月18日 下午3:03:49
     */
    public static String amountTransferUnit(String amount) {
        if (StringUtil.isEmpty(amount)) {
            return "0";
        }
        BigDecimal bigAmount = new BigDecimal(amount);
        BigDecimal divisor = new BigDecimal(100);
        DecimalFormat df = new DecimalFormat("#0");
        String newAmount = df.format(bigAmount.divide(divisor));
        return newAmount;
    }

    /**
     * @param amount     元单位
     * @param percentage 百分比0.00-100.00
     * @Description 获取金额的百分比积分,
     * @date 2017-5-17 下午4:37:39
     */
    public static int getInter(String amount, String percentage) {
        String regEx = "^(((\\d|[1-9]\\d)(\\.\\d{1,2})?)|100|100.0|100.00)$";
        boolean isMatch = percentage.matches(regEx);
        if (!isMatch) {
            return 0;
        }
        BigDecimal bigAmount = new BigDecimal(amount);
        DecimalFormat df = new DecimalFormat("#0.00");
        String newAmount = df.format(bigAmount);
        //截取金额前半部分
        String moneyLeft = newAmount.substring(0, newAmount.length() - 3);
        int totalInter = Integer.parseInt(moneyLeft);
        //计算获得积分值
        BigDecimal totalInterValue = new BigDecimal(totalInter);
        BigDecimal percentageValue = new BigDecimal(percentage);
        //乘法
        BigDecimal bigDecimalMultiply = totalInterValue.multiply(percentageValue);
        int multiply = bigDecimalMultiply.intValue();
        int giveInter = multiply / 100;
        return giveInter;
    }

    /**
     * @param amount 分单位
     * @Description 金额千分位格视化,
     * @date 2017-5-17 下午4:37:39
     */
    public static String formatMoney(String amount) {
        if (StringUtil.isEmpty(amount)) {
            return "0";
        }
        BigDecimal bigAmount = new BigDecimal(amount);
        BigDecimal divisor = new BigDecimal(100);
        DecimalFormat df = new DecimalFormat("#0.000");
        String newAmount = df.format(bigAmount.divide(divisor));
        //截取两位
        if (newAmount.length() > 1) {
            newAmount = newAmount.substring(0, newAmount.length() - 1);
        }
        String moneyStr = newAmount;
        //截取金额前半部分
        String moneyLeft = moneyStr.substring(0, moneyStr.length() - 3);
        //截取金额后半部分
        String moneyRight = moneyStr.substring(moneyStr.length() - 3, moneyStr.length());
        //金额格式化
        String formatMoney = DecimalFormat.getNumberInstance().format(Integer.parseInt(moneyLeft));
        return formatMoney + moneyRight;
    }

    public static String formatBigDecimal(String amount) {
        if (StringUtil.isEmpty(amount)) {
            return "0";
        }
        BigDecimal money = new BigDecimal(amount);
        DecimalFormat df = new DecimalFormat("#0.000");
        String newAmount = df.format(money);
        //截取两位
        if (newAmount.length() > 1) {
            newAmount = newAmount.substring(0, newAmount.length() - 1);
        }
        String moneyStr = newAmount;
        //截取金额前半部分
        String moneyLeft = moneyStr.substring(0, moneyStr.length() - 3);
        //截取金额后半部分
        String moneyRight = moneyStr.substring(moneyStr.length() - 3, moneyStr.length());
        //金额格式化
        String formatMoney = DecimalFormat.getNumberInstance().format(Integer.parseInt(moneyLeft));
        return formatMoney + moneyRight;
    }

    /**
     * @param
     * @Description 余额格视化
     * @date 2017-5-17 下午4:37:39
     */
    public static String formatCash(String amount) {
        if (StringUtil.isEmpty(amount)) {
            return "0";
        }
        BigDecimal bigAmount = new BigDecimal(amount);
        BigDecimal divisor = new BigDecimal(1);
        DecimalFormat df = new DecimalFormat("#0.000");
        String newAmount = df.format(bigAmount.divide(divisor));
        //截取两位
        if (newAmount.length() > 1) {
            newAmount = newAmount.substring(0, newAmount.length() - 1);
        }
        String moneyStr = newAmount;
        //截取金额前半部分
        String moneyLeft = moneyStr.substring(0, moneyStr.length() - 3);
        //截取金额后半部分
        String moneyRight = moneyStr.substring(moneyStr.length() - 3, moneyStr.length());
        //金额格式化
        String formatMoney = DecimalFormat.getNumberInstance().format(Integer.parseInt(moneyLeft));
        return formatMoney + moneyRight;
    }

    /**
     * @param
     * @Description 此方法单位分， 价格进位，例0.01 格式化后1
     * @date 2017年9月25日 下午8:50:02
     */
    public static String priceCarry(String amount) {
        if (amount.length() < 3) {
            //小于一元的，都当一元处理
            return "100";
        }
        //如果尾数是00则不进位
        if (amount.substring(amount.length() - 2, amount.length()).equals("00")) {
            return amount;
        } else {
            int carryAmount = (Integer.parseInt(amount.substring(0, amount.length() - 2)) + 1) * 100;
            return String.valueOf(carryAmount);
        }
    }
}
