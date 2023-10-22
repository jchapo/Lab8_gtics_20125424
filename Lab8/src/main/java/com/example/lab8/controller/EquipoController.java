package com.example.lab8.controller;

import com.example.lab8.entity.Equipo;
import com.example.lab8.entity.Participante;
import com.example.lab8.entity.Partido;
import com.example.lab8.repository.EquipoRepository;
import com.example.lab8.repository.ParticipanteRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/equipo")
public class EquipoController {

    final EquipoRepository equipoRepository;
    private final ParticipanteRepository participanteRepository;

    public EquipoController(EquipoRepository equipoRepository,
                            ParticipanteRepository participanteRepository) {
        this.equipoRepository = equipoRepository;
        this.participanteRepository = participanteRepository;
    }

    // REGISTRO
    @PostMapping(value = {"/registro"})
    public ResponseEntity<HashMap<String, Object>> registrarEquipo(
            @RequestBody Equipo equipo) {
        try {
            HashMap<String, Object> responseJson = new HashMap<>();
            System.out.println("entro aqui2");

            equipoRepository.save(equipo);
            System.out.println("entro aqui3");


            responseJson.put("Nombre equipo", equipo.getNombreEquipo());
            responseJson.put("id", equipo.getId());

            return ResponseEntity.ok(responseJson);
        } catch (Exception e) {
            System.out.println("entro aqui");
            return ResponseEntity.badRequest().body(null);
        }
    }


}
