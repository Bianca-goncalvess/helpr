package com.api.helpr.domain.dtos;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotNull;

import com.api.helpr.domain.Chamado;
import com.fasterxml.jackson.annotation.JsonFormat;

public class ChamadoDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
    private Integer id;
	@JsonFormat(pattern = "dd/MM/yyyy")
	private LocalDate dataAbertura = LocalDate.now();
	@JsonFormat(pattern = "dd/MM/yyyy")
	private LocalDate dataFechamento;
	
	@NotNull (message = "O campo Prioridade não deve ser nulo")
	private Integer prioridade;
	@NotNull (message = "O campo Status não deve ser nulo")
	private Integer status;
	@NotNull (message = "O campo Titulo não deve ser nulo")
	private String titulo;
	@NotNull (message = "O campo Observações não deve ser nulo")
	private String observacoes;	
	@NotNull (message = "Um Tecnico precisa está vinculado")
	private Integer tecnico;
	@NotNull (message = "Um Cliente precisa está vinculado")
	private Integer cliente;
	private String nomeTecnico;
	private String nomeCliente;
	
	public ChamadoDTO() {
		super();
	}
	public ChamadoDTO(Chamado obj) {
		super();
		this.id = obj.getId();
		this.dataAbertura = obj.getDataAbertura();
		this.dataFechamento = obj.getDataFechamento();
		this.prioridade = obj.getPrioridade().getCodigo();
		this.status = obj.getStatus().getCodigo();
		this.titulo = obj.getTitulo();
		this.observacoes = obj.getObservacoes();
		this.tecnico = obj.getTecnico().getId();
		this.cliente = obj.getCliente().getId();
		this.nomeTecnico = obj.getCliente().getNome();
		this.nomeCliente = obj.getCliente().getNome();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public LocalDate getDataAbertura() {
		return dataAbertura;
	}
	public void setDataAbertura(LocalDate dataAbertura) {
		this.dataAbertura = dataAbertura;
	}
	public LocalDate getDataFechamento() {
		return dataFechamento;
	}
	public void setDataFechamento(LocalDate dataFechamento) {
		this.dataFechamento = dataFechamento;
	}
	public Integer getPrioridade() {
		return prioridade;
	}
	public void setPrioridade(Integer prioridade) {
		this.prioridade = prioridade;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getObservacoes() {
		return observacoes;
	}
	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}
	public Integer getTecnico() {
		return tecnico;
	}
	public void setTecnico(Integer tecnico) {
		this.tecnico = tecnico;
	}
	public Integer getCliente() {
		return cliente;
	}
	public void setCliente(Integer cliente) {
		this.cliente = cliente;
	}
	public String getNomeTecnico() {
		return nomeTecnico;
	}
	public void setNomeTecnico(String nomeTecnico) {
		this.nomeTecnico = nomeTecnico;
	}
	public String getNomeCliente() {
		return nomeCliente;
	}
	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}
	
	

	
}