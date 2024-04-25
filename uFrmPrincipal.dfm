object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmPrincipal'
  ClientHeight = 748
  ClientWidth = 1157
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 313
    Top = 305
    Width = 844
    Height = 402
    Align = alClient
    DataSource = dmConexao.dsCep
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'id_cep'
        Title.Caption = 'ID'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nu_cep'
        Title.Caption = 'CEP'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_logradouro'
        Title.Caption = 'Logradouro'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_complemento'
        Title.Caption = 'Complemento'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_bairro'
        Title.Caption = 'Bairro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_localidade'
        Title.Caption = 'Localidade'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_uf'
        Title.Caption = 'UF'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tp_situacao'
        Visible = False
      end>
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1157
    Height = 57
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 290
      Height = 33
      Caption = 'Modulo :: Gerenciar CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlBarraPesquisa: TPanel
    Left = 0
    Top = 57
    Width = 1157
    Height = 248
    Align = alTop
    TabOrder = 2
    object btnPesquisar: TSpeedButton
      Left = 959
      Top = 111
      Width = 154
      Height = 41
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 25
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnPesquisarClick
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 672
      Height = 246
      Align = alLeft
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 15
        Top = 17
        Width = 160
        Height = 24
        Caption = 'Pesquisar por CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 15
        Top = 126
        Width = 299
        Height = 24
        Caption = 'Pesquisar por Endere'#231'o Completo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 13
        Top = 222
        Width = 221
        Height = 13
        Caption = 'Permitido pesquisar por : UF/Cidade/Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 15
        Top = 92
        Width = 165
        Height = 13
        Caption = 'Permitido cep com ou sem hifen (-)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 18
        Top = 165
        Width = 14
        Height = 13
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 133
        Top = 165
        Width = 38
        Height = 13
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 328
        Top = 165
        Width = 65
        Height = 13
        Caption = 'Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtPesquisaCep: TEdit
        Left = 15
        Top = 53
        Width = 449
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object txtPesquisaEndereco: TEdit
        Left = 328
        Top = 184
        Width = 319
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object txtCidade: TEdit
        Left = 133
        Top = 184
        Width = 189
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object cbUf: TComboBox
        Left = 13
        Top = 184
        Width = 114
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
      end
    end
    object pnlJSONXML: TPanel
      Left = 673
      Top = 1
      Width = 280
      Height = 246
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label3: TLabel
        Left = 15
        Top = 19
        Width = 186
        Height = 25
        Caption = 'Op'#231#245'es de Pesquisa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = 25
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rbXml: TRadioButton
        Left = 118
        Top = 104
        Width = 83
        Height = 47
        Caption = 'XML'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 30
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rbJson: TRadioButton
        Left = 14
        Top = 107
        Width = 83
        Height = 41
        Caption = 'JSON'
        Checked = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 30
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        TabStop = True
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 707
    Width = 1157
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 702
    object cxButton2: TSpeedButton
      Left = 1048
      Top = 6
      Width = 97
      Height = 28
      Caption = 'Fechar'
      OnClick = cxButton2Click
    end
  end
  object pnlCadastro: TPanel
    Left = 0
    Top = 305
    Width = 313
    Height = 402
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 50
    Align = alLeft
    Color = clNavy
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ParentBackground = False
    TabOrder = 4
    Visible = False
    object Panel4: TPanel
      Left = 11
      Top = 11
      Width = 291
      Height = 380
      Align = alClient
      Color = 16119285
      ParentBackground = False
      TabOrder = 0
      object lblIdCep: TLabel
        Left = 18
        Top = 29
        Width = 10
        Height = 20
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 18
        Top = 53
        Width = 20
        Height = 13
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 18
        Top = 97
        Width = 65
        Height = 13
        Caption = 'Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 18
        Top = 142
        Width = 79
        Height = 13
        Caption = 'Complemento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 18
        Top = 188
        Width = 34
        Height = 13
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 18
        Top = 234
        Width = 60
        Height = 13
        Caption = 'Localidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 18
        Top = 279
        Width = 14
        Height = 13
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 83
        Top = 280
        Width = 49
        Height = 13
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10485760
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCadastroCep: TLabel
        Left = 18
        Top = 11
        Width = 157
        Height = 19
        Caption = 'Inserir / Atualizar CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnSalvar: TSpeedButton
        Left = 35
        Top = 336
        Width = 97
        Height = 22
        Caption = 'Salvar'
        OnClick = btnSalvarClick
      end
      object btnCancelar: TSpeedButton
        Left = 144
        Top = 336
        Width = 97
        Height = 22
        Caption = 'Cancelar'
        OnClick = btnCancelarClick
      end
      object edtCep: TEdit
        Left = 18
        Top = 72
        Width = 249
        Height = 21
        TabOrder = 0
      end
      object edtLogradouro: TEdit
        Left = 18
        Top = 116
        Width = 249
        Height = 21
        TabOrder = 1
      end
      object edtComplemento: TEdit
        Left = 18
        Top = 161
        Width = 249
        Height = 21
        TabOrder = 2
      end
      object rbInativo: TRadioButton
        Left = 144
        Top = 300
        Width = 50
        Height = 17
        Caption = 'Inativo'
        TabOrder = 7
      end
      object edtLocalidade: TEdit
        Left = 18
        Top = 253
        Width = 249
        Height = 21
        TabOrder = 4
      end
      object rbAtivo: TRadioButton
        Left = 83
        Top = 300
        Width = 50
        Height = 17
        Caption = 'Ativo'
        TabOrder = 6
      end
      object edtBairro: TEdit
        Left = 18
        Top = 207
        Width = 249
        Height = 21
        TabOrder = 3
      end
      object edtUf: TEdit
        Left = 18
        Top = 298
        Width = 49
        Height = 21
        TabOrder = 5
      end
    end
  end
end
