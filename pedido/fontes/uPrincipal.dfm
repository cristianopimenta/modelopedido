object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Pedidos - WK'
  ClientHeight = 411
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnPedido: TButton
    Left = 8
    Top = 24
    Width = 121
    Height = 49
    Caption = 'Pedido'
    TabOrder = 0
    OnClick = btnPedidoClick
  end
  object btnSair: TButton
    Left = 8
    Top = 79
    Width = 121
    Height = 49
    Caption = 'Sair'
    TabOrder = 1
    OnClick = btnSairClick
  end
end
