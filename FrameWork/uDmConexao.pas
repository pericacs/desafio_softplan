unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Datasnap.Provider,
  Datasnap.DBClient, Dialogs, IniFiles;

type
  TdmConexao = class(TDataModule)
    zConexao: TZConnection;
    dsCep: TDataSource;
    cdsCep: TClientDataSet;
    dspCep: TDataSetProvider;
    qyCepInserir: TZQuery;
    qyCepAtualizar: TZQuery;
    qyCepConsultar: TZQuery;
    qyCepApagar: TZQuery;
    qyCepVerificar: TZQuery;
    qyCepConsultarid_cep: TZIntegerField;
    qyCepConsultarnu_cep: TZUnicodeStringField;
    qyCepConsultards_logradouro: TZUnicodeStringField;
    qyCepConsultards_complemento: TZUnicodeStringField;
    qyCepConsultards_bairro: TZUnicodeStringField;
    qyCepConsultards_localidade: TZUnicodeStringField;
    qyCepConsultards_uf: TZUnicodeStringField;
    qyCepConsultartp_situacao: TZUnicodeStringField;
    cdsCepid_cep: TIntegerField;
    cdsCepnu_cep: TWideStringField;
    cdsCepds_logradouro: TWideStringField;
    cdsCepds_complemento: TWideStringField;
    cdsCepds_bairro: TWideStringField;
    cdsCepds_localidade: TWideStringField;
    cdsCepds_uf: TWideStringField;
    cdsCeptp_situacao: TWideStringField;
    qyEndCompVerificar: TZQuery;
    qyCepVerificarid_cep: TZIntegerField;
    qyCepVerificarnu_cep: TZUnicodeStringField;
    qyCepVerificards_logradouro: TZUnicodeStringField;
    qyCepVerificards_complemento: TZUnicodeStringField;
    qyCepVerificards_bairro: TZUnicodeStringField;
    qyCepVerificards_localidade: TZUnicodeStringField;
    qyCepVerificards_uf: TZUnicodeStringField;
    qyCepVerificartp_situacao: TZUnicodeStringField;
    qyEndCompVerificarid_cep: TZIntegerField;
    qyEndCompVerificarnu_cep: TZUnicodeStringField;
    qyEndCompVerificards_logradouro: TZUnicodeStringField;
    qyEndCompVerificards_complemento: TZUnicodeStringField;
    qyEndCompVerificards_bairro: TZUnicodeStringField;
    qyEndCompVerificards_localidade: TZUnicodeStringField;
    qyEndCompVerificards_uf: TZUnicodeStringField;
    qyEndCompVerificartp_situacao: TZUnicodeStringField;
    procedure inserirCep(nu_cep, ds_logradouro, ds_complemento, ds_bairro, ds_localidade, ds_uf: String);
    procedure atualizarCep(nu_cep, ds_logradouro, ds_complemento, ds_bairro, ds_localidade, ds_uf, tp_situacao: String; id_cep: Integer);
    procedure deletarCep(created_at, deleted_at: String; id_cep: Integer);
    procedure atualizarGridCep;
    function verificarCepExiste(nu_cep: string): integer;
    function verificarEnderecoExiste(uf, cidade, endereco: string): integer;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexao }

procedure TdmConexao.atualizarCep(nu_cep, ds_logradouro, ds_complemento,
  ds_bairro, ds_localidade, ds_uf, tp_situacao: String;
  id_cep: Integer);
begin
  try
    zConexao.StartTransaction;
    qyCepAtualizar.Close;
    with qyCepAtualizar do
    begin
       ParamByName('nu_cep').AsString := nu_cep;
       ParamByName('ds_logradouro').AsString := ds_logradouro;
       ParamByName('ds_complemento').AsString := ds_complemento;
       ParamByName('ds_bairro').AsString := ds_bairro;
       ParamByName('ds_localidade').AsString := ds_localidade;
       ParamByName('ds_uf').AsString := ds_uf;
       ParamByName('tp_situacao').AsString := tp_situacao;
       ParamByName('updated_at').AsDate := Now;
       ParamByName('id_cep').AsInteger := id_cep;
    end;
    qyCepAtualizar.ExecSQL;
    zConexao.Commit;
    MessageDlg('CEP atualizado com Sucesso !', mtCustom, [mbOK], 4, mbOK);
  except
    zConexao.Rollback;
    ShowMessage('Houve um erro ao atualizar o CEP!');
  end;
end;

procedure TdmConexao.atualizarGridCep;
begin
  cdsCep.Active := false;
  cdsCep.Active := true;
end;

procedure TdmConexao.deletarCep(created_at, deleted_at: String;
  id_cep: Integer);
begin
  try
    zConexao.StartTransaction;
    qyCepInserir.Close;
    with qyCepInserir do
    begin
       ParamByName('id_cep').AsInteger := id_cep;
       ParamByName('tp_situacao').AsString := 'E';
       ParamByName('updated_at').AsDate := Now;
       ParamByName('deleted_at').AsDate := Now;
    end;
    qyCepInserir.ExecSQL;
    zConexao.Commit;
  except
    zConexao.Commit;
    ShowMessage('Houve um erro ao cadastrar o CEP!');
  end;
end;

procedure TdmConexao.inserirCep(nu_cep, ds_logradouro, ds_complemento,
  ds_bairro, ds_localidade, ds_uf: String);
begin
  try
    zConexao.StartTransaction;
    qyCepInserir.Close;
    with qyCepInserir do
    begin
       ParamByName('nu_cep').AsString := trim(nu_cep);
       ParamByName('ds_logradouro').AsString := trim(ds_logradouro);
       ParamByName('ds_complemento').AsString := ds_complemento;
       ParamByName('ds_bairro').AsString := ds_bairro;
       ParamByName('ds_localidade').AsString := ds_localidade;
       ParamByName('ds_uf').AsString := ds_uf;
       ParamByName('tp_situacao').AsString := 'A';
       ParamByName('created_at').AsDate := Now;
       ParamByName('updated_at').AsDate := Now;
    end;
    qyCepInserir.ExecSQL;
    zConexao.Commit;
    MessageDlg('CEP: ' + nu_cep + ' cadastrado com Sucesso !', mtConfirmation, [mbOK], 3, mbOK);
    self.atualizarGridCep;
  except
    zConexao.Rollback;
    ShowMessage('Houve um erro ao cadastrar o CEP!');
  end;
end;


function TdmConexao.verificarCepExiste(nu_cep: string): integer;
begin
  with qyCepVerificar do
  begin
    Close;
    ParamByName('nu_cep').AsString := trim(nu_cep);
    open;
  end;

  if not qyCepVerificar.Eof then
    Result := qyCepVerificarid_cep.AsInteger
  else
    Result := 0;
end;

function TdmConexao.verificarEnderecoExiste(uf, cidade,
  endereco: string): integer;
begin
  with qyEndCompVerificar do
  begin
    Close;
    ParamByName('ds_uf').AsString := trim(uf);
    ParamByName('ds_localidade').AsString := trim(cidade);
    ParamByName('ds_logradouro').AsString := trim(endereco);
    open;
  end;

  if not qyEndCompVerificar.Eof then
    Result := qyEndCompVerificarid_cep.AsInteger
  else
    Result := 0;
end;

end.
