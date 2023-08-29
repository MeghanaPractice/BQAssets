package com.example.Assets.Repository;

import com.example.Assets.Model.Hardware;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface HardwareRepository extends JpaRepository<Hardware,String> {

    Optional<Hardware> findByHardwareID(String hardwareID);

    Hardware findTopByOrderByHardwareNoDesc();
}
