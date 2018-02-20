package com.wiseautom.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 项目回款明细
 *
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
public class ProjectPaymentDetial implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     **/
    private String objId;
    /**
     * 所属项目id
     **/
    private String projectId;
    /**
     * 项目名称
     */
    private String projectName;
    /**
     * 回款金额
     **/
    private BigDecimal paymentMoney;
    /**
     * 回款金额大写
     **/
    private String paymentMoneyCn;
    /****/
    private BigDecimal surplusMoney;
    /**
     * 回款日期
     **/
    private Date paymentDate;

    /**
     * 设置：主键
     */
    public void setObjId(String objId) {
        this.objId = objId;
    }

    /**
     * 获取：主键
     */
    public String getObjId() {
        return objId;
    }

    /**
     * 设置：所属项目id
     */
    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    /**
     * 获取：所属项目id
     */
    public String getProjectId() {
        return projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /**
     * 设置：回款金额
     */
    public void setPaymentMoney(BigDecimal paymentMoney) {
        this.paymentMoney = paymentMoney;
    }

    /**
     * 获取：回款金额
     */
    public BigDecimal getPaymentMoney() {
        return paymentMoney;
    }

    /**
     * 设置：回款金额大写
     */
    public void setPaymentMoneyCn(String paymentMoneyCn) {
        this.paymentMoneyCn = paymentMoneyCn;
    }

    /**
     * 获取：回款金额大写
     */
    public String getPaymentMoneyCn() {
        return paymentMoneyCn;
    }

    /**
     * 设置：
     */
    public void setSurplusMoney(BigDecimal surplusMoney) {
        this.surplusMoney = surplusMoney;
    }

    /**
     * 获取：
     */
    public BigDecimal getSurplusMoney() {
        return surplusMoney;
    }

    /**
     * 设置：回款日期
     */
    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    /**
     * 获取：回款日期
     */
    public Date getPaymentDate() {
        return paymentDate;
    }
}
