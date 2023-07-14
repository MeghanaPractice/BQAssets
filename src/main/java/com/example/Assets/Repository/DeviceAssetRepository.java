package com.example.Assets.Repository;

import com.example.Assets.Model.DeviceAsset;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DeviceAssetRepository extends JpaRepository<DeviceAsset,String> {
    DeviceAsset findTopByOrderByDeviceNoDesc();

    Optional<DeviceAsset> findByDeviceAssetID(String deviceAssetID);
}
