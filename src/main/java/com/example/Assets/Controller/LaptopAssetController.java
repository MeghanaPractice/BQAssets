package com.example.Assets.Controller;

import com.example.Assets.Model.LaptopAsset;
import com.example.Assets.Model.Software;
import com.example.Assets.Repository.EmployeeRepository;
import com.example.Assets.Repository.LaptopAssetRepository;
import com.example.Assets.Service.LaptopAssetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("/laptopasset")
@CrossOrigin
public class LaptopAssetController {

    @Autowired
    private LaptopAssetRepository laptopAssetRepository;

    @Autowired
    private LaptopAssetService laptopAssetService;

    @Autowired
    private EmployeeRepository employeeRepository;

    @PostMapping("/add")
    public String add(@RequestBody LaptopAsset laptopAsset){
        String tempID = laptopAsset.getLaptopAssetID();
        System.out.println("\n---------------\nLaptop "+laptopAsset.getModelName()+" Id "+laptopAsset.getLaptopAssetID());
        laptopAssetService.createNewLaptopAsset(laptopAsset);
        return "New Laptop Asset is added";
    }

    @GetMapping("/getAll")
    public List<LaptopAsset> list(){
        return laptopAssetRepository.findAll();
    }

    @GetMapping("/get/{laptopAssetID}")
    public Optional<LaptopAsset> getByLaptopAssetID(@PathVariable String laptopAssetID) {
        return laptopAssetRepository.findByLaptopAssetID(laptopAssetID);
    }

    @GetMapping("/getassigned/{laptopAssetID}")
    public Optional<Set<Software>> getBySoftwareLaptopAssetID(@PathVariable String laptopAssetID) {
        LaptopAsset laptopAsset = laptopAssetRepository.findByLaptopAssetID(laptopAssetID).orElse(null);
        if(laptopAsset!=null){
        Set<Software> software = laptopAsset.getAssignedSoftwares();
        return Optional.ofNullable(software);
        }
        return null;
    }

    @PutMapping("/edit/{laptopNo}")
    public Optional<LaptopAsset> editLaptopAsset(@RequestBody LaptopAsset newLaptopAsset, @PathVariable String laptopNo) {
        if((newLaptopAsset.getTeam_ID()==null)||(employeeRepository.findByEmployeeID(newLaptopAsset.getEmpID()).getTeamIDNo().equals(newLaptopAsset.getTeam_ID()))) {
            return laptopAssetRepository.findById(laptopNo)
                    .map(laptopAsset -> {
                        String originalID = laptopAsset.getLaptopAssetID();
                        laptopAsset.setLaptopAssetID(newLaptopAsset.getLaptopAssetID());
                        laptopAsset.setBrand(newLaptopAsset.getBrand());
                        laptopAsset.setInUse(newLaptopAsset.isInUse());
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
                        laptopAsset.setAccessories(newLaptopAsset.getAccessories());
                        laptopAsset.setWarranty(newLaptopAsset.getWarranty());
                        laptopAsset.setAdditionalItems(newLaptopAsset.getAdditionalItems());
                        laptopAsset.setOtherDetails(newLaptopAsset.getOtherDetails());
                        return laptopAssetRepository.save(laptopAsset);
                    });}
        return null;
    }

    @DeleteMapping("/delete/{laptopNo}")
    String deleteLaptopAsset(@PathVariable String laptopNo) {
        if (!laptopAssetRepository.existsById(laptopNo)) {
            return "No such laptop asset exists";
        }
        laptopAssetRepository.deleteById(laptopNo);
        return "Laptop asset with ID " + laptopNo + " has been deleted successfully";
    }

}
