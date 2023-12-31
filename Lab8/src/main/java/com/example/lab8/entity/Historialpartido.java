package com.example.lab8.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "historialpartidos", schema = "partidossdci")
public class Historialpartido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idhistorialPartidos", nullable = false)
    private Integer id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "partido_idpartido", nullable = false)
    private Partido partidoIdpartido;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "deporte_iddeporte", nullable = false)
    private Deporte deporteIddeporte;

    @NotNull
    @Column(name = "horaFecha", nullable = false)
    private Instant horaFecha;

}