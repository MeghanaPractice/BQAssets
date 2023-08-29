package com.example.Assets.Service;

import com.example.Assets.Model.Hardware;
import com.example.Assets.Repository.HardwareRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HardwareService {
    @Autowired
    private HardwareRepository hardwareRepository;

    public Hardware createNewHardware(Hardware hardware) {
        String formattedKey = generateFormattedKey();
        hardware.setHardwareNo(formattedKey);
        hardware = hardwareRepository.save(hardware);
        return hardware;
    }

    private String generateFormattedKey() {
        Hardware latestEntity = hardwareRepository.findTopByOrderByHardwareNoDesc();
        if (latestEntity == null) {
            return "H000001";
        } else {
            int lastNumericValue = Integer.parseInt(latestEntity.getHardwareNo().substring(1));
            int newNumericValue = lastNumericValue + 1;
            String formattedNumericValue = String.format("%06d", newNumericValue);
            String formattedKey = "H" + formattedNumericValue;
            return formattedKey;
        }
    }
}