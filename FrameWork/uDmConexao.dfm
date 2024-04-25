object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 622
  Width = 628
  object zConexao: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    TransactIsolationLevel = tiReadUncommitted
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 5432
    Database = 'desafio_softplan'
    User = 'postgres'
    Password = '1245Cacs'
    Protocol = 'postgresql'
    Left = 40
    Top = 24
  end
  object dsCep: TDataSource
    DataSet = cdsCep
    Left = 128
    Top = 24
  end
  object cdsCep: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCep'
    Left = 128
    Top = 80
    object cdsCepid_cep: TIntegerField
      FieldName = 'id_cep'
    end
    object cdsCepnu_cep: TWideStringField
      FieldName = 'nu_cep'
    end
    object cdsCepds_logradouro: TWideStringField
      FieldName = 'ds_logradouro'
      Size = 150
    end
    object cdsCepds_complemento: TWideStringField
      FieldName = 'ds_complemento'
      Size = 30
    end
    object cdsCepds_bairro: TWideStringField
      FieldName = 'ds_bairro'
      Size = 50
    end
    object cdsCepds_localidade: TWideStringField
      FieldName = 'ds_localidade'
      Size = 150
    end
    object cdsCepds_uf: TWideStringField
      FieldName = 'ds_uf'
      Size = 2
    end
    object cdsCeptp_situacao: TWideStringField
      FieldName = 'tp_situacao'
      Size = 1
    end
  end
  object dspCep: TDataSetProvider
    DataSet = qyCepConsultar
    Left = 128
    Top = 136
  end
  object qyCepInserir: TZQuery
    Connection = zConexao
    SQL.Strings = (
      'insert into cep '
      '('
      '  nu_cep,'
      '  ds_logradouro, '
      '  ds_complemento, '
      '  ds_bairro, '
      '  ds_localidade, '
      '  ds_uf, '
      '  tp_situacao, '
      '  created_at, '
      '  updated_at'
      ')'
      'values'
      ' ('
      '  :nu_cep, '
      '  :ds_logradouro, '
      '  :ds_complemento, '
      '  :ds_bairro, '
      '  :ds_localidade, '
      '  :ds_uf, '
      '  :tp_situacao, '
      '  :created_at,  '
      '  :updated_at'
      ')')
    Params = <
      item
        DataType = ftString
        Name = 'nu_cep'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_logradouro'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_complemento'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_bairro'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_localidade'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_uf'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'tp_situacao'
        ParamType = ptInput
        SQLType = stString
      end
      item
        Name = 'created_at'
      end
      item
        Name = 'updated_at'
      end>
    Left = 128
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'nu_cep'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_logradouro'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_complemento'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_bairro'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_localidade'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'ds_uf'
        ParamType = ptInput
        SQLType = stString
      end
      item
        DataType = ftString
        Name = 'tp_situacao'
        ParamType = ptInput
        SQLType = stString
      end
      item
        Name = 'created_at'
      end
      item
        Name = 'updated_at'
      end>
  end
  object qyCepAtualizar: TZQuery
    Connection = zConexao
    SQL.Strings = (
      'update cep set'
      #9'nu_cep = :nu_cep, '
      #9'ds_logradouro = :ds_logradouro, '
      #9'ds_complemento = :ds_complemento, '
      #9'ds_bairro = :ds_bairro, '
      #9'ds_localidade = :ds_localidade, '
      #9'ds_uf = :ds_uf, '
      #9'tp_situacao = :tp_situacao, '
      #9'updated_at = :updated_at'
      'where '
      #9'id_cep = :id_cep')
    Params = <
      item
        Name = 'nu_cep'
      end
      item
        Name = 'ds_logradouro'
      end
      item
        Name = 'ds_complemento'
      end
      item
        Name = 'ds_bairro'
      end
      item
        Name = 'ds_localidade'
      end
      item
        Name = 'ds_uf'
      end
      item
        Name = 'tp_situacao'
      end
      item
        Name = 'updated_at'
      end
      item
        Name = 'id_cep'
      end>
    Left = 128
    Top = 247
    ParamData = <
      item
        Name = 'nu_cep'
      end
      item
        Name = 'ds_logradouro'
      end
      item
        Name = 'ds_complemento'
      end
      item
        Name = 'ds_bairro'
      end
      item
        Name = 'ds_localidade'
      end
      item
        Name = 'ds_uf'
      end
      item
        Name = 'tp_situacao'
      end
      item
        Name = 'updated_at'
      end
      item
        Name = 'id_cep'
      end>
  end
  object qyCepConsultar: TZQuery
    Connection = zConexao
    SQL.Strings = (
      'select '
      '     id_cep,'
      '     nu_cep,'
      '     ds_logradouro,'
      '     ds_complemento,'
      '     ds_bairro,'
      '     ds_localidade,'
      '     ds_uf,'
      '     tp_situacao'
      'from cep'
      'where '
      'tp_situacao <> '#39'E'#39)
    Params = <>
    Left = 128
    Top = 303
    object qyCepConsultarid_cep: TZIntegerField
      FieldName = 'id_cep'
    end
    object qyCepConsultarnu_cep: TZUnicodeStringField
      FieldName = 'nu_cep'
    end
    object qyCepConsultards_logradouro: TZUnicodeStringField
      FieldName = 'ds_logradouro'
      Size = 150
    end
    object qyCepConsultards_complemento: TZUnicodeStringField
      FieldName = 'ds_complemento'
      Size = 30
    end
    object qyCepConsultards_bairro: TZUnicodeStringField
      FieldName = 'ds_bairro'
      Size = 50
    end
    object qyCepConsultards_localidade: TZUnicodeStringField
      FieldName = 'ds_localidade'
      Size = 150
    end
    object qyCepConsultards_uf: TZUnicodeStringField
      FieldName = 'ds_uf'
      Size = 2
    end
    object qyCepConsultartp_situacao: TZUnicodeStringField
      FieldName = 'tp_situacao'
      Size = 1
    end
  end
  object qyCepApagar: TZQuery
    Connection = zConexao
    SQL.Strings = (
      'update cep set'
      #9'tp_situacao = :tp_situacao, '
      #9'updated_at = :updated_at,'
      '                deleted_at = :deleted_at'
      'where '
      #9'id_cep = :id_cep')
    Params = <
      item
        Name = 'tp_situacao'
      end
      item
        Name = 'updated_at'
      end
      item
        Name = 'deleted_at'
      end
      item
        Name = 'id_cep'
      end>
    Left = 128
    Top = 351
    ParamData = <
      item
        Name = 'tp_situacao'
      end
      item
        Name = 'updated_at'
      end
      item
        Name = 'deleted_at'
      end
      item
        Name = 'id_cep'
      end>
  end
  object qyCepVerificar: TZQuery
    Connection = zConexao
    SQL.Strings = (
      'select id_cep, nu_cep,'
      '     ds_logradouro,'
      '     ds_complemento,'
      '     ds_bairro,'
      '     ds_localidade,'
      '     ds_uf,'
      '     tp_situacao'
      ' from cep '
      'where'
      'nu_cep = :nu_cep')
    Params = <
      item
        Name = 'nu_cep'
      end>
    Left = 128
    Top = 399
    ParamData = <
      item
        Name = 'nu_cep'
      end>
    object qyCepVerificarid_cep: TZIntegerField
      FieldName = 'id_cep'
    end
    object qyCepVerificarnu_cep: TZUnicodeStringField
      FieldName = 'nu_cep'
    end
    object qyCepVerificards_logradouro: TZUnicodeStringField
      FieldName = 'ds_logradouro'
      Size = 150
    end
    object qyCepVerificards_complemento: TZUnicodeStringField
      FieldName = 'ds_complemento'
      Size = 30
    end
    object qyCepVerificards_bairro: TZUnicodeStringField
      FieldName = 'ds_bairro'
      Size = 50
    end
    object qyCepVerificards_localidade: TZUnicodeStringField
      FieldName = 'ds_localidade'
      Size = 150
    end
    object qyCepVerificards_uf: TZUnicodeStringField
      FieldName = 'ds_uf'
      Size = 2
    end
    object qyCepVerificartp_situacao: TZUnicodeStringField
      FieldName = 'tp_situacao'
      Size = 1
    end
  end
  object qyEndCompVerificar: TZQuery
    Connection = zConexao
    SQL.Strings = (
      'select id_cep, nu_cep,'
      '     ds_logradouro,'
      '     ds_complemento,'
      '     ds_bairro,'
      '     ds_localidade,'
      '     ds_uf,'
      '     tp_situacao'
      ' from cep '
      'where'
      'ds_logradouro = :ds_logradouro'
      'and ds_localidade = :ds_localidade'
      'and ds_uf = :ds_uf')
    Params = <
      item
        Name = 'ds_logradouro'
      end
      item
        Name = 'ds_localidade'
      end
      item
        Name = 'ds_uf'
      end>
    Left = 128
    Top = 447
    ParamData = <
      item
        Name = 'ds_logradouro'
      end
      item
        Name = 'ds_localidade'
      end
      item
        Name = 'ds_uf'
      end>
    object qyEndCompVerificarid_cep: TZIntegerField
      FieldName = 'id_cep'
    end
    object qyEndCompVerificarnu_cep: TZUnicodeStringField
      FieldName = 'nu_cep'
    end
    object qyEndCompVerificards_logradouro: TZUnicodeStringField
      FieldName = 'ds_logradouro'
      Size = 150
    end
    object qyEndCompVerificards_complemento: TZUnicodeStringField
      FieldName = 'ds_complemento'
      Size = 30
    end
    object qyEndCompVerificards_bairro: TZUnicodeStringField
      FieldName = 'ds_bairro'
      Size = 50
    end
    object qyEndCompVerificards_localidade: TZUnicodeStringField
      FieldName = 'ds_localidade'
      Size = 150
    end
    object qyEndCompVerificards_uf: TZUnicodeStringField
      FieldName = 'ds_uf'
      Size = 2
    end
    object qyEndCompVerificartp_situacao: TZUnicodeStringField
      FieldName = 'tp_situacao'
      Size = 1
    end
  end
end
