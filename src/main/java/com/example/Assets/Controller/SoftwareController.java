package com.example.Assets.Controller;

import com.example.Assets.Model.LaptopAsset;
import com.example.Assets.Model.Software;
import com.example.Assets.Repository.EmployeeRepository;
import com.example.Assets.Repository.LaptopAssetRepository;
import com.example.Assets.Repository.SoftwareRepository;
import com.example.Assets.Service.SoftwareService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/software")
@CrossOrigin
public class SoftwareController {

    @Autowired
    private SoftwareRepository softwareRepository;

    @Autowired
    private SoftwareService softwareService;

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private LaptopAssetRepository laptopAssetRepository;

    @PostMapping("/add")
    public String add(@RequestBody Software software){
        String tempID = software.getSoftwareID();
        System.out.println("\n---------------\nSoftware "+software.getSoftwareName()+" Id "+software.getSoftwareID());
        softwareService.createNewSoftware(software);
        return "New Laptop Asset is added";
    }

    @GetMapping("/getAll")
    public List<Software> list(){
        return softwareRepository.findAll();
    }

    @GetMapping("/get/{softwareID}")
    public Optional<Software> getBySoftwareID(@PathVariable String softwareID) {
        return softwareRepository.findBySoftwareID(softwareID);
    }

    @Transactional
    @PutMapping("/assign/{softwareID}/{laptopAssetID}")
    public String assignLaptopToSoftware(@PathVariable String softwareID,@PathVariable String laptopAssetID)
    {
         Software software = softwareRepository.findBySoftwareID(softwareID).orElse(null);
         LaptopAsset laptopAsset = laptopAssetRepository.findByLaptopAssetID(laptopAssetID).orElse(null);
         if(laptopAsset!=null && software!=null)
         {
             int allow = software.getMaxUsers() - software.getAssignedLaptops().size();
             if(allow>0)
             {
              software.getAssignedLaptops().add(laptopAsset);
              laptopAsset.getAssignedSoftwares().add(software);
              return "assigned";
             }
             else
                 return "Max number of users assigned exceeded";
         }
         return  "Error in assignment";
    }


    @Transactional
    @PutMapping("/deassign/{softwareID}/{laptopAssetID}")
    public String deassignLaptopToSoftware(@PathVariable String softwareID,@PathVariable String laptopAssetID)
    {
        Software software = softwareRepository.findBySoftwareID(softwareID).orElse(null);
        LaptopAsset laptopAsset = laptopAssetRepository.findByLaptopAssetID(laptopAssetID).orElse(null);
        if(laptopAsset!=null && software!=null)
        {
            software.getAssignedLaptops().remove(laptopAsset);
            laptopAsset.getAssignedSoftwares().remove(software);
            return "Deassigned";
        }
        return  "Error in assignment";
    }



    @PutMapping("/edit/{softwareNo}")
    public Optional<Software> editSoftware(@RequestBody Software newSoftware, @PathVariable String softwareNo) {

            return softwareRepository.findById(softwareNo)
                    .map(Software -> {
                        String originalID = Software.getSoftwareID();
                        Software.setSoftwareID(newSoftware.getSoftwareID());
                        Software.setSoftwareName(newSoftware.getSoftwareName());
                        Software.setType(newSoftware.getType());
                        Software.setMaxUsers(newSoftware.getMaxUsers());
                        Software.setPurchaseDate(newSoftware.getPurchaseDate());
                        Software.setExpirationDate(newSoftware.getExpirationDate());
                        Software.setAssignedTo(newSoftware.getAssignedTo());
                        Software.setInTeam(newSoftware.getInTeam());
                        Software.setSoftwareKey(newSoftware.getSoftwareKey());
                        Software.setUsername(newSoftware.getUsername());
                        Software.setPassword(newSoftware.getPassword());
                        Software.setAdditionalInformation(newSoftware.getAdditionalInformation());
                        return softwareRepository.save(Software);
                    });
    }

    @DeleteMapping("/delete/{softwareNo}")
    String deleteSoftware(@PathVariable String softwareNo) {
        if (!softwareRepository.existsById(softwareNo)) {
            return "No such laptop asset exists";
        }
        softwareRepository.deleteById(softwareNo);
        return "Laptop asset with ID " + softwareNo + " has been deleted successfully";
    }

}

