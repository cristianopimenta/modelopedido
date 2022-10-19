object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 449
  Width = 766
  PixelsPerInch = 120
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\pedido\libmySQL.dll'
    Left = 48
    Top = 120
  end
  object conexao: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=db_wk'
      'User_Name=root'
      'Password=171114'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
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
    Left = 336
    Top = 48
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
    Left = 416
    Top = 40
  end
  object dsCliente: TDataSource
    DataSet = qryCliente
    Left = 424
    Top = 112
  end
  object qryCliente: TFDQuery
    Connection = conexao
    Left = 336
    Top = 128
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 448
    Top = 200
  end
  object qryProdutos: TFDQuery
    Connection = conexao
    Left = 344
    Top = 208
  end
  object qTotal: TFDQuery
    Connection = conexao
    Left = 576
    Top = 24
  end
  object qVazia: TFDQuery
    Connection = conexao
    Left = 600
    Top = 152
  end
  object qPedido: TFDQuery
    Connection = conexao
    SQL.Strings = (
      
        'SELECT max(codigo_pedido) as npedido from pedidos_dados_gerais  ' +
        'order by codigo_pedido desc')
    Left = 608
    Top = 240
    object qPedidonpedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'npedido'
      Origin = 'npedido'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
