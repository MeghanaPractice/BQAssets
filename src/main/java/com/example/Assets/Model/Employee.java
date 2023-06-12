package com.example.Assets.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "employee")
public class Employee {

    @Id
    @Column(name = "EmployeeID")
    private String employeeID;
    @Column(name = "EmployeeName")
    private String employeeName;

    @Column(name = "TeamIDNo")
    private String teamIDNo;

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
}
