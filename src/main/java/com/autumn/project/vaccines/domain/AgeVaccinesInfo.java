package com.autumn.project.vaccines.domain;

import com.autumn.framework.aspectj.lang.annotation.Excel;
import com.autumn.framework.web.domain.BaseEntity;

/**
 * 各年龄段需打疫苗信息对象 age_vaccines_info
 *
 * @author autumn
 * @date 2024-01-26
 */
public class AgeVaccinesInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long id;

    /**
     * 年龄(岁)
     */
    @Excel(name = "年龄(岁)")
    private String age;

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
     * 疫苗名称列表
     */
    @Excel(name = "疫苗名称列表")
    private String vaccinesCodes;

    /**
     * 注意事项
     */
    @Excel(name = "注意事项")
    private String takeCare;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private String state;

    /**
     * 扩展字段1
     */
    @Excel(name = "扩展字段1")
    private String[] ext1;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
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

    public String getVaccinesCodes() {
        return vaccinesCodes;
    }

    public void setVaccinesCodes(String vaccinesCodes) {
        this.vaccinesCodes = vaccinesCodes;
    }

    public String getTakeCare() {
        return takeCare;
    }

    public void setTakeCare(String takeCare) {
        this.takeCare = takeCare;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String[] getExt1() {
        return ext1;
    }

    public void setExt1(String[] ext1) {
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
}
