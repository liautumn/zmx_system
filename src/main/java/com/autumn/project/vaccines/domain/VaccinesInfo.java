package com.autumn.project.vaccines.domain;

import com.autumn.framework.aspectj.lang.annotation.Excel;
import com.autumn.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 疫苗信息对象 vaccines_info
 *
 * @author autumn
 * @date 2024-01-23
 */
public class VaccinesInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long id;

    /**
     * 疫苗名称
     */
    @Excel(name = "疫苗名称")
    private String vaccinesName;

    /**
     * 疫苗标识
     */
    @Excel(name = "疫苗标识")
    private String vaccinesCode;

    /**
     * 接种方式标识
     */
    @Excel(name = "接种方式")
    private String vaccinationMethodCode;

    /**
     * 最小年龄(天)
     */
    @Excel(name = "最小年龄(天)")
    private Long ageMin;

    /**
     * 最大年龄(天)
     */
    @Excel(name = "最大年龄(天)")
    private Long ageMax;

    /**
     * 状态
     */
    @Excel(name = "状态", dictType = "sys_normal_disable")
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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getVaccinesName() {
        return vaccinesName;
    }

    public void setVaccinesName(String vaccinesName) {
        this.vaccinesName = vaccinesName;
    }

    public String getVaccinesCode() {
        return vaccinesCode;
    }

    public void setVaccinesCode(String vaccinesCode) {
        this.vaccinesCode = vaccinesCode;
    }

    public String getVaccinationMethodCode() {
        return vaccinationMethodCode;
    }

    public void setVaccinationMethodCode(String vaccinationMethodCode) {
        this.vaccinationMethodCode = vaccinationMethodCode;
    }

    public Long getAgeMin() {
        return ageMin;
    }

    public void setAgeMin(Long ageMin) {
        this.ageMin = ageMin;
    }

    public Long getAgeMax() {
        return ageMax;
    }

    public void setAgeMax(Long ageMax) {
        this.ageMax = ageMax;
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
                .append("vaccinesName", getVaccinesName())
                .append("vaccinesCode", getVaccinesCode())
                .append("vaccinationMethodCode", getVaccinationMethodCode())
                .append("ageMin", getAgeMin())
                .append("ageMax", getAgeMax())
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
