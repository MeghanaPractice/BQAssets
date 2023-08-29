package com.example.Assets.Model;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name="history")
public class History {
    @Id
    @Column
    private Integer id;

    @Column(name = "TableName",nullable = false)
    private String tablename;

    @Column(name = "Change_type",nullable = false)
    private String changetype;

    @Column(name = "Changes",nullable = false)
    private String changes;

    @Column(name="ChangedBy")
    private String changedBy;

    @Column(name="Role")
    private String role;

    @Column(name="Time")
    private Timestamp time;

    public Integer getId() {
        return id;
    }

    public String getTablename() {
        return tablename;
    }


    public String getChanges() {
        return changes;
    }

    public String getChangedBy() {
        return changedBy;
    }

    public void setChangedBy(String changedBy) {
        this.changedBy = changedBy;
    }

    public Timestamp getTime() {
        return time;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getChangetype() {
        return changetype;
    }
}
