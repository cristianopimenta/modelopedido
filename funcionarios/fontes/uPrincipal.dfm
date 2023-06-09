object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Funcionarios'
  ClientHeight = 411
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 312
    Top = 56
    object Funcionrios1: TMenuItem
      Caption = 'Cadastro'
      object Funcionarios1: TMenuItem
        Caption = 'Funcionarios'
        OnClick = Funcionarios1Click
      end
      object Funcionarios2: TMenuItem
        Caption = '-'
      end
      object Fechar1: TMenuItem
        Caption = '&Fechar'
        OnClick = Fechar1Click
      end
    end
  end
end
