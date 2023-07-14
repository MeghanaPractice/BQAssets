package com.example.Assets.Service;

import com.example.Assets.Model.DeviceAsset;
import com.example.Assets.Repository.DeviceAssetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeviceAssetService {
    @Autowired
    private DeviceAssetRepository deviceAssetRepository;
    public DeviceAsset createNewDeviceAsset(DeviceAsset deviceAsset) {
        String formattedKey = generateFormattedKey();
        deviceAsset.setDeviceNo(formattedKey);
        deviceAsset = deviceAssetRepository.save(deviceAsset);
        return deviceAsset;
    }

    private String generateFormattedKey() {
        DeviceAsset latestEntity = deviceAssetRepository.findTopByOrderByDeviceNoDesc();
        if (latestEntity == null) {
            return "D000001";
        } else {
            int lastNumericValue = Integer.parseInt(latestEntity.getDeviceNo().substring(1));
            int newNumericValue = lastNumericValue + 1;
            String formattedNumericValue = String.format("%06d", newNumericValue);
            String formattedKey = "D" + formattedNumericValue;
            return formattedKey;
        }
    }
}
