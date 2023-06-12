package com.example.Assets.Repository;

import com.example.Assets.Model.LaptopAsset;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LaptopAssetRepository extends JpaRepository<LaptopAsset,String> {
}
