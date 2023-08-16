package com.example.Assets.Service;

import com.example.Assets.Model.Team;
import com.example.Assets.Repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamService {
    @Autowired
    private TeamRepository teamRepository;
    public Team createNewTeam(Team team) {
        String formattedKey = generateFormattedKey();
        team.setTeamNo(formattedKey);
        team = teamRepository.save(team);
        return team;
    }
    private String generateFormattedKey() {
        Team latestEntity = teamRepository.findTopByOrderByTeamNoDesc();
        if (latestEntity == null) {
            return "T000001";
        } else {
            int lastNumericValue = Integer.parseInt(latestEntity.getTeamNo().substring(1));
            int newNumericValue = lastNumericValue + 1;
            String formattedNumericValue = String.format("%06d", newNumericValue);
            String formattedKey = "T" + formattedNumericValue;
            return formattedKey;
        }
    }
}


