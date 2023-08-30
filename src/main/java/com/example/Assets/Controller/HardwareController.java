package com.example.Assets.Controller;

import com.example.Assets.Model.Hardware;
import com.example.Assets.Repository.EmployeeRepository;
import com.example.Assets.Repository.HardwareRepository;
import com.example.Assets.Service.HardwareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/hardware")
@CrossOrigin
public class HardwareController {

    @Autowired
    private HardwareRepository hardwareRepository;

    @Autowired
    private HardwareService hardwareService;

    @Autowired
    private EmployeeRepository employeeRepository;

    @PostMapping("/add")
    public String add(@RequestBody Hardware hardware){
        String tempID = hardware.getHardwareID();
        System.out.println("\n---------------\nHardware "+hardware.getHardwareName()+" Id "+hardware.getHardwareID());
        hardwareService.createNewHardware(hardware);
        return "New Hardware is added";
    }

    @GetMapping("/getAll")
    public List<Hardware> list(){
        return hardwareRepository.findAll();
    }

    @GetMapping("/get/{hardwareID}")
    public Optional<Hardware> getByHardwareID(@PathVariable String hardwareID) {
        return hardwareRepository.findByHardwareID(hardwareID);
    }

    @PutMapping("/edit/{hardwareNo}")
    public Optional<Hardware> editHardware(@RequestBody Hardware newHardware, @PathVariable String hardwareNo) {
        if((newHardware.getInTeamf()==null)|| (employeeRepository.findByEmployeeID(newHardware.getAssignedToEmp()).getTeamIDNo().equals(newHardware.getInTeamf()))) {
            return hardwareRepository.findById(hardwareNo)
                    .map(hardware -> {
                        String originalID = hardware.getHardwareID();
                        hardware.setHardwareID(originalID);
                        hardware.setHardwareName(newHardware.getHardwareName());
                        hardware.setPurchaseDate(newHardware.getPurchaseDate());
                        hardware.setAssignedToEmp(newHardware.getAssignedToEmp());
                        hardware.setInTeamf(newHardware.getInTeamf());
                        hardware.setAdditionalInfo(newHardware.getAdditionalInfo());
                        return hardwareRepository.save(hardware);
                    });
        }
        else
        {
            System.out.println("Employee not in that team");
            return null;
        }
    }

    @DeleteMapping("/delete/{hardwareNo}")
    String deleteHardware(@PathVariable String hardwareNo) {
        if (!hardwareRepository.existsById(hardwareNo)) {
            return "No such laptop asset exists";
        }
        hardwareRepository.deleteById(hardwareNo);
        return "Laptop asset with ID " + hardwareNo + " has been deleted successfully";
    }

}

