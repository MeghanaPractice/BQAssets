package com.example.Assets.Controller;

import com.example.Assets.Model.DeviceAsset;
import com.example.Assets.Repository.DeviceAssetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/deviceasset")
@CrossOrigin
public class DeviceAssetController {
    @Autowired
    private DeviceAssetRepository deviceAssetRepository;

    @PostMapping("/add")
    public String add(@RequestBody DeviceAsset deviceAsset){
        String tempID = deviceAsset.getDeviceAssetID();
        System.out.println("\n---------------\nDevice "+deviceAsset.getModelName()+" Id "+deviceAsset.getDeviceAssetID());
        deviceAsset.setDeviceAssetID(tempID);
        deviceAssetRepository.save(deviceAsset);
        return "New Device Asset is added";
    }

    @GetMapping("/getAll")
    public List<DeviceAsset> list(){
        return deviceAssetRepository.findAll();
    }

    @GetMapping("/get/{deviceAssetID}")
    public Optional<DeviceAsset> getByDeviceAssetID(@PathVariable String deviceAssetID) {
        return deviceAssetRepository.findById(deviceAssetID);
    }

    @PutMapping("/edit/{deviceAssetID}")
    public Optional<DeviceAsset> editDeviceAsset(@RequestBody DeviceAsset newDeviceAsset, @PathVariable String deviceAssetID) {
        return deviceAssetRepository.findById(deviceAssetID)
                .map(deviceAsset -> {
                    String originalID = deviceAsset.getDeviceAssetID();
                    deviceAsset.setBrand(newDeviceAsset.getBrand());
                    deviceAsset.setCodeRef2(newDeviceAsset.getCodeRef2());
                    deviceAsset.setModelName(newDeviceAsset.getModelName());
                    deviceAsset.setCategory(newDeviceAsset.getCategory());
                    deviceAsset.setPurchaseDate(newDeviceAsset.getPurchaseDate());
                    deviceAsset.setEmp_ID(newDeviceAsset.getEmp_ID());
                    deviceAsset.setTeam_IDf(newDeviceAsset.getTeam_IDf());
                    deviceAsset.setContactNo1(newDeviceAsset.getContactNo1());
                    deviceAsset.setContactNo2(newDeviceAsset.getContactNo2());
                    deviceAsset.setImeicode(newDeviceAsset.getImeicode());
                    deviceAsset.setSerialNo(newDeviceAsset.getSerialNo());
                    deviceAsset.setAccessories(newDeviceAsset.getAccessories());
                    deviceAsset.setAdditionalInfo(newDeviceAsset.getAdditionalInfo());
                    return deviceAssetRepository.save(deviceAsset);
                });
    }

    @DeleteMapping("/delete/{deviceAssetID}")
    public String deleteDeviceAsset(@PathVariable String deviceAssetID) {
        if (!deviceAssetRepository.existsById(deviceAssetID)) {
            return "No such device asset exists";
        }
        deviceAssetRepository.deleteById(deviceAssetID);
        return "Device asset with ID " + deviceAssetID + " has been deleted successfully";
    }
}


