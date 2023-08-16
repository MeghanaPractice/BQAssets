package com.example.Assets.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name="laptopasset")
public class LaptopAsset {

    @Id
    @Column(length = 7)
    private String laptopNo;

    @Column(name = "inUse")
    private boolean inUse;
    @Column(name = "Brand")
    private String brand;
    @Column(name = "LaptopAssetID",unique = true)
    private String laptopAssetID;

    @Column(name="PurchaseDate",nullable = true)
    private Date purchaseDate;

    @Column(name = "ModelName")
    private String modelName;

    @Column(name = "ModelNo")
    private String modelNo;

    @Column(name = "SerialNo")
    private String serialNo;

    @Column(name = "EmpID")
    private String empID;

    @Column(name = "Team_ID",unique = true)
    private String teamID;

    @Column(name = "ScreenSize")
    private String screenSize;

    @Column(name = "CharlesID")
    private String charlesID;

    @Column(name = "CharlesKey")
    private String charlesKey;

    @Column(name = "MSOfficeKey")
    private String msOfficeKey;

    @Column(name = "MSOfficeUsername")
    private String msOfficeUsername;

    @Column(name = "MSOfficePassword")
    private String msOfficePassword;

    @Column(name = "Accessories")
    private String accessories;

    @Column(name = "Warranty")
    private String warranty;

    @Column(name = "AdditionalItems")
    private String additionalItems;

    @Column(name = "OtherDetails")
    private String otherDetails;


    @ManyToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "Team_ID",referencedColumnName = "TeamID",insertable = false, updatable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer"})
    private Team team;

    @ManyToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "EmpID",referencedColumnName = "EmployeeID",insertable = false, updatable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer"})
    private Employee employee;

    public LaptopAsset(){}

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getLaptopAssetID() {
        return laptopAssetID;
    }

    public void setLaptopAssetID(String laptopAssetID) {
        this.laptopAssetID = laptopAssetID;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getModelNo() {
        return modelNo;
    }

    public void setModelNo(String modelNo) {
        this.modelNo = modelNo;
    }

    public String getSerialNo() {
        return serialNo;
    }

    public void setSerialNo(String serialNo) {
        this.serialNo = serialNo;
    }

    public String getScreenSize() {
        return screenSize;
    }

    public void setScreenSize(String screenSize) {
        this.screenSize = screenSize;
    }

    public String getCharlesID() {
        return charlesID;
    }

    public void setCharlesID(String charlesID) {
        this.charlesID = charlesID;
    }

    public String getCharlesKey() {
        return charlesKey;
    }

    public void setCharlesKey(String charlesKey) {
        this.charlesKey = charlesKey;
    }

    public String getMSOfficeKey() {
        return msOfficeKey;
    }

    public void setMSOfficeKey(String MSOfficeKey) {
        this.msOfficeKey = MSOfficeKey;
    }

    public String getMSOfficeUsername() {
        return msOfficeUsername;
    }

    public void setMSOfficeUsername(String MSOfficeUsername) {
        this.msOfficeUsername = MSOfficeUsername;
    }

    public String getMSOfficePassword() {
        return msOfficePassword;
    }

    public void setMSOfficePassword(String MSOfficePassword) {
        this.msOfficePassword = MSOfficePassword;
    }

    public String getAccessories() {
        return accessories;
    }

    public void setAccessories(String accessories) {
        this.accessories = accessories;
    }

    public String getWarranty() {
        return warranty;
    }

    public void setWarranty(String warranty) {
        this.warranty = warranty;
    }

    public String getAdditionalItems() {
        return this.additionalItems;
    }

    public void setAdditionalItems(String additionalItems) {
        this.additionalItems = additionalItems;
    }

    public String getOtherDetails() {
        return otherDetails;
    }

    public void setOtherDetails(String otherDetails) {
        this.otherDetails = otherDetails;
    }

    public String getEmpID() {
        return empID;
    }

    public void setEmpID(String empID) {
        this.empID = empID;
    }

    public String getTeam_ID() {
        return teamID;
    }

    public void setTeam_ID(String teamID) {
        this.teamID = teamID;
    }

    public String getLaptopNo() {
        return laptopNo;
    }

    public void setLaptopNo(String laptopNo) {
        this.laptopNo = laptopNo;
    }

    public boolean isInUse() {
        return inUse;
    }

    public void setInUse(boolean inUse) {
        this.inUse = inUse;
    }
}
