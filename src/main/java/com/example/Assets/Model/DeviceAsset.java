package com.example.Assets.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "deviceasset")
public class DeviceAsset {

    @Id
    @Column(length = 7)
    private String deviceNo;

    @Column(name = "DeviceAssetID",unique = true)
    private String deviceAssetID;

    @Column(name = "inUse")
    private boolean inUse;
    @Column(name = "Brand")
    private String brand;
    @Column(name = "CodeRef2")
    private  String codeRef2;
    @Column(name = "ModelName")
    private  String modelName;
    @Column(name = "Category")
    private  String category;
    @Column(name = "PurchaseDate")
    private Date purchaseDate;

    @Column(name = "Team_IDf")
    private String team_IDf;

    @Column(name = "Emp_ID")
    private String emp_ID;
    @Column(name = "IMEICode")
    private  String imeicode;
    @Column(name = "SerialNo")
    private  String serialNo;
    @Column(name="Accessories")
    private  String accessories;
    @Column(name = "AdditionalInfo")
    private  String additionalInfo;

    @ManyToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "Team_IDf",referencedColumnName = "TeamID",insertable = false, updatable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer"})
    private Team team;

    @ManyToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "Emp_ID",referencedColumnName = "EmployeeID",insertable = false, updatable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer"})
    private Employee employee;

    public  DeviceAsset(){}

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getDeviceAssetID() {
        return deviceAssetID;
    }

    public void setDeviceAssetID(String deviceAssetID) {
        this.deviceAssetID = deviceAssetID;
    }

    public String getCodeRef2() {
        return codeRef2;
    }

    public void setCodeRef2(String codeRef2) {
        this.codeRef2 = codeRef2;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImeicode() {
        return imeicode;
    }

    public void setImeicode(String imeicode) {
        this.imeicode = imeicode;
    }

    public String getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(String serialNo) {
        this.serialNo = serialNo;
    }

    public String getAccessories() {
        return accessories;
    }

    public void setAccessories(String accessories) {
        this.accessories = accessories;
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getTeam_IDf() {
        return team_IDf;
    }

    public void setTeam_IDf(String team_IDf) {
        this.team_IDf = team_IDf;
    }

    public String getEmp_ID() {
        return emp_ID;
    }

    public void setEmp_ID(String emp_ID) {
        this.emp_ID = emp_ID;
    }

    public String getDeviceNo() {
        return deviceNo;
    }

    public void setDeviceNo(String deviceNo) {
        this.deviceNo = deviceNo;
    }

    public boolean isInUse() {
        return inUse;
    }

    public void setInUse(boolean inUse) {
        this.inUse = inUse;
    }
}
