package com.example.lab8.repository;

import com.example.lab8.entity.Participante;
import com.example.lab8.entity.Participantespartido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface ParticipantespartidoRepository extends JpaRepository<Participantespartido, Integer> {
}