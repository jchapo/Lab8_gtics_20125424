package com.example.lab8.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.Instant;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "partido", schema = "partidossdci")
public class Partido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idpartido", nullable = false)
    private Integer id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "equipoA", nullable = false)
    private Equipo equipoA;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "equipoB", nullable = false)
    private Equipo equipoB;

    @NotNull
    @Column(name = "scoreA", nullable = false)
    private Integer scoreA;

    @NotNull
    @Column(name = "scoreB", nullable = false)
    private Integer scoreB;

    @Transient
    @NotNull
    private Deporte deporte_iddeporte;


    @Transient
    @NotNull
    private Instant horaFecha;



}