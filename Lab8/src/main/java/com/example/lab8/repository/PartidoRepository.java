package com.example.lab8.repository;

import com.example.lab8.entity.Participante;
import com.example.lab8.entity.Partido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface PartidoRepository extends JpaRepository<Partido, Integer> {
}