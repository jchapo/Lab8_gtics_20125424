package com.example.lab8.repository;

import com.example.lab8.entity.Historialpartido;
import com.example.lab8.entity.Participante;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface HistorialpartidoRepository extends JpaRepository<Historialpartido, Integer> {
    @Query(value = "SELECT idhistorialPartidos, partido_idpartido, deporte_iddeporte, horaFecha FROM historialpartidos as h\n" +
            "    LEFT JOIN partido as p ON h.partido_idpartido = p.idpartido\n" +
            "    where p.equipoA = ?1 or p.equipoB = ?1", nativeQuery = true)
    List<Historialpartido> listaHistorialPartidoUnEquipo(int id_equipo);


}