object FrmFuncionario: TFrmFuncionario
  Left = 0
  Top = 0
  Caption = 'ASC - Funcion'#225'rios'
  ClientHeight = 283
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 734
    Height = 54
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 730
    object edConsultaFuncionario: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 353
      Height = 29
      Align = alLeft
      TabOrder = 0
      TextHint = 'Pesqusiar Funcionario'
      ExplicitHeight = 23
    end
    object btnPesqusiarCliente: TButton
      AlignWithMargins = True
      Left = 364
      Top = 20
      Width = 141
      Height = 29
      Align = alLeft
      Caption = 'Pesquisar Funcionario'
      TabOrder = 1
      OnClick = btnPesqusiarClienteClick
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 511
      Top = 21
      Width = 100
      Height = 29
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object GroupBox6: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 358
    Height = 217
    Align = alLeft
    Caption = 'Lista de Funcion'#225'rios Cadastrados'
    TabOrder = 1
    ExplicitHeight = 191
    object dbGridFuncionario: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 348
      Height = 192
      Hint = 
        'Clique duas vezes para selecionar o cliente e habilitar a inclus' +
        #227'o de novo pedido.'
      Align = alClient
      DataSource = dm.dsFuncionarios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = dbGridFuncionarioCellClick
    end
  end
  object Panel1: TPanel
    Left = 364
    Top = 60
    Width = 376
    Height = 223
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 372
    ExplicitHeight = 197
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 114
      Height = 15
      Caption = 'Nome do funcion'#225'rio'
    end
    object Label2: TLabel
      Left = 16
      Top = 65
      Width = 110
      Height = 15
      Caption = 'Email do funcion'#225'rio'
    end
    object Label3: TLabel
      Left = 16
      Top = 113
      Width = 25
      Height = 15
      Caption = 'Sexo'
    end
    object edNomeFuncionario: TEdit
      AlignWithMargins = True
      Left = 16
      Top = 36
      Width = 329
      Height = 23
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TextHint = 'Pesqusiar Funcionario'
    end
    object edEmailFuncionario: TEdit
      AlignWithMargins = True
      Left = 16
      Top = 84
      Width = 329
      Height = 23
      TabOrder = 1
      TextHint = 'Pesqusiar Funcionario'
    end
    object btnRegistro: TButton
      AlignWithMargins = True
      Left = 13
      Top = 180
      Width = 100
      Height = 29
      Caption = 'Inserir'
      TabOrder = 2
      OnClick = btnRegistroClick
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 128
      Top = 180
      Width = 100
      Height = 29
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnFechar: TButton
      AlignWithMargins = True
      Left = 243
      Top = 180
      Width = 100
      Height = 29
      Caption = '&Fechar'
      TabOrder = 4
      OnClick = btnFecharClick
    end
    object cbSexo: TComboBox
      Left = 16
      Top = 134
      Width = 329
      Height = 23
      TabOrder = 5
      Text = 'Sexo'
      OnCloseUp = cbSexoCloseUp
      Items.Strings = (
        'Masculino'
        'Feminino')
    end
  end
end
