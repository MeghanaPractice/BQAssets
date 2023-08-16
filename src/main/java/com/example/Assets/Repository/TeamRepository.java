package com.example.Assets.Repository;

import com.example.Assets.Model.Employee;
import com.example.Assets.Model.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TeamRepository extends JpaRepository<Team,String> {
    Team findTopByOrderByTeamNoDesc();
    Optional<Team> findByTeamID(String teamID);

}