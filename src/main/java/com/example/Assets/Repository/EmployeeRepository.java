package com.example.Assets.Repository;

import com.example.Assets.Model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee,String> {
    @Query("SELECT e FROM Employee e WHERE e.teamIDNo = :teamIDNo")
    List<Employee> findByTeamIDNo(@Param("teamIDNo") String teamIDNo);
    Employee findTopByOrderByPersonIDDesc();
    Optional<Employee> findByEmployeeID(String employeeID);

}
