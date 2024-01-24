package com.autumn.project.vaccines.domain;

import com.autumn.framework.aspectj.lang.annotation.Excel;
import com.autumn.framework.web.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 用户填报信息对象 user_fill_info
 *
 * @author autumn
 * @date 2024-01-23
 */
public class UserFillInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private String flag1;
    private String flag2;
    private String roleFlag;
    private Boolean scoreIsNull;
    private String[] stateIn;
    /**
     * ID
     */
    private Long id;
    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 家长姓名
     */
    @Excel(name = "家长姓名")
    private String userName;
    /**
     * 家长性别
     */
    @Excel(name = "家长性别", dictType = "sys_user_sex")
    private String userSex;
    /**
     * 孩子姓名
     */
    @Excel(name = "孩子姓名")
    private String childrenName;
    /**
     * 孩子性别
     */
    @Excel(name = "孩子性别", dictType = "sys_user_sex")
    private String childrenSex;
    /**
     * 孩子出生日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "孩子出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date childrenBirthday;
    /**
     * 填报日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "填报日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date today;
    /**
     * 孩子过敏事项
     */
    @Excel(name = "孩子过敏事项")
    private String childrenAllergy;
    /**
     * 家长手机号码
     */
    @Excel(name = "家长手机号码")
    private String userPhone;
    /**
     * 家庭住址
     */
    @Excel(name = "家庭住址")
    private String address;
    /**
     * 注意事项
     */
    @Excel(name = "注意事项")
    private String takeCare;
    /**
     * 评分
     */
    @Excel(name = "评分")
    private String score;
    /**
     * 意见建议
     */
    @Excel(name = "意见建议")
    private String opinions;
    /**
     * 状态(1用户草稿，2用户推送，3系统选择，4管理员审核，5用户已读)
     */
    @Excel(name = "状态", dictType = "user_fill_state")
    private String state;
    /**
     * 扩展字段1
     */
    private String ext1;
    /**
     * 扩展字段2
     */
    private String ext2;
    /**
     * 扩展字段3
     */
    private String ext3;
    /**
     * 扩展字段4
     */
    private String ext4;
    /**
     * 扩展字段5
     */
    private String ext5;
    /**
     * 扩展字段6
     */
    private String ext6;
    /**
     * 扩展字段7
     */
    private String ext7;
    /**
     * 扩展字段8
     */
    private String ext8;
    /**
     * 扩展字段9
     */
    private String ext9;
    /**
     * 扩展字段10
     */
    private String ext10;

    public String getFlag2() {
        return flag2;
    }

    public void setFlag2(String flag2) {
        this.flag2 = flag2;
    }

    public String getFlag1() {
        return flag1;
    }

    public void setFlag1(String flag1) {
        this.flag1 = flag1;
    }

    public String[] getStateIn() {
        return stateIn;
    }

    public void setStateIn(String[] stateIn) {
        this.stateIn = stateIn;
    }

    public Boolean getScoreIsNull() {
        return scoreIsNull;
    }

    public void setScoreIsNull(Boolean scoreIsNull) {
        this.scoreIsNull = scoreIsNull;
    }

    public String getRoleFlag() {
        return roleFlag;
    }

    public void setRoleFlag(String roleFlag) {
        this.roleFlag = roleFlag;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getChildrenName() {
        return childrenName;
    }

    public void setChildrenName(String childrenName) {
        this.childrenName = childrenName;
    }

    public String getChildrenSex() {
        return childrenSex;
    }

    public void setChildrenSex(String childrenSex) {
        this.childrenSex = childrenSex;
    }

    public Date getChildrenBirthday() {
        return childrenBirthday;
    }

    public void setChildrenBirthday(Date childrenBirthday) {
        this.childrenBirthday = childrenBirthday;
    }

    public Date getToday() {
        return today;
    }

    public void setToday(Date today) {
        this.today = today;
    }

    public String getChildrenAllergy() {
        return childrenAllergy;
    }

    public void setChildrenAllergy(String childrenAllergy) {
        this.childrenAllergy = childrenAllergy;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTakeCare() {
        return takeCare;
    }

    public void setTakeCare(String takeCare) {
        this.takeCare = takeCare;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getOpinions() {
        return opinions;
    }

    public void setOpinions(String opinions) {
        this.opinions = opinions;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getExt1() {
        return ext1;
    }

    public void setExt1(String ext1) {
        this.ext1 = ext1;
    }

    public String getExt2() {
        return ext2;
    }

    public void setExt2(String ext2) {
        this.ext2 = ext2;
    }

    public String getExt3() {
        return ext3;
    }

    public void setExt3(String ext3) {
        this.ext3 = ext3;
    }

    public String getExt4() {
        return ext4;
    }

    public void setExt4(String ext4) {
        this.ext4 = ext4;
    }

    public String getExt5() {
        return ext5;
    }

    public void setExt5(String ext5) {
        this.ext5 = ext5;
    }

    public String getExt6() {
        return ext6;
    }

    public void setExt6(String ext6) {
        this.ext6 = ext6;
    }

    public String getExt7() {
        return ext7;
    }

    public void setExt7(String ext7) {
        this.ext7 = ext7;
    }

    public String getExt8() {
        return ext8;
    }

    public void setExt8(String ext8) {
        this.ext8 = ext8;
    }

    public String getExt9() {
        return ext9;
    }

    public void setExt9(String ext9) {
        this.ext9 = ext9;
    }

    public String getExt10() {
        return ext10;
    }

    public void setExt10(String ext10) {
        this.ext10 = ext10;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("userSex", getUserSex())
                .append("childrenName", getChildrenName())
                .append("childrenSex", getChildrenSex())
                .append("childrenBirthday", getChildrenBirthday())
                .append("today", getToday())
                .append("childrenAllergy", getChildrenAllergy())
                .append("userPhone", getUserPhone())
                .append("address", getAddress())
                .append("takeCare", getTakeCare())
                .append("score", getScore())
                .append("opinions", getOpinions())
                .append("state", getState())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("remark", getRemark())
                .append("ext1", getExt1())
                .append("ext2", getExt2())
                .append("ext3", getExt3())
                .append("ext4", getExt4())
                .append("ext5", getExt5())
                .append("ext6", getExt6())
                .append("ext7", getExt7())
                .append("ext8", getExt8())
                .append("ext9", getExt9())
                .append("ext10", getExt10())
                .toString();
    }
}
