package com.example.Assets.Controller;

import com.example.Assets.Model.DeviceAsset;
import com.example.Assets.Repository.DeviceAssetRepository;
import com.example.Assets.Service.DeviceAssetService;
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

    @Autowired
    private DeviceAssetService deviceAssetService;

     @PostMapping("/add")
    public String add(@RequestBody DeviceAsset deviceAsset){
        String tempID = deviceAsset.getDeviceAssetID();
        System.out.println("\n---------------\nDevice "+deviceAsset.getModelName()+" Id "+deviceAsset.getDeviceAssetID());
        deviceAssetService.createNewDeviceAsset(deviceAsset);
        return "New Device Asset is added";
    }

    @GetMapping("/getAll")
    public List<DeviceAsset> list(){
        return deviceAssetRepository.findAll();
    }

    @GetMapping("/get/{deviceAssetID}")
    public Optional<DeviceAsset> getByDeviceAssetID(@PathVariable String deviceAssetID) {
        return deviceAssetRepository.findByDeviceAssetID(deviceAssetID);
    }

    @PutMapping("/edit/{deviceNo}")
    public Optional<DeviceAsset> editDeviceAsset(@RequestBody DeviceAsset newDeviceAsset, @PathVariable String deviceNo) {
        return deviceAssetRepository.findById(deviceNo)
                .map(deviceAsset -> {
                    String originalID = deviceAsset.getDeviceAssetID();
                    deviceAsset.setDeviceAssetID(newDeviceAsset.getDeviceAssetID());
                    deviceAsset.setBrand(newDeviceAsset.getBrand());
                    deviceAsset.setInUse(newDeviceAsset.isInUse());
                    deviceAsset.setCodeRef2(newDeviceAsset.getCodeRef2());
                    deviceAsset.setModelName(newDeviceAsset.getModelName());
                    deviceAsset.setCategory(newDeviceAsset.getCategory());
                    deviceAsset.setPurchaseDate(newDeviceAsset.getPurchaseDate());
                    deviceAsset.setEmp_ID(newDeviceAsset.getEmp_ID());
                    deviceAsset.setTeam_IDf(newDeviceAsset.getTeam_IDf());
                    deviceAsset.setImeicode(newDeviceAsset.getImeicode());
                    deviceAsset.setSerialNo(newDeviceAsset.getSerialNo());
                    deviceAsset.setAccessories(newDeviceAsset.getAccessories());
                    deviceAsset.setAdditionalInfo(newDeviceAsset.getAdditionalInfo());
                    return deviceAssetRepository.save(deviceAsset);
                });
    }

    @DeleteMapping("/delete/{deviceNo}")
    public String deleteDeviceAsset(@PathVariable String deviceNo) {
        if (!deviceAssetRepository.existsById(deviceNo)) {
            return "No such device asset exists";
        }
        deviceAssetRepository.deleteById(deviceNo);
        return "Device asset with ID " + deviceNo + " has been deleted successfully";
    }
}


