package com.example.lab8.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@Entity
@Table(name = "participante", schema = "partidossdci")
public class Participante {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idparticipante", nullable = false)
    private Integer id;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "equipo", nullable = false)
    private Equipo equipo;

    @Size(max = 45)
    @NotNull
    @Column(name = "carrera", nullable = false, length = 45)
    private String carrera;

    @NotNull
    @Column(name = "codigo", nullable = false, precision = 10)
    private BigDecimal codigo;

    @Size(max = 45)
    @NotNull
    @Column(name = "tipoParticipante", nullable = false, length = 45)
    private String tipoParticipante;

}