# Desafio Modulo CEP - SoftPlan :: Cargo Desenvolvedor Python

# Banco de dados utilizado :: POSTGRES vesão 12.8 ou menor

# Acessar Postgres e criar uma base de dados chamada "desafio_softplan"
# Rodar o Scritp SQL:

create table cep
(
	id_cep serial,
	nu_cep varchar(20),
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


# Próximo passo é abrir o sistema no Delphi e configurar o acesso a base de dados desafio_softplan
# Usei o componente ZEOS para conexao com o banco de dados :: link para download https://sourceforge.net/projects/zeoslib/files/Zeos%20Database%20Objects/zeosdbo-8.0.0-stable/zeosdbo-8.0.0-stable.zip/download
# Ao Abrir o código acessar o formulario dmConexao.pas
# Selecionar o componente de conexao chamado zConexao e configurar as seguintes propriedades:
database=desafio_softplan
hostname=localhost
password=sua_senha
porta=5432
user=seu_usuario
# Configurado, verificar se o componente está conectando a base de dados no postgres.

Sobre o Desafio

Procurei seguir o desenvolvimento o mais próximo possivel do que foi solicitado;
No modulo, a pequisa principal é pelo CEP e sempre a pesquisa vai focar no CEP. Caso o CEP não for preenchido, o sistema procura verificar se o Endereço está completamente prenchido para ai fazer a pesquisa na base de dados.
Na pesquisa por Endereço, percebi que não possui no WS e por isso fiz a consulta apenas no banco de dados, seguindo todas as especificações do documento.
Quando existir algum cep já cadastrado no banco de dados, e o cliente selecionar que deseja alterar, criei um mini formulario para alteração, assim facilita a experiência do cliente junto ao Módulo.
O sistema funciona tanto para JSON quando para XML e o acesso a base de dados;
