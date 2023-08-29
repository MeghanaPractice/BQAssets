package com.example.Assets.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.util.Date;
import java.util.List;
import java.util.Set;

public class LaptopAssetDTO {

    private String laptopNo;

    private boolean inUse;

    private String brand;
    private String laptopAssetID;

    private Date purchaseDate;

    private String modelName;

    private String modelNo;

    private String serialNo;

    private String empID;

    private String teamID;

    private String screenSize;

    private String charlesID;

    private String charlesKey;

    private String msOfficeKey;

    private String msOfficeUsername;

    private String msOfficePassword;

    private String accessories;

    private String warranty;

    private String additionalItems;
    private String otherDetails;
    private Set<Software> assignedSoftwares;

    private List<String> assignedSoftwareNames;

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

    public Set<Software> getAssignedSoftwares() {
        return this.assignedSoftwares;
    }

    public boolean getInUse() {
        return this.inUse;
    }

    public void setAssignedSoftwares(Set<Software> assignedSoftwares) {
        this.assignedSoftwares = assignedSoftwares;
    }

    public List<String> getAssignedSoftwareNames() {
        return assignedSoftwareNames;
    }

    public void setAssignedSoftwareNames(List<String> assignedSoftwareNames) {
        this.assignedSoftwareNames = assignedSoftwareNames;
    }
}
