package com.example.Assets.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name="hardware")
public class Hardware {
    @Id
    @Column(length = 7)
    private String hardwareNo;

    @Column(name = "HardwareID",unique = true)
    private String hardwareID;

    @Column(name = "HardwareName" )
    private String hardwareName;

    @Column(name = "AssignedToEmp" )
    private String assignedToEmp;

    @Column(name = "InTeamf")
    private String inTeamf;

    @Column(name = "PurchaseDate")
    private Date purchaseDate;

    @Column(name = "AdditionalInfo" )
    private String additionalInfo;



    @ManyToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "InTeamf",referencedColumnName = "TeamID",insertable = false, updatable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer"})
    private Team team;

    @ManyToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "assignedToEmp",referencedColumnName = "EmployeeID",insertable = false, updatable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer"})
    private Employee employee;


    public String getHardwareID() {
        return hardwareID;
    }

    public void setHardwareID(String hardwareID) {
        this.hardwareID = hardwareID;
    }

    public String getHardwareNo() {
        return hardwareNo;
    }

    public void setHardwareNo(String hardwareNo) {
        this.hardwareNo = hardwareNo;
    }

    public String getHardwareName() {
        return hardwareName;
    }

    public void setHardwareName(String hardwareName) {
        this.hardwareName = hardwareName;
    }

    public String getAssignedToEmp() {
        return assignedToEmp;
    }

    public void setAssignedToEmp(String assignedToEmp) {
        this.assignedToEmp = assignedToEmp;
    }

    public String getInTeamf() {
        return inTeamf;
    }

    public void setInTeamf(String inTeamf) {
        this.inTeamf = inTeamf;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }
}
