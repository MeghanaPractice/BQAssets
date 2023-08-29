package com.example.Assets.Service;

import com.example.Assets.Model.Software;
import com.example.Assets.Repository.LaptopAssetRepository;
import com.example.Assets.Repository.SoftwareRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SoftwareService {
    @Autowired
    private SoftwareRepository softwareRepository;

    public Software createNewSoftware(Software software) {
        String formattedKey = generateFormattedKey();
        software.setSoftwareNo(formattedKey);
        software = softwareRepository.save(software);
        return software;
    }

    private String generateFormattedKey() {
        Software latestEntity = softwareRepository.findTopByOrderBySoftwareNoDesc();
        if (latestEntity == null) {
            return "S000001";
        } else {
            int lastNumericValue = Integer.parseInt(latestEntity.getSoftwareNo().substring(1));
            int newNumericValue = lastNumericValue + 1;
            String formattedNumericValue = String.format("%06d", newNumericValue);
            String formattedKey = "S" + formattedNumericValue;
            return formattedKey;
        }
    }
}

