package com.example.Assets.Controller;

import com.example.Assets.Model.History;
import com.example.Assets.Repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/history")
@CrossOrigin
public class HistoryController {
    @Autowired
    HistoryRepository historyRepository;

    @GetMapping("/getAll")
    public List<History> list(){
        return historyRepository.findAll();
    }

    @GetMapping("/getBy/{tablename}")
    public  List<History>  list(@PathVariable String tablename) { return  historyRepository.findByTablename(tablename); }

    @GetMapping("getBy/{tablename}/{changetype}")
    public List<History> list(@PathVariable String tablename, @PathVariable String changetype) {

           List<History> latest = historyRepository.findByTablenameAndChangetypeOrderByTimeDesc(tablename, changetype);
           if(latest!=null)
           {

               System.out.println("\nHistory updated:"+latest.get(0).getId()+" at "+latest.get(0).getTime());
               return latest;
           }
           else
               return null;
    }

    @PutMapping("/edit/{id}")
    public Optional<History> editHistory(@RequestBody History newHistory,@PathVariable Integer id)
    {
        
        return historyRepository.findById(id)
                .map(history -> {
                    history.setChangedBy(newHistory.getChangedBy());
                    history.setRole(newHistory.getRole());
                    return historyRepository.save(history);
                });
    }

}
