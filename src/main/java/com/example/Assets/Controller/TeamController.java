package com.example.Assets.Controller;
import com.example.Assets.Model.Team;
import com.example.Assets.Repository.TeamRepository;
import com.example.Assets.Service.TeamService;
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
    @Autowired
    private TeamService teamService;

    @PostMapping("/add")
    public String add(@RequestBody Team teamadd){
        String tempID = teamadd.getTeamID();
        System.out.println("Team "+teamadd.getTeamName()+" TeamId "+teamadd.getTeamID());
        teamService.createNewTeam(teamadd);
        return "New team is added";
    }

    @GetMapping("/getAll")
    public List<Team> list(){
        return teamRepository.findAll();
    }

    @GetMapping("/get/{teamID}")
    public Optional<Team> getByTeamID(@PathVariable String teamID) {return teamRepository.findByTeamID(teamID);}

    @PutMapping("/edit/{teamNo}")
    public Optional<Team> editTeam(@RequestBody Team newTeam, @PathVariable String teamNo)
    {
        return teamRepository.findById(teamNo)
                .map(team -> {
                    team.setTeamID(newTeam.getTeamID());
                    team.setTeamName(newTeam.getTeamName());
                    return teamRepository.save(team);
                });
    }

    @DeleteMapping("/delete/{teamNo}")
    String deleteTeam(@PathVariable String teamNo)
    {
        if(!teamRepository.existsById(teamNo)){
            return "No such team exists";
        }
        teamRepository.deleteById(teamNo);
        return  "User with id "+teamNo+" has been deleted success";
    }
}



