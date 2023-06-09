object FrmPedido: TFrmPedido
  Left = 0
  Top = 0
  ActiveControl = edconsultaCliente
  Caption = 'Pedidos - N'#250'mero Pedido: (aguardando inclus'#227'o de novo pedido)'
  ClientHeight = 672
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Roboto'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object lbAjuda: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 649
    Width = 938
    Height = 20
    Align = alBottom
    Caption = 'Sr. Ajuda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -17
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    ExplicitTop = 650
    ExplicitWidth = 69
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 553
    Width = 938
    Height = 90
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 928
      Height = 13
      Align = alTop
      Alignment = taRightJustify
      Caption = 'Total'
      ExplicitLeft = 911
      ExplicitWidth = 26
    end
    object lbTotal: TLabel
      AlignWithMargins = True
      Left = 260
      Top = 37
      Width = 673
      Height = 48
      Align = alClient
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 878
      ExplicitWidth = 59
      ExplicitHeight = 33
    end
    object btnListar: TButton
      AlignWithMargins = True
      Left = 133
      Top = 37
      Width = 121
      Height = 48
      Align = alLeft
      Caption = 'Listar Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnListarClick
    end
    object btnFechar: TButton
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 122
      Height = 48
      Align = alLeft
      Caption = 'Fechar Pedido'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnFecharClick
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 938
    Height = 54
    Align = alTop
    TabOrder = 1
    object edconsultaCliente: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 353
      Height = 31
      Align = alLeft
      TabOrder = 0
      TextHint = 'Pesqusiar cliente'
      OnChange = edconsultaClienteChange
      ExplicitHeight = 21
    end
    object btnPesqusiarCliente: TButton
      AlignWithMargins = True
      Left = 364
      Top = 18
      Width = 122
      Height = 31
      Align = alLeft
      Caption = 'Pesquisar Cliente'
      TabOrder = 1
      OnClick = btnPesqusiarClienteClick
    end
    object btnGravarPedido: TButton
      AlignWithMargins = True
      Left = 492
      Top = 18
      Width = 109
      Height = 31
      Align = alLeft
      Caption = 'Novo Pedido'
      Enabled = False
      TabOrder = 2
      OnClick = btnGravarPedidoClick
    end
    object Button2: TButton
      Left = 800
      Top = 29
      Width = 137
      Height = 25
      Caption = 'Consultar Pedido'
      TabOrder = 3
      OnClick = Button2Click
    end
    object nPedido: TEdit
      Left = 800
      Top = 6
      Width = 139
      Height = 21
      Enabled = False
      TabOrder = 4
    end
  end
  object pnConteudo: TPanel
    Left = 0
    Top = 171
    Width = 944
    Height = 379
    Align = alClient
    Color = clWhite
    Enabled = False
    ParentBackground = False
    TabOrder = 2
    object GroupBox4: TGroupBox
      Left = 1
      Top = 1
      Width = 297
      Height = 377
      Align = alLeft
      TabOrder = 0
      object GroupBox5: TGroupBox
        Left = 2
        Top = 118
        Width = 293
        Height = 257
        Align = alClient
        Caption = 'Produtos Cadastrados'
        TabOrder = 0
        object DBGrid2: TDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 283
          Height = 234
          Align = alClient
          DataSource = dm.dsProdutos
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Roboto'
          TitleFont.Style = []
        end
      end
      object GroupBox3: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 287
        Height = 97
        Align = alTop
        Caption = 'Informe os Itens do seu pedido'
        TabOrder = 1
        object edCodProduto: TEdit
          Left = 3
          Top = 26
          Width = 137
          Height = 21
          TabOrder = 0
          TextHint = 'C'#243'digo Produto'
          OnChange = edCodProdutoChange
        end
        object edQuantidade: TEdit
          Left = 146
          Top = 26
          Width = 137
          Height = 21
          TabOrder = 1
          TextHint = 'Quantidade'
        end
        object edVlrUnitario: TEdit
          Left = 3
          Top = 55
          Width = 137
          Height = 21
          TabOrder = 2
          TextHint = 'Valor Unit'#225'rio'
        end
        object btnSalvar2: TButton
          Left = 147
          Top = 53
          Width = 137
          Height = 25
          Caption = 'Incluir Item'
          Enabled = False
          TabOrder = 3
          OnClick = btnSalvar2Click
        end
      end
    end
    object dbgPedido: TDBGrid
      AlignWithMargins = True
      Left = 301
      Top = 4
      Width = 639
      Height = 371
      Align = alClient
      DataSource = dm.dsQry
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      OnCellClick = dbgPedidoCellClick
      OnKeyDown = dbgPedidoKeyDown
      OnKeyPress = dbgPedidoKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo_item'
          Title.Caption = 'Item'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo_produto'
          ReadOnly = True
          Title.Caption = 'C'#243'd. Produto'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlr_unitario'
          Title.Caption = 'Vlr Unit.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Qtd'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlr_total'
          ReadOnly = True
          Title.Caption = 'Vlr. Total'
          Width = 64
          Visible = True
        end>
    end
  end
  object GroupBox6: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 938
    Height = 105
    Align = alTop
    Caption = 'Lista de Clientes Cadastrados'
    TabOrder = 3
    object dbGridCliente: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 928
      Height = 82
      Hint = 
        'Clique duas vezes para selecionar o cliente e habilitar a inclus' +
        #227'o de novo pedido.'
      Align = alClient
      DataSource = dm.dsCliente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Roboto'
      TitleFont.Style = []
      OnDblClick = dbGridClienteDblClick
    end
  end
end
