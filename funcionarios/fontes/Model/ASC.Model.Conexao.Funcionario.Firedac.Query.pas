unit ASC.Model.Conexao.Funcionario.Firedac.Query;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.DB, Firedac.Stan.Intf, Firedac.Stan.Option,
  Firedac.Stan.Param, Firedac.Stan.Error, Firedac.DatS, Firedac.Phys.Intf,
  Firedac.DApt.Intf, Firedac.Comp.DataSet, Firedac.Comp.Client,
  ASC.Model.Conexao.Firedac, Firedac.Phys.MySQLDef, Firedac.Phys,
  Firedac.Phys.MySQL, uDM;

type
  TModelFuncionario = class
  private
    // FConexao: TModelConexaoFiredac;
    FQuery: TFDQuery;

  public
    sqlString: string;
    constructor Create;
    destructor Destroy; override;
    function QryListaFuncionario(nome: String): TDataset;

    function QryIncluirEditarFuncionario(codFuncionario: integer;
  nomeFuncionario, emailFuncionario, sexofuncionario: string): TDataset;

    function QryExcluirFuncionario(codFuncionario: integer): TDataset;
  end;

implementation

uses
  Vcl.Dialogs;

{ TModelConexaoFiredacQuery }

constructor TModelFuncionario.Create;

begin
  // FQuery := TFDQuery.Create(nil);
end;

destructor TModelFuncionario.Destroy;
begin
  dm.Qry.DisposeOf;
  inherited;
end;

function TModelFuncionario.QryListaFuncionario(nome: String): TDataset;
begin
  try
    with dm.qryFuncionarios do
    begin
      close;
      sql.clear;
      sql.add('select id , nomefuncionario, emailfuncionario from funcionarios');
      sql.add('where nomefuncionario like ''%' + nome + '%''');
      open;
    end;
    Result := dm.qryFuncionarios;
  finally
    // dm.Qry.DisposeOf;
  end;

end;

function TModelFuncionario.QryExcluirFuncionario(codFuncionario: integer)
  : TDataset;
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

function TModelFuncionario.QryIncluirEditarFuncionario(codFuncionario: integer;
  nomeFuncionario, emailFuncionario, sexofuncionario: string): TDataset;
var
  vSqlString: string;
begin
  if codFuncionario = 0 then
  begin
    // incluit registro
    vSqlString := '';
    vSqlString := 'insert into funcionarios (nomefuncionario, emailfuncionario, sexofuncionario)'
      + 'values (:nomefuncionario, :emailfuncionario, :sexofuncionario)';

    with dm.Qry do
    begin
      close;
      sql.clear;
      sql.add(vSqlString);
      // parambyname('id').asInteger := codFuncionario;
      parambyname('nomefuncionario').asString := nomeFuncionario;
      parambyname('emailfuncionario').asString := emailFuncionario;
      parambyname('sexofuncionario').asString := sexoFuncionario;
      execsql;
    end;
    showmessage('Registro Incluido com sucesso!');
  end
  else
  begin
    // editar registro
    sqlString := '';
    sqlString := ' update funcionarios set ' +
      ' nomefuncionario = :nomefuncionario, ' +
      ' emailfuncionario = :emailfuncionario,  ' +
       ' sexofuncionario = :sexofuncionario,  ' +
      ' where id = :codFuncionario ';

    with dm.Qry do
    begin
      close;
      sql.clear;
      sql.add(sqlString);
      parambyname('codfuncionario').asInteger := codFuncionario;
      parambyname('nomefuncionario').asString := nomeFuncionario;
      parambyname('emailfuncionario').asString := emailFuncionario;
      parambyname('sexofuncionario').asString := sexoFuncionario;
      execsql;
    end;
    showmessage('Registro Alterado com sucesso!');
  end;
end;

end.
