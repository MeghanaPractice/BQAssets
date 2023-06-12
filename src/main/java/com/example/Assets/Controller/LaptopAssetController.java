package com.example.Assets.Controller;

import com.example.Assets.Model.LaptopAsset;
import com.example.Assets.Repository.LaptopAssetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/laptopasset")
@CrossOrigin
public class LaptopAssetController {

    @Autowired
    private LaptopAssetRepository laptopAssetRepository;


    @PostMapping("/add")
    public String add(@RequestBody LaptopAsset laptopAsset){
        String tempID = laptopAsset.getLaptopAssetID();
        System.out.println("\n---------------\nLaptop "+laptopAsset.getModelName()+" Id "+laptopAsset.getLaptopAssetID());
        laptopAsset.setLaptopAssetID(tempID);
        laptopAssetRepository.save(laptopAsset);
        return "New Laptop Asset is added";
    }

    @GetMapping("/getAll")
    public List<LaptopAsset> list(){
        return laptopAssetRepository.findAll();
    }

    @GetMapping("/get/{laptopAssetID}")
    public Optional<LaptopAsset> getByLaptopAssetID(@PathVariable String laptopAssetID) {
        return laptopAssetRepository.findById(laptopAssetID);
    }

    @PutMapping("/edit/{laptopAssetID}")
    public Optional<LaptopAsset> editLaptopAsset(@RequestBody LaptopAsset newLaptopAsset, @PathVariable String laptopAssetID) {
        return laptopAssetRepository.findById(laptopAssetID)
                .map(laptopAsset -> {
                    String originalID = laptopAsset.getLaptopAssetID();
                    laptopAsset.setBrand(newLaptopAsset.getBrand());
                    laptopAsset.setPurchaseDate(newLaptopAsset.getPurchaseDate());
                    laptopAsset.setModelName(newLaptopAsset.getModelName());
                    laptopAsset.setModelNo(newLaptopAsset.getModelNo());
                    laptopAsset.setSerialNo(newLaptopAsset.getSerialNo());
                    laptopAsset.setEmpID(newLaptopAsset.getEmpID());
                    laptopAsset.setTeam_ID(newLaptopAsset.getTeam_ID());
                    laptopAsset.setScreenSize(newLaptopAsset.getScreenSize());
                    laptopAsset.setCharlesID(newLaptopAsset.getCharlesID());
                    laptopAsset.setCharlesKey(newLaptopAsset.getCharlesKey());
                    laptopAsset.setMSOfficeKey(newLaptopAsset.getMSOfficeKey());
                    laptopAsset.setMSOfficeUsername(newLaptopAsset.getMSOfficeUsername());
                    laptopAsset.setMSOfficePassword(newLaptopAsset.getMSOfficePassword());
                    laptopAsset.setWLANMac(newLaptopAsset.getWLANMac());
                    laptopAsset.setEthernetMAC(newLaptopAsset.getEthernetMAC());
                    laptopAsset.setAccessories(newLaptopAsset.getAccessories());
                    laptopAsset.setWarranty(newLaptopAsset.getWarranty());
                    laptopAsset.setAdditionalItems(newLaptopAsset.getAdditionalItems());
                    laptopAsset.setOtherDetails(newLaptopAsset.getOtherDetails());
                    return laptopAssetRepository.save(laptopAsset);
                });
    }

    @DeleteMapping("/delete/{laptopAssetID}")
    String deleteLaptopAsset(@PathVariable String laptopAssetID) {
        if (!laptopAssetRepository.existsById(laptopAssetID)) {
            return "No such laptop asset exists";
        }
        laptopAssetRepository.deleteById(laptopAssetID);
        return "Laptop asset with ID " + laptopAssetID + " has been deleted successfully";
    }

}
