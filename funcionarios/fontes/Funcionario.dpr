program Funcionario;
uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  ASC.Controller in 'Controller\ASC.Controller.pas',
  uDm in 'Model\uDm.pas' {dm: TDataModule},
  ASC.Model.Conexao.Funcionario.Firedac.Query in 'Model\ASC.Model.Conexao.Funcionario.Firedac.Query.pas',
  ASC.View.Funcionario in 'View\ASC.View.Funcionario.pas' {FrmFuncionario},
  ASC.Controller.Funcionario in 'Controller\ASC.Controller.Funcionario.pas' {$R *.res},
  ASC.Model.Conexao.Firedac in 'Model\ASC.Model.Conexao.Firedac.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
