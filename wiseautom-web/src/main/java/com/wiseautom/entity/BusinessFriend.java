package com.wiseautom.entity;

import java.io.Serializable;


/**
 * 商业伙伴干系人
 *
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
public class BusinessFriend implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     **/
    private String objId;
    /**
     * 干系人姓名
     **/
    private String friendName;
    /**
     * 干系人电话
     **/
    private String friendPhone;
    /**
     * 干系人邮箱
     **/
    private String friendEmail;
    /**
     * 干系人地址
     **/
    private String friendAddress;
    /**
     * 干系人公司
     **/
    private String friendCompany;
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
     * 设置：干系人姓名
     */
    public void setFriendName(String friendName) {
        this.friendName = friendName;
    }

    /**
     * 获取：干系人姓名
     */
    public String getFriendName() {
        return friendName;
    }

    /**
     * 设置：干系人电话
     */
    public void setFriendPhone(String friendPhone) {
        this.friendPhone = friendPhone;
    }

    /**
     * 获取：干系人电话
     */
    public String getFriendPhone() {
        return friendPhone;
    }

    /**
     * 设置：干系人邮箱
     */
    public void setFriendEmail(String friendEmail) {
        this.friendEmail = friendEmail;
    }

    /**
     * 获取：干系人邮箱
     */
    public String getFriendEmail() {
        return friendEmail;
    }

    /**
     * 设置：干系人地址
     */
    public void setFriendAddress(String friendAddress) {
        this.friendAddress = friendAddress;
    }

    /**
     * 获取：干系人地址
     */
    public String getFriendAddress() {
        return friendAddress;
    }

    /**
     * 设置：干系人公司
     */
    public void setFriendCompany(String friendCompany) {
        this.friendCompany = friendCompany;
    }

    /**
     * 获取：干系人公司
     */
    public String getFriendCompany() {
        return friendCompany;
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
