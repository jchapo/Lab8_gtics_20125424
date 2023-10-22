package com.example.lab8.controller;

import com.example.lab8.entity.Participante;
import com.example.lab8.entity.Participante;
import com.example.lab8.entity.Participante;
import com.example.lab8.repository.ParticipanteRepository;
import com.example.lab8.repository.ParticipanteRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/participante")
public class ParticipanteController {

    final ParticipanteRepository participanteRepository;

    public ParticipanteController(ParticipanteRepository participanteRepository) {
        this.participanteRepository = participanteRepository;
    }

    // REGISTRO
    @PostMapping(value = {"/registro"})
    public ResponseEntity<HashMap<String, Object>> registrarParticipante(
            @RequestBody Participante participante ){
        try {
            HashMap<String, Object> responseJson = new HashMap<>();

            participanteRepository.save(participante);

            responseJson.put("Código participante", participante.getCodigo());
            responseJson.put("id", participante.getId());
        
            return ResponseEntity.ok(responseJson);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
}
