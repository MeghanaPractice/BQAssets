package com.example.Assets.Service;

import com.example.Assets.Model.Employee;
import com.example.Assets.Repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    public Employee createNewEmployee(Employee employee) {
        String formattedKey = generateFormattedKey();
        employee.setPersonID(formattedKey);
        employee = employeeRepository.save(employee);
        return employee;
    }

    private String generateFormattedKey() {
        Employee latestEntity = employeeRepository.findTopByOrderByPersonIDDesc();
        if (latestEntity == null) {
            return "B000001";
        } else {
            int lastNumericValue = Integer.parseInt(latestEntity.getPersonID().substring(1));
            int newNumericValue = lastNumericValue + 1;
            String formattedNumericValue = String.format("%06d", newNumericValue);
            String formattedKey = "B" + formattedNumericValue;
            return formattedKey;
        }
    }
}

