Unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL;

type
  TFrmPrincipal = class(TForm)
    btnPedido: TButton;
    btnSair: TButton;
    procedure btnPedidoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Pedido.View.Principal, uDm;

procedure TFrmPrincipal.btnPedidoClick(Sender: TObject);
begin
  frmpedido.show;
end;

procedure TFrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  if dm.statusConexao = 0 then
    Application.Terminate;

end;

end.
