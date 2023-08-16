package com.example.Assets.Controller;

import com.example.Assets.Model.DeviceAsset;
import com.example.Assets.Model.Employee;
import com.example.Assets.Model.LaptopAsset;
import com.example.Assets.Repository.EmployeeRepository;
import com.example.Assets.Service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/employee")
@CrossOrigin
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private  EmployeeRepository employeeRepository;
    @PostMapping("/add")
    public String add(@RequestBody Employee employee){
        String tempID = employee.getEmployeeID();
        System.out.println("\n---------------\nEmployee "+employee.getEmployeeName()+" Id "+employee.getEmployeeID());
        employeeService.createNewEmployee(employee);
        return "New Employee is added";
    }

    @GetMapping("/getAll")
    public List<Employee> list(){
        return employeeRepository.findAll();
    }

    @GetMapping("/get/{employeeID}")
    public Optional<Employee> getByEmployeeID(@PathVariable String employeeID) {return Optional.ofNullable(employeeRepository.findByEmployeeID(employeeID));}

    @GetMapping("/getFrom/{teamIDNo}")
    public List<Employee> getByTeamIDNo(@PathVariable String teamIDNo) {
        return employeeRepository.findByTeamIDNo(teamIDNo);
    }

    @PutMapping("/edit/{personID}")
    public Optional<Employee> editEmployee(@RequestBody Employee newEmployee, @PathVariable String personID)
    {
        return employeeRepository.findById(personID)
                .map(employee -> {
                    employee.setEmployeeName(newEmployee.getEmployeeName());
                    employee.setTeamIDNo(newEmployee.getTeamIDNo());
                    employee.setEmployeeID(newEmployee.getEmployeeID());
                    employee.setDesignation(newEmployee.getDesignation());
                    employee.setContactNo(newEmployee.getContactNo());
                    employee.setEmail(newEmployee.getEmail());
                    return employeeRepository.save(employee);
                });
    }

    @GetMapping("getdevices/{employeeID}")
    public List<DeviceAsset> getAssignedDevices(@PathVariable String employeeID)
    {
        Employee employee = employeeRepository.findByEmployeeID(employeeID);
        if (employee != null && employee.getDevices()!=null) {
            return employee.getDevices();
        } else {
            return Collections.emptyList();
        }
    }
    @GetMapping("getlaptops/{employeeID}")
    public List<LaptopAsset> getAssignedLaptops(@PathVariable String employeeID)
    {
        Employee employee = employeeRepository.findByEmployeeID(employeeID);
        if (employee != null && employee.getLaptops()!=null) {
            return employee.getLaptops();
        } else {
            return Collections.emptyList();
        }
    }
    @DeleteMapping("/delete/{personID}")
    String deleteEmployee(@PathVariable String personID)
    {
        if(!employeeRepository.existsById(personID)){
            return "No such team exists";
        }
        employeeRepository.deleteById(personID);
        return  "Employee with id "+personID+" has been deleted success";
    }
}
