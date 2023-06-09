object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 468
  Width = 881
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\pedido\libmySQL.dll'
    Left = 62
    Top = 96
  end
  object conexao: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=db_wk'
      'User_Name=root'
      'Password=171114'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 62
    Top = 26
  end
  object Qry: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT '
      'pe.codigo_item,'
      'pr.descricao, '
      'pe.codigo_produto,'
      ' pe.vlr_unitario,'
      ' pe.quantidade,'
      ' pe.vlr_total'
      ' FROM pedidos_produtos pe '
      'JOIN tb_produtos pr ON pr.codigo = pe.codigo_produto'
      'order by pe.codigo_item desc ')
    Left = 269
    Top = 22
    object Qrycodigo_item: TFDAutoIncField
      FieldName = 'codigo_item'
      Origin = 'codigo_item'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Qrydescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 50
    end
    object Qrycodigo_produto: TIntegerField
      FieldName = 'codigo_produto'
      Origin = 'codigo_produto'
      Required = True
    end
    object Qryvlr_unitario: TBCDField
      FieldName = 'vlr_unitario'
      Origin = 'vlr_unitario'
      Required = True
      Precision = 14
      Size = 2
    end
    object Qryquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
      Precision = 14
      Size = 2
    end
    object Qryvlr_total: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vlr_total'
      Origin = 'vlr_total'
      Precision = 14
      Size = 2
    end
  end
  object dsQry: TDataSource
    DataSet = Qry
    Left = 341
    Top = 24
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 339
    Top = 114
  end
  object qryCliente: TFDQuery
    Connection = conexao
    Left = 269
    Top = 102
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 374
    Top = 200
  end
  object qryProdutos: TFDQuery
    Connection = conexao
    Left = 275
    Top = 198
  end
  object qTotal: TFDQuery
    Connection = conexao
    Left = 461
    Top = 19
  end
  object qVazia: TFDQuery
    Connection = conexao
    Left = 480
    Top = 122
  end
  object qPedido: TFDQuery
    Connection = conexao
    SQL.Strings = (
      
        'SELECT max(codigo_pedido) as npedido from pedidos_dados_gerais  ' +
        'order by codigo_pedido desc')
    Left = 486
    Top = 192
    object qPedidonpedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'npedido'
      Origin = 'npedido'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryFuncionarios: TFDQuery
    Connection = conexao
    Left = 275
    Top = 278
  end
  object dsFuncionarios: TDataSource
    DataSet = qryFuncionarios
    Left = 382
    Top = 280
  end
end
