package com.example.Assets.Model;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="team")
public class Team {


    @Id
    @Column(name = "TeamID",nullable = false)
    private String teamID;
    @Column(name = "TeamName",nullable = true)
    private String teamName;


    @OneToMany(mappedBy = "team")
    private List<Employee> employees;

    @OneToMany(mappedBy = "team")
    private List<LaptopAsset> laptops;

    @OneToMany(mappedBy = "team")
    private List<DeviceAsset> devices;

    public Team() {}

    public String getTeamID() {
        return teamID;
    }

    public void setTeamID(String teamID) {
        this.teamID = teamID;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }
}
