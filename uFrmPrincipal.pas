unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, System.Net.HttpClientComponent, System.Net.URLClient,
  System.Net.HttpClient, System.JSON, System.StrUtils,  REST.JSON,
  Xml.XMLDoc, Xml.xmldom, Xml.XMLIntf, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    pnlTop: TPanel;
    Label1: TLabel;
    pnlBarraPesquisa: TPanel;
    pnlJSONXML: TPanel;
    Panel2: TPanel;
    txtPesquisaCep: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    rbJson: TRadioButton;
    rbXml: TRadioButton;
    pnlFooter: TPanel;
    pnlCadastro: TPanel;
    Panel4: TPanel;
    lblIdCep: TLabel;
    edtCep: TEdit;
    edtLogradouro: TEdit;
    edtComplemento: TEdit;
    rbInativo: TRadioButton;
    edtLocalidade: TEdit;
    rbAtivo: TRadioButton;
    edtBairro: TEdit;
    edtUf: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblCadastroCep: TLabel;
    txtPesquisaEndereco: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    txtCidade: TEdit;
    cbUf: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    btnPesquisar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    cxButton2: TSpeedButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    function formatarJSON(const jsonStr: string): string;
    procedure consularCEP_JSON(const CEP: string);
    procedure consultarCEP_XML(const CEP: string);
    procedure salvarDados_JSON(JSONString: string);
    procedure limparcampos(formulario: TForm);
    function removeChar(Const Texto:String):String;
    function validaTamanhoCampo(min, max: integer; campo: String): boolean;
    procedure salvarDados_XML(XMLString: string);
    procedure preencherCamposCadastro(ucep, ulogradouro, ucomplemento, ubairro, ulocalidade, uuf, utipo: String);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  cep, logradouro, complemento, bairro, localidade, uf: String;
  idCep: integer;
  cepNaoEncontrado: boolean;

implementation

{$R *.dfm}

uses uDmConexao;


procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  limparcampos(frmPrincipal);  pnlCadastro.Visible := False;
  txtPesquisaCep.Clear;
end;

procedure TfrmPrincipal.preencherCamposCadastro(ucep, ulogradouro, ucomplemento,
  ubairro, ulocalidade, uuf, utipo: String);
begin
  lblCadastroCep.Caption := 'Atualizar CEP';
  pnlCadastro.Visible := true;
  lblIdCep.Caption :=  inttostr(idCep);
  edtCep.Text := ucep;
  edtLogradouro.Text := ulogradouro;
  edtComplemento.Text := ucomplemento;
  edtBairro.Text := ubairro;
  edtLocalidade.Text := ulocalidade;
  edtUf.Text := uuf;
  if utipo = 'A' then
    rbAtivo.Checked := true;
  if utipo = 'I' then
    rbInativo.Checked := true;
end;

procedure TfrmPrincipal.btnPesquisarClick(Sender: TObject);
begin
  if trim(txtPesquisaCep.Text) = '' then
    if (cbUf.Text = '') or (txtPesquisaEndereco.Text = '') or (txtCidade.Text = '') then
      ShowMessage('Se o campo CEP estiver vazio, Obrigatoriamente todos os campos do Endere�o completo devem ser preenchidos !')
    else
    begin
      if (validaTamanhoCampo(3,0, txtPesquisaEndereco.Text) = true) and (validaTamanhoCampo(3,0, txtCidade.Text) = true) then
      begin
        idCep := dmConexao.verificarEnderecoExiste(cbUf.Text, txtCidade.Text, txtPesquisaEndereco.Text);
        if idCep > 0 then
        begin
          if MessageDlg('O CEP selecionado j� est� cadastrado ! Deseja atualiza-lo ?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
          begin
            self.preencherCamposCadastro(dmConexao.qyEndCompVerificarnu_cep.AsString, dmConexao.qyEndCompVerificards_logradouro.AsString,
              dmConexao.qyEndCompVerificards_complemento.AsString, dmConexao.qyEndCompVerificards_bairro.AsString, dmConexao.qyEndCompVerificards_localidade.AsString,
              dmConexao.qyEndCompVerificards_uf.AsString, dmConexao.qyEndCompVerificartp_situacao.AsString);
          end;
        end
        else
          ShowMessage('o WS possui apenas consulta por CEP !');
      end
      else
        ShowMessage('Os campos Cidade e Logradouro precisam ter no minimo 3 caracteres !');
    end
  else
  begin
    if validaTamanhoCampo(8,9, RemoveChar(txtPesquisaCep.Text)) = true then
    begin
      idCep := dmConexao.verificarCepExiste(RemoveChar(txtPesquisaCep.Text));
      if idCep > 0 then
      begin
        if MessageDlg('O CEP selecionado j� est� cadastrado ! Deseja atualiza-lo ?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          self.preencherCamposCadastro(dmConexao.qyCepVerificarnu_cep.AsString, dmConexao.qyCepVerificards_logradouro.AsString,
            dmConexao.qyCepVerificards_complemento.AsString, dmConexao.qyCepVerificards_bairro.AsString, dmConexao.qyCepVerificards_localidade.AsString,
            dmConexao.qyCepVerificards_uf.AsString, dmConexao.qyCepVerificartp_situacao.AsString);
        end;
      end
      else
      begin
        lblCadastroCep.Caption := 'Inserir CEP';
        if rbJson.Checked = True then
          ConsularCEP_JSON(txtPesquisaCep.Text);
        if rbXml.Checked = True then
          ConsultarCEP_XML(txtPesquisaCep.Text);
  //      pnlCadastro.Visible := true;
  //      rbAtivo.Checked := true;
  //      rbInativo.Checked := false;
      end;
    end
    else
      ShowMessage('O precisa ter entre 8 a 9 caracteres !');
    txtPesquisaCep.Clear;
  end;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
  situacao: string;
begin
  if idCep > 0 then
  begin
    if rbAtivo.Checked = true then
       situacao := 'A';
    if rbInativo.Checked = true then
       situacao := 'I';
    dmConexao.atualizarCep(RemoveChar(edtCep.Text), edtLogradouro.Text, edtComplemento.Text, edtBairro.Text, edtLocalidade.Text, edtUf.Text, situacao, idCep);
  end;
  dmConexao.atualizarGridCep;
  pnlCadastro.Visible := False;
  txtPesquisaCep.Clear;
end;

procedure TfrmPrincipal.ConsultarCEP_XML(const CEP: string);
var
  HttpClient: THttpClient;
  Response: IHttpResponse;
  XMLDocument: IXMLDocument;
  CEPNode, LogradouroNode, ComplementoNode, BairroNode, LocalidadeNode, UFNode, IBGENode, GIANode, DDDNode, SIAFINode: IXMLNode;
  resultadoXmlFormatado: String;
begin
  HttpClient := THttpClient.Create;
  try
    Response := HttpClient.Get('https://viacep.com.br/ws/' + CEP + '/xml/');
    if Response.StatusCode = 200 then
    begin
      XMLDocument := LoadXMLData(Response.ContentAsString);
      resultadoXmlFormatado := XMLDocument.XML.Text;
      if resultadoXmlFormatado <> '' then
      begin
        self.salvarDados_XML(resultadoXmlFormatado);
        dmConexao.inserirCep(cep, logradouro, complemento, bairro, localidade, uf);
      end;
    end
    else
    begin
      ShowMessage('Erro ao obter os dados do endere�o');
    end;
  finally
    HttpClient.Free;
  end;
end;


procedure TfrmPrincipal.ConsularCEP_JSON(const CEP: string);
var
  HttpClient: THttpClient;
  Response: IHttpResponse;
  JsonValue: TJSONValue;
  resultadoJsonFormatado: String;
begin
  HttpClient := THttpClient.Create;
  try
    Response := HttpClient.Get('https://viacep.com.br/ws/' + CEP + '/json/');
    if Response.StatusCode = 200 then
    begin
      JsonValue := TJSONObject.ParseJSONValue(Response.ContentAsString);
      try
        if Assigned(JsonValue) then
        begin
          resultadoJsonFormatado := FormatarJSON(JsonValue.ToString);
          if resultadoJsonFormatado <> '' then
          begin
            salvarDados_JSON(resultadoJsonFormatado);
            dmConexao.inserirCep(cep, logradouro, complemento, bairro, localidade, uf);
          end;
        end
      finally
        JsonValue.Free;
      end;
    end
    else
    begin
      ShowMessage('CEP Inexistente');
    end;
  finally
    HttpClient.Free;
  end;
end;

procedure TfrmPrincipal.SalvarDados_JSON(JSONString: string);
var
  JSONObject: TJSONObject;
begin
  JSONString := JSONString;
  // Criar um objeto JSON a partir da string JSON
  JSONObject := TJSONObject.ParseJSONValue(JSONString) as TJSONObject;
  try
    // Verificar se o objeto JSON foi criado com sucesso
    if Assigned(JSONObject) then
    begin
      cep := RemoveChar(JSONObject.GetValue('cep').Value);
      logradouro := JSONObject.GetValue('logradouro').Value;
      complemento := JSONObject.GetValue('complemento').Value;
      bairro := JSONObject.GetValue('bairro').Value;
      localidade := JSONObject.GetValue('localidade').Value;
      uf := JSONObject.GetValue('uf').Value;
    end;
  finally
    JSONObject.Free;
  end;
end;

procedure TfrmPrincipal.salvarDados_XML(XMLString: string);
var
  XMLDoc: IXMLDocument;
  XMLNode: IXMLNode;
begin
  XMLDoc := LoadXMLData(XMLString);
  XMLNode := XMLDoc.DocumentElement;
  if Assigned(XMLNode) then
  begin
    cep := RemoveChar(XMLNode.ChildNodes['cep'].Text);
    logradouro := XMLNode.ChildNodes['logradouro'].Text;
    complemento := XMLNode.ChildNodes['complemento'].Text;
    bairro := XMLNode.ChildNodes['bairro'].Text;
    localidade := XMLNode.ChildNodes['localidade'].Text;
    uf := XMLNode.ChildNodes['uf'].Text;
  end;
end;

function TfrmPrincipal.validaTamanhoCampo(min, max: integer;
  campo: String): boolean;
var
  tamanhoCampo: Integer;
begin
  if max = 0 then
    max := 100;

  tamanhoCampo := Length(campo);
  if (tamanhoCampo >= min) and (tamanhoCampo <= max) then
    result := true
  else
    result := false
end;

procedure TfrmPrincipal.cxButton2Click(Sender: TObject);
begin
  close;
end;

function TfrmPrincipal.FormatarJSON(const jsonStr: string): string;
var
  jsonObject: TJSONObject;
begin
  jsonObject := TJSONObject.ParseJSONValue(jsonStr) as TJSONObject;
  try
    if Assigned(jsonObject) then
      Result := TJSON.Format(jsonObject)
    else
      Result := '';
  finally
    jsonObject.Free;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  idCep := 0;
  dmConexao.atualizarGridCep;
end;

procedure TfrmPrincipal.limparcampos(formulario: TForm);
var
  i: Integer;
begin
  for i := 1 to formulario.ComponentCount -1 do
  begin
     if formulario.Components[i] is TEdit then
       TEdit(formulario.Components[i]).Clear;
     if formulario.Components[i] is TRadioButton then
       TRadioButton(formulario.Components[i]).Checked := False;
  end;
end;



function TfrmPrincipal.RemoveChar(const Texto: String): String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
  I: integer;
  S: string;
begin
  S := '';
  for I := 1 To Length(Texto) Do
  begin
    if (Texto[I] in ['0'..'9']) then
    begin
    S := S + Copy(Texto, I, 1);
    end;
  end;
  result := S;
end;



end.
