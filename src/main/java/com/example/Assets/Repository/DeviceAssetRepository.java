package com.example.Assets.Repository;

import com.example.Assets.Model.DeviceAsset;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DeviceAssetRepository extends JpaRepository<DeviceAsset,String> {
}
