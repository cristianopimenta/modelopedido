program Pedido;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  Pedido.View.Principal in 'View\Pedido.View.Principal.pas' {FrmPedido},
  Pedido.Controller in 'Controller\Pedido.Controller.pas',
  Pedido.Model.Conexao.Firedac in 'Model\Pedido.Model.Conexao.Firedac.pas',
  Pedido.Model.Conexao.Firedac.Query in 'Model\Pedido.Model.Conexao.Firedac.Query.pas',
  uDm in 'Model\uDm.pas' {dm: TDataModule},
  Pedido.Controller.Cliente in 'Controller\Pedido.Controller.Cliente.pas',
  Pedido.Model.Conexao.Cliente.Firedac.Query in 'Model\Pedido.Model.Conexao.Cliente.Firedac.Query.pas',
  Pedido.Controller.Produto in 'Controller\Pedido.Controller.Produto.pas',
  Pedido.Model.Conexao.Produto.Firedac.Query in 'Model\Pedido.Model.Conexao.Produto.Firedac.Query.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmPedido, FrmPedido);
  Application.Run;
end.
