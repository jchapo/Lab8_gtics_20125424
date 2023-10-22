package com.example.lab8.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "participantespartido", schema = "partidossdci")
public class Participantespartido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idparticipantesPartido", nullable = false)
    private Integer id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "partido_idpartido", nullable = false)
    private Partido partidoIdpartido;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "participante_idparticipante", nullable = false)
    private Participante participanteIdparticipante;

    @NotNull
    @Column(name = "horaFecha", nullable = false)
    private Instant horaFecha;

}