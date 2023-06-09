unit ASC.Model.Conexao.Firedac.QryFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.DB, Firedac.Stan.Intf, Firedac.Stan.Option,
  Firedac.Stan.Param, Firedac.Stan.Error, Firedac.DatS, Firedac.Phys.Intf,
  Firedac.DApt.Intf, Firedac.Comp.DataSet, Firedac.Comp.Client,
  ASC.Model.Conexao.Firedac, Firedac.Phys.MySQLDef, Firedac.Phys,
  Firedac.Phys.MySQL, uDM;

type
  TModelConexaoFiredacQuery = class
  private
    // FConexao: TModelConexaoFiredac;
    FQuery: TFDQuery;

  public
    sqlString: string;

    constructor Create;

    destructor Destroy; override;

    function QryListaFuncionario(codFuncionario: integer): TDataset;

    function QryIncluirEditarFuncionario(codFuncionario: integer;
      nomeFuncionario, emailFuncionario: string): TDataset;

    function QryExcluirFuncionario(codFuncionario: integer): TDataset;

  end;

implementation

uses
  Vcl.Dialogs;

{ TModelConexaoFiredacQuery }

constructor TModelConexaoFiredacQuery.Create;

begin
  // FQuery := TFDQuery.Create(nil);
end;

destructor TModelConexaoFiredacQuery.Destroy;
begin
  dm.Qry.DisposeOf;
  inherited;
end;

function TModelConexaoFiredacQuery.QryExcluirFuncionario(codFuncionario: integer):TDataset;
begin
  sqlString := 'delete from funcionarios where id = :codFuncionario';

  with dm.Qry do
  begin
    close;
    sql.clear;
    sql.add(sqlString);
    parambyname('codFuncionario').asInteger := codFuncionario;
    execsql
  end;

end;

function TModelConexaoFiredacQuery.QryIncluirEditarFuncionario
  (codFuncionario: integer; nomeFuncionario, emailFuncionario: string)
  : TDataset;
begin
  if codFuncionario = 0 then
  begin
    // incluit registro
    sqlString := '';
    sqlString := 'insert into funcionarios (nomefuncionario, emailfuncionario)'
      + 'values (:nomeFuncionario, :emailFuncionario)';

    with dm.Qry do
    begin
      close;
      sql.clear;
      sql.add(sqlString);
      parambyname('id').asInteger := codFuncionario;
      parambyname('nomeFuncionario').asString := nomeFuncionario;
      parambyname('emailFuncionario').asString := emailFuncionario;
      execsql;
    end;
    showmessage('Registro Incluido com sucesso!');
  end
  else
  begin
    // editar registro
    sqlString := '';
    sqlString := ' update funcionarios set ' +
      ' nomeFuncionario = :nomeFuncionario, ' +
      ' emailFuncionario = :emailFuncionario,  ' +
      ' where id = :codFuncionario ';

    with dm.Qry do
    begin
      close;
      sql.clear;
      sql.add(sqlString);
      parambyname('codFuncionario').asInteger := codFuncionario;
      parambyname('nomeFuncionario').asString := nomeFuncionario;
      parambyname('emailFuncionario').asString := emailFuncionario;
      execsql;
    end;
    showmessage('Registro Alterado com sucesso!');
  end;
end;

function TModelConexaoFiredacQuery.QryListaFuncionario(codFuncionario: integer)
  : TDataset;
var
  consulta: string;
  vNpedido: integer;
begin
  consulta := 'SELECT * from funcionarios ' +
    'where id = :codFuncionario order by id desc ';

  try
    with dm.Qry do
    begin
      close;
      sql.clear;
      sql.add(consulta);
      parambyname('codFuncionario').asInteger := codFuncionario;
      open;
    end;
    Result := dm.Qry;
  finally
    // dm.Qry.DisposeOf;
  end;

end;

end.
