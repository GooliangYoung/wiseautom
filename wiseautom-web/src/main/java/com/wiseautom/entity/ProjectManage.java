package com.wiseautom.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 项目管理表
 *
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
public class ProjectManage implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     **/
    private String objId;
    /**
     * 项目编号
     **/
    private String projectCode;
    /**
     * 项目名称
     **/
    private String projectName;
    /**
     * 项目报价金额
     **/
    private BigDecimal projectOffer;
    /**
     * 项目报价金额大写
     **/
    private String projectOfferCn;
    /**
     * 项目回款金额
     **/
    private BigDecimal projectPayments;
    /**
     * 项目回款金额大写
     **/
    private String projectPaymentsCn;
    /**
     * 项目计划开始时间
     **/
    private Date projectPlanStartTime;
    /**
     * 项目实际开始时间
     **/
    private Date projectStartTime;
    /**
     * 项目计划结束时间
     **/
    private Date projectPlanEndTime;
    /**
     * 项目实际结束时间
     **/
    private Date projectEndTime;
    /**
     * 项目当前状态
     **/
    private int projectStatus;
    /**
     * 项目创建时间
     **/
    private Date createTime;
    /**
     * 备注
     **/
    private String remark;

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
     * 设置：项目编号
     */
    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    /**
     * 获取：项目编号
     */
    public String getProjectCode() {
        return projectCode;
    }

    /**
     * 设置：项目名称
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /**
     * 获取：项目名称
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     * 设置：项目报价金额
     */
    public void setProjectOffer(BigDecimal projectOffer) {
        this.projectOffer = projectOffer;
    }

    /**
     * 获取：项目报价金额
     */
    public BigDecimal getProjectOffer() {
        return projectOffer;
    }

    /**
     * 设置：项目报价金额大写
     */
    public void setProjectOfferCn(String projectOfferCn) {
        this.projectOfferCn = projectOfferCn;
    }

    /**
     * 获取：项目报价金额大写
     */
    public String getProjectOfferCn() {
        return projectOfferCn;
    }

    /**
     * 设置：项目回款金额
     */
    public void setProjectPayments(BigDecimal projectPayments) {
        this.projectPayments = projectPayments;
    }

    /**
     * 获取：项目回款金额
     */
    public BigDecimal getProjectPayments() {
        return projectPayments;
    }

    /**
     * 设置：项目回款金额大写
     */
    public void setProjectPaymentsCn(String projectPaymentsCn) {
        this.projectPaymentsCn = projectPaymentsCn;
    }

    /**
     * 获取：项目回款金额大写
     */
    public String getProjectPaymentsCn() {
        return projectPaymentsCn;
    }

    /**
     * 设置：项目计划开始时间
     */
    public void setProjectPlanStartTime(Date projectPlanStartTime) {
        this.projectPlanStartTime = projectPlanStartTime;
    }

    /**
     * 获取：项目计划开始时间
     */
    public Date getProjectPlanStartTime() {
        return projectPlanStartTime;
    }

    /**
     * 设置：项目实际开始时间
     */
    public void setProjectStartTime(Date projectStartTime) {
        this.projectStartTime = projectStartTime;
    }

    /**
     * 获取：项目实际开始时间
     */
    public Date getProjectStartTime() {
        return projectStartTime;
    }

    /**
     * 设置：项目计划结束时间
     */
    public void setProjectPlanEndTime(Date projectPlanEndTime) {
        this.projectPlanEndTime = projectPlanEndTime;
    }

    /**
     * 获取：项目计划结束时间
     */
    public Date getProjectPlanEndTime() {
        return projectPlanEndTime;
    }

    /**
     * 设置：项目实际结束时间
     */
    public void setProjectEndTime(Date projectEndTime) {
        this.projectEndTime = projectEndTime;
    }

    /**
     * 获取：项目实际结束时间
     */
    public Date getProjectEndTime() {
        return projectEndTime;
    }

    /**
     * 设置：项目当前状态
     */
    public void setProjectStatus(int projectStatus) {
        this.projectStatus = projectStatus;
    }

    /**
     * 获取：项目当前状态
     */
    public int getProjectStatus() {
        return projectStatus;
    }

    /**
     * 设置：项目创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取：项目创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置：备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：备注
     */
    public String getRemark() {
        return remark;
    }
}
