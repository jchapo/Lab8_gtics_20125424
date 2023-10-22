package com.example.lab8.controller;

import com.example.lab8.entity.Deporte;
import com.example.lab8.repository.DeporteRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/deporte")
public class DeporteController {

    final DeporteRepository deporteRepository;

    public DeporteController(DeporteRepository deporteRepository) {
        this.deporteRepository = deporteRepository;
    }

    // REGISTRO
    @PostMapping(value = {"/registro"})
    public ResponseEntity<HashMap<String, Object>> registrarDeporte(
            @RequestBody Deporte deporte){
        try {
            HashMap<String, Object> responseJson = new HashMap<>();

            deporteRepository.save(deporte);
            
            responseJson.put("Nombre deporte", deporte.getNombreDeporte());
            responseJson.put("id", deporte.getId());
            
            return ResponseEntity.ok(responseJson);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
}
