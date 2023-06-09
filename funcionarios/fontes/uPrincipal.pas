Unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Funcionrios1: TMenuItem;
    Funcionarios1: TMenuItem;
    Funcionarios2: TMenuItem;
    Fechar1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure somasubsequentes;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses ASC.View.Funcionario, uDm;

procedure TFrmPrincipal.Fechar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  if dm.statusConexao = 0 then
    Application.Terminate;
end;

procedure TFrmPrincipal.Funcionarios1Click(Sender: TObject);
begin
  if not assigned(FrmFuncionario) then
    Application.CreateForm(TFrmFuncionario, FrmFuncionario);

    frmFuncionario.show;
end;

procedure TFrmPrincipal.somasubsequentes;
var
  numero, soma: Integer;
  i: Integer;
begin
  numero := 42; // Defina o número aqui
  soma := numero;

  for i := 1 to 100 do
  begin
    soma := soma + (numero + i);
  end;

  WriteLn('A soma do número ', numero, ' com os 100 subseqüentes é: ', soma);

  ReadLn;
end;

end.
