package com.example.Assets.Repository;

import com.example.Assets.Model.Software;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SoftwareRepository extends JpaRepository<Software,String> {
    Optional<Software> findBySoftwareID(String softwareID);

    Software findTopByOrderBySoftwareNoDesc();
}


