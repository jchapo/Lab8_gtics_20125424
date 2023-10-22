package com.example.lab8.repository;

import com.example.lab8.entity.Participante;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface ParticipanteRepository extends JpaRepository<Participante, Integer> {
    @Query(value = "SELECT * FROM participante where equipo=?1 or equipo=?2", nativeQuery = true)
    List<Participante> listaParticipantesEnPartido(int id_equipoA, int id_equipoB);

    @Query(value = "SELECT * FROM participante where equipo=?1", nativeQuery = true)
    List<Participante> listaParticipantesUnEquipo(int id_equipo);

    @Query(value = "SELECT participante_idparticipante FROM participantespartido WHERE partido_idpartido = ?1", nativeQuery = true)
    List<Participante> listaParticipantePartido(int id_partido);


}