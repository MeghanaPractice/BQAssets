package com.example.Assets.Controller;

import com.example.Assets.Model.Team;
import com.example.Assets.Repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/team")
@CrossOrigin
public class TeamController {

    @Autowired
    private TeamRepository teamRepository;

    @PostMapping("/add")
    public String add(@RequestBody Team teamadd){
        String tempID = teamadd.getTeamID();
        System.out.println("Team "+teamadd.getTeamName()+" TeamId "+teamadd.getTeamID());
        teamadd.setTeamID(tempID);
        teamRepository.save(teamadd);
        return "New team is added";
    }

    @GetMapping("/getAll")
    public List<Team> list(){
        return teamRepository.findAll();
    }

    @GetMapping("/get/{teamID}")
    public Optional<Team> getByTeamID(@PathVariable String teamID) {return teamRepository.findById(teamID);}

    @PutMapping("/edit/{teamID}")
    public Optional<Team> editTeam(@RequestBody Team newTeam, @PathVariable String teamID)
    {
        return teamRepository.findById(teamID)
                .map(team -> {
                    String originalID = team.getTeamID();
                    team.setTeamName(newTeam.getTeamName());
                    team.setTeamID(originalID);
                    return teamRepository.save(team);
                });
    }

    @DeleteMapping("/delete/{teamID}")
    String deleteTeam(@PathVariable String teamID)
    {
        if(!teamRepository.existsById(teamID)){
            return "No such team exists";
        }
        teamRepository.deleteById(teamID);
        return  "User with id "+teamID+" has been deleted success";
    }
}



