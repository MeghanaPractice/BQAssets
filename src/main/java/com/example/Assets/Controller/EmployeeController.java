package com.example.Assets.Controller;

import com.example.Assets.Model.Employee;
import com.example.Assets.Model.Team;
import com.example.Assets.Repository.EmployeeRepository;
import com.example.Assets.Repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/employee")
@CrossOrigin
public class EmployeeController {

    @Autowired
    private EmployeeRepository employeeRepository;

    @PostMapping("/add")
    public String add(@RequestBody Employee employee){
        String tempID = employee.getEmployeeID();
        System.out.println("\n---------------\nEmployee "+employee.getEmployeeName()+" Id "+employee.getEmployeeID());
        employee.setEmployeeID(tempID);
        employeeRepository.save(employee);
        return "New Employee is added";
    }

    @GetMapping("/getAll")
    public List<Employee> list(){
        return employeeRepository.findAll();
    }

    @GetMapping("/get/{employeeID}")
    public Optional<Employee> getByEmployeeID(@PathVariable String employeeID) {return employeeRepository.findById(employeeID);}

    @PutMapping("/edit/{employeeID}")
    public Optional<Employee> editEmployee(@RequestBody Employee newEmployee, @PathVariable String employeeID)
    {
        return employeeRepository.findById(employeeID)
                .map(employee -> {
                    String originalID = employee.getEmployeeID();
                    employee.setEmployeeName(newEmployee.getEmployeeName());
                    employee.setTeamIDNo(newEmployee.getTeamIDNo());
                    employee.setEmployeeID(originalID);
                    return employeeRepository.save(employee);
                });
    }

    @DeleteMapping("/delete/{employeeID}")
    String deleteEmployee(@PathVariable String employeeID)
    {
        if(!employeeRepository.existsById(employeeID)){
            return "No such team exists";
        }
        employeeRepository.deleteById(employeeID);
        return  "Employee with id "+employeeID+" has been deleted success";
    }
}
