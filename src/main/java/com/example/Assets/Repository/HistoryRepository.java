package com.example.Assets.Repository;

import com.example.Assets.Model.History;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface HistoryRepository extends JpaRepository<History, Integer> {
    List<History> findByTablename(String tablename);

    List<History> findByTablenameAndChangetypeOrderByTimeDesc(String tablename, String changetype);
}
