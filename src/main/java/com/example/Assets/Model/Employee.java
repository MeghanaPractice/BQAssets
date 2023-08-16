package com.example.Assets.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "employee")
public class Employee {

    @Id
    @Column(length = 7)
    private String personID;
    @Column(name = "EmployeeID",unique = true)
    private String employeeID;
    @Column(name = "EmployeeName")
    private String employeeName;
    @Column(name = "TeamIDNo")
    private String teamIDNo;

    @Column(name = "Designation")
    private String designation;

    @Column(name = "ContactNo")
    private String contactNo;

    @Column(name = "Email")
    private String email;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TeamIDNo", referencedColumnName = "TeamID", insertable = false, updatable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer"})
    private Team team;

    @OneToMany(mappedBy = "employee")
    private List<LaptopAsset> laptops;

    @OneToMany(mappedBy = "employee")
    private List<DeviceAsset> devices;

    public Employee()
    {

    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public Team getTeam() {
        return this.team;
    }

    public String getTeamIDNo() {
        return teamIDNo;
    }

    public void setTeamIDNo(String teamIDNo) {
        this.teamIDNo = teamIDNo;
    }

    public String getPersonID() {
        return personID;
    }

    public void setPersonID(String personID) {
        this.personID = personID;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<DeviceAsset> getDevices() {
        return devices;
    }

    public void setDevices(List<DeviceAsset> devices) {
        this.devices = devices;
    }

    public List<LaptopAsset> getLaptops() {
        return laptops;
    }

    public void setLaptops(List<LaptopAsset> laptops) {
        this.laptops = laptops;
    }
}
