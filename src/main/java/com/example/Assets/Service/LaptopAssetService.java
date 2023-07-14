package com.example.Assets.Service;

import com.example.Assets.Model.LaptopAsset;
import com.example.Assets.Repository.LaptopAssetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LaptopAssetService {
    @Autowired
    private LaptopAssetRepository laptopAssetRepository;

    public LaptopAsset createNewLaptopAsset(LaptopAsset laptopAsset) {
        String formattedKey = generateFormattedKey();
        laptopAsset.setLaptopNo(formattedKey);
        laptopAsset = laptopAssetRepository.save(laptopAsset);
        return laptopAsset;
    }

    private String generateFormattedKey() {
        LaptopAsset latestEntity = laptopAssetRepository.findTopByOrderByLaptopNoDesc();
        if (latestEntity == null) {
            return "L000001";
        } else {
            int lastNumericValue = Integer.parseInt(latestEntity.getLaptopNo().substring(1));
            int newNumericValue = lastNumericValue + 1;
            String formattedNumericValue = String.format("%06d", newNumericValue);
            String formattedKey = "L" + formattedNumericValue;
            return formattedKey;
        }
    }
}
