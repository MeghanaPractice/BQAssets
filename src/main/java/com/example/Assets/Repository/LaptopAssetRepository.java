package com.example.Assets.Repository;

import com.example.Assets.Model.LaptopAsset;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LaptopAssetRepository extends JpaRepository<LaptopAsset,String> {
    LaptopAsset findTopByOrderByLaptopNoDesc();
    Optional<LaptopAsset> findByLaptopAssetID(String laptopAssetID);
}
