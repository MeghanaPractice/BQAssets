package com.example.Assets.Model;

import java.util.Date;
import java.util.Set;

public class SoftwareDTO {
    private String softwareNo;
    private String softwareID;
    private String softwareName;

    private String type;

    private Integer maxUsers;
    private String assignedTo;
    private String inTeam;
    private Date purchaseDate;
    private Date expirationDate;
    private String softwareKey;
    private String username;
    private String password;
    private String additionalInformation;
    private Set<LaptopAsset> assignedLaptops;

    public String getSoftwareNo() {
        return softwareNo;
    }

    public void setSoftwareNo(String softwareNo) {
        this.softwareNo = softwareNo;
    }

    public String getSoftwareID() {
        return softwareID;
    }

    public void setSoftwareID(String softwareID) {
        this.softwareID = softwareID;
    }

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }

    public String getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }

    public String getInTeam() {
        return inTeam;
    }

    public void setInTeam(String inTeam) {
        this.inTeam = inTeam;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getSoftwareKey() {
        return softwareKey;
    }

    public void setSoftwareKey(String softwareKey) {
        this.softwareKey = softwareKey;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAdditionalInformation() {
        return additionalInformation;
    }

    public void setAdditionalInformation(String additionalInformation) {
        this.additionalInformation = additionalInformation;
    }

    public Set<LaptopAsset> getAssignedLaptops() {
        return assignedLaptops;
    }

    public void setAssignedLaptops(Set<LaptopAsset> assignedLaptops) {
        this.assignedLaptops = assignedLaptops;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getMaxUsers() {
        return maxUsers;
    }

    public void setMaxUsers(Integer maxUsers) {
        this.maxUsers = maxUsers;
    }

}
