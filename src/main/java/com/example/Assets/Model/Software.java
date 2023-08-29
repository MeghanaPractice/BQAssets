package com.example.Assets.Model;

import com.example.Assets.Service.SoftwareSerializer;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import jakarta.persistence.*;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="software")
@JsonSerialize(using = SoftwareSerializer.class)
public class Software {
    @Id
    @Column(length = 7)
    private String softwareNo;

    @Column(name = "SoftwareID",unique = true)
    private String softwareID;

    @Column(name = "SoftwareName" )
    private String softwareName;

    @Column(name="Type")
    private String type;

    @Column(name="MaxUsers")
    private Integer maxUsers;

    @Column(name = "AssignedTo" )
    private String assignedTo;

    @Column(name = "InTeam")
    private String inTeam;

    @Column(name = "PurchaseDate")
    private Date purchaseDate;

    @Column(name = "ExpirationDate")
    private Date expirationDate;

    @Column(name = "SoftwareKey" )
    private String softwareKey;

    @Column(name = "Username" )
    private String username;

    @Column(name = "Password" )
    private String password;

    @Column(name = "AdditionalInformation" )
    private String additionalInformation;



    @ManyToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "InTeam",referencedColumnName = "TeamID",insertable = false, updatable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer"})
    private Team team;

    @ManyToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "assignedTo",referencedColumnName = "EmployeeID",insertable = false, updatable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer"})
    private Employee employee;

    @ManyToMany
    @JoinTable(
            name = "assign_laptop",
            joinColumns = @JoinColumn(name = "software_softwareNo"),
            inverseJoinColumns = @JoinColumn(name = "laptopAsset_laptopNo"))
    @JsonIgnore
    private Set<LaptopAsset> assignedLaptops;

    public Software() {}

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

    public Set<LaptopAsset> getAssignedLaptops() {
        return this.assignedLaptops;
    }

    public  void setAssignedLaptops(Set<LaptopAsset> assignedLaptops) {this.assignedLaptops = assignedLaptops;}

}
