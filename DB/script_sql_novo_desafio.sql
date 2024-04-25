create table cep
(
	id_cep serial,
	nu_cep varchar(8),
	ds_logradouro varchar(150),
	ds_complemento varchar(30),
	ds_bairro varchar(50),
	ds_localidade varchar(150),
	ds_uf varchar(2),
	tp_situacao varchar(1),
	insert_to timestamp,
	update_to timestamp,
	detele_to timestamp,	
	constraint id_cep_pk primary key (id_cep)
);
COMMENT ON TABLE cep IS 'APRESENTA OS CEPs CADASTRADAOS NO SISTEMA';
COMMENT ON COLUMN cep.tp_situacao IS 'SITUACAO DO CEP PODE SER A: ATIVO | I: INATIVO | E: EXCLUIDO ## 
									  DIFERENCA DO INATIVO PARA O EXCLUIDO, 
									  	- QUANDO INATIVO O DADO PODE SER ALTERADO PARA ATIVO, 
										- QUANDO EXCLUIDO, O DADO FICA PARA REGISTRO, POREM NAO PODE MAIS SER ALTERADO. ';
