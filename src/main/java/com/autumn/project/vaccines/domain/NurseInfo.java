package com.autumn.project.vaccines.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.autumn.framework.aspectj.lang.annotation.Excel;
import com.autumn.framework.web.domain.BaseEntity;

/**
 * 护士信息对象 nurse_info
 *
 * @author autumn
 * @date 2024-04-13
 */
public class NurseInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long id;

    /**
     * 照片
     */
    @Excel(name = "照片")
    private String nursePhoto;

    /**
     * 护士编号
     */
    @Excel(name = "护士编号")
    private String nurseCode;

    /**
     * 护士姓名
     */
    @Excel(name = "护士姓名")
    private String nurseName;

    /**
     * 具体职称
     */
    @Excel(name = "具体职称")
    private String nurseJob;

    /**
     * 工龄
     */
    @Excel(name = "工龄")
    private Long seniority;

    /**
     * 性别
     */
    @Excel(name = "性别")
    private String nurseSex;

    /**
     * 生日
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date nurseBirthday;

    /**
     * 简介
     */
    @Excel(name = "简介")
    private String biography;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private String state;

    /**
     * 扩展字段1
     */
    @Excel(name = "扩展字段1")
    private Integer ext1;

    /**
     * 扩展字段2
     */
    @Excel(name = "扩展字段2")
    private String ext2;

    /**
     * 扩展字段3
     */
    @Excel(name = "扩展字段3")
    private String ext3;

    /**
     * 扩展字段4
     */
    @Excel(name = "扩展字段4")
    private String ext4;

    /**
     * 扩展字段5
     */
    @Excel(name = "扩展字段5")
    private String ext5;

    /**
     * 扩展字段6
     */
    @Excel(name = "扩展字段6")
    private String ext6;

    /**
     * 扩展字段7
     */
    @Excel(name = "扩展字段7")
    private String ext7;

    /**
     * 扩展字段8
     */
    @Excel(name = "扩展字段8")
    private String ext8;

    /**
     * 扩展字段9
     */
    @Excel(name = "扩展字段9")
    private String ext9;

    /**
     * 扩展字段10
     */
    @Excel(name = "扩展字段10")
    private String ext10;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setNursePhoto(String nursePhoto) {
        this.nursePhoto = nursePhoto;
    }

    public String getNursePhoto() {
        return nursePhoto;
    }

    public void setNurseCode(String nurseCode) {
        this.nurseCode = nurseCode;
    }

    public String getNurseCode() {
        return nurseCode;
    }

    public void setNurseName(String nurseName) {
        this.nurseName = nurseName;
    }

    public String getNurseName() {
        return nurseName;
    }

    public void setNurseJob(String nurseJob) {
        this.nurseJob = nurseJob;
    }

    public String getNurseJob() {
        return nurseJob;
    }

    public void setSeniority(Long seniority) {
        this.seniority = seniority;
    }

    public Long getSeniority() {
        return seniority;
    }

    public void setNurseSex(String nurseSex) {
        this.nurseSex = nurseSex;
    }

    public String getNurseSex() {
        return nurseSex;
    }

    public void setNurseBirthday(Date nurseBirthday) {
        this.nurseBirthday = nurseBirthday;
    }

    public Date getNurseBirthday() {
        return nurseBirthday;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    public String getBiography() {
        return biography;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setExt1(Integer ext1) {
        this.ext1 = ext1;
    }

    public Integer getExt1() {
        return ext1;
    }

    public void setExt2(String ext2) {
        this.ext2 = ext2;
    }

    public String getExt2() {
        return ext2;
    }

    public void setExt3(String ext3) {
        this.ext3 = ext3;
    }

    public String getExt3() {
        return ext3;
    }

    public void setExt4(String ext4) {
        this.ext4 = ext4;
    }

    public String getExt4() {
        return ext4;
    }

    public void setExt5(String ext5) {
        this.ext5 = ext5;
    }

    public String getExt5() {
        return ext5;
    }

    public void setExt6(String ext6) {
        this.ext6 = ext6;
    }

    public String getExt6() {
        return ext6;
    }

    public void setExt7(String ext7) {
        this.ext7 = ext7;
    }

    public String getExt7() {
        return ext7;
    }

    public void setExt8(String ext8) {
        this.ext8 = ext8;
    }

    public String getExt8() {
        return ext8;
    }

    public void setExt9(String ext9) {
        this.ext9 = ext9;
    }

    public String getExt9() {
        return ext9;
    }

    public void setExt10(String ext10) {
        this.ext10 = ext10;
    }

    public String getExt10() {
        return ext10;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("nursePhoto", getNursePhoto())
                .append("nurseCode", getNurseCode())
                .append("nurseName", getNurseName())
                .append("nurseJob", getNurseJob())
                .append("seniority", getSeniority())
                .append("nurseSex", getNurseSex())
                .append("nurseBirthday", getNurseBirthday())
                .append("biography", getBiography())
                .append("state", getState())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
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
