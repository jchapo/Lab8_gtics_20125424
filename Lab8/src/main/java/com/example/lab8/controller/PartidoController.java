package com.example.lab8.controller;

import com.example.lab8.entity.Historialpartido;
import com.example.lab8.entity.Participante;
import com.example.lab8.entity.Participantespartido;
import com.example.lab8.entity.Partido;
import com.example.lab8.repository.HistorialpartidoRepository;
import com.example.lab8.repository.ParticipanteRepository;
import com.example.lab8.repository.ParticipantespartidoRepository;
import com.example.lab8.repository.PartidoRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/partido")
public class PartidoController {

    final PartidoRepository partidoRepository;
    final HistorialpartidoRepository historialpartidoRepository;
    final ParticipanteRepository participanteRepository;
    final ParticipantespartidoRepository participantespartidoRepository;

    public PartidoController(PartidoRepository partidoRepository, HistorialpartidoRepository historialpartidoRepository,
                             ParticipanteRepository participanteRepository, ParticipantespartidoRepository participantespartidoRepository) {
        this.partidoRepository = partidoRepository;
        this.historialpartidoRepository = historialpartidoRepository;
        this.participanteRepository = participanteRepository;
        this.participantespartidoRepository = participantespartidoRepository;
    }

    // REGISTRO
    @PostMapping(value = {"/registro"})
    public ResponseEntity<HashMap<String, Object>> registrarPartido(
            @RequestBody Partido partido) {

        HashMap<String, Object> responseJson = new HashMap<>();
        partidoRepository.save(partido);

        Historialpartido historialpartido = new Historialpartido();
        historialpartido.setPartidoIdpartido(partido);
        historialpartido.setDeporteIddeporte(partido.getDeporte_iddeporte());
        historialpartido.setHoraFecha(partido.getHoraFecha());

        historialpartidoRepository.save(historialpartido);
        System.out.println(partido.getEquipoA().getId());
        System.out.println(partido.getEquipoB().getId());

        List<Participante> listaParticipantePartido = participanteRepository.listaParticipantesEnPartido(partido.getEquipoA().getId(), partido.getEquipoB().getId());
        System.out.println(listaParticipantePartido);

        for (Participante participante2 : listaParticipantePartido) {
            Participantespartido participantespartido = new Participantespartido();
            participantespartido.setPartidoIdpartido(partido);
            participantespartido.setParticipanteIdparticipante(participante2);
            participantespartido.setHoraFecha(partido.getHoraFecha());
            System.out.println(participantespartido);
            participantespartidoRepository.save(participantespartido);
        }
        responseJson.put("result", "ok");
        responseJson.put("id", partido.getId());

        return ResponseEntity.ok(responseJson);

    }

    @GetMapping(value = {"/getparticipantes"})
    public ResponseEntity<HashMap<String, Object>> obtenerParticipantes(@RequestBody Partido idPartido,
                                                                        @RequestParam(value = "idequipo", required = false) String idStr) {

        Integer id = idStr == null ? null : Integer.parseInt(idStr);
        System.out.println(idStr);
        try {
            Optional<Partido> partido = partidoRepository.findById(idPartido.getId());
            List<Participante> participantes = new ArrayList<>();

            if (id == null) {
                if (partido.isPresent()) {
                    participantes = participanteRepository.listaParticipantesEnPartido(partido.get().getEquipoA().getId(), partido.get().getEquipoB().getId());
                } else {
                    return ResponseEntity.badRequest().body(null);
                }
            } else {
                participantes = participanteRepository.listaParticipantesUnEquipo(id);
            }

            HashMap<String, Object> respuesta = new HashMap<>();
            respuesta.put("result", "ok");
            respuesta.put("Participantes", participantes);

            return ResponseEntity.ok(respuesta);

        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().body(null);
        }
    }

    @GetMapping(value = {"/gethistorialpartidos"})
    public ResponseEntity<HashMap<String, Object>> listaHistorialPartidos(
            @RequestParam(value = "idequipo", required = false) String idStr) {

        try {
            Integer id = idStr == null ? null : Integer.parseInt(idStr);
            List<Historialpartido> historialpartidos = new ArrayList<>();
            HashMap<String, Object> respuesta2 = new HashMap<>();

            if (id == null) {
                respuesta2.put("result", "ok");
                respuesta2.put("Historial partidos", historialpartidos = historialpartidoRepository.findAll());
            } else {
                respuesta2.put("result", "ok");
                respuesta2.put("Historial partidosHis", historialpartidos = historialpartidoRepository.listaHistorialPartidoUnEquipo(id));
            }

            return ResponseEntity.ok(respuesta2);

        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<HashMap<String, String>> gestionException(HttpServletRequest request) {
        HashMap<String, String> responseMap = new HashMap<>();
        if (request.getMethod().equals("POST") || request.getMethod().equals("PUT")) {
            responseMap.put("estado", "error");
            responseMap.put("msg", "Debe enviar un producto");
        }
        return ResponseEntity.badRequest().body(responseMap);
    }

}