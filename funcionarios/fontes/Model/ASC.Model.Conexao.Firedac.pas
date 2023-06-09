unit ASC.Model.Conexao.Firedac;

interface

uses
  Winapi.Windows, inifiles, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.DB, Firedac.Stan.Intf, Firedac.Stan.Option,
  Firedac.Stan.Param, Firedac.Stan.Error, Firedac.Stan.Def, Firedac.DatS,
  Firedac.Phys.Intf,
  Firedac.DApt.Intf, Firedac.Comp.DataSet, Firedac.Comp.Client,
  Firedac.Phys.MySQLDef,
  Firedac.Phys, Firedac.Phys.MySQL;
type
  TModelConexaoFiredac = class
  private
    FConexao: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    function Connection: TCustomConnection;
  end;
  { TModelCpnexaoFiredac }
implementation
uses
  Vcl.Dialogs;
{ TModelConexaoFiredac }
function TModelConexaoFiredac.Connection: TCustomConnection;
begin
  Result := FConexao;
end;
constructor TModelConexaoFiredac.Create;
begin
  try
    FConexao := TFDConnection.Create(nil);
    FConexao.Params.Values['DriverID'] := 'Mysql';
    FConexao.Params.Values['Database'] := 'db_dados';
    FConexao.Params.Values['User_Name'] := 'root';
    FConexao.Params.Values['Password'] := '2512';
    FConexao.Params.Values['Server'] := 'localhost';
    FConexao.Params.Values['Port'] := '3306';
    FConexao.Connected := True;
  except
    on e:exception do
      ShowMessage('Erro Conexao: '+ e.Message);
  end;
end;
destructor TModelConexaoFiredac.Destroy;
begin
  FConexao.DisposeOf;
  inherited;
end;
end.
