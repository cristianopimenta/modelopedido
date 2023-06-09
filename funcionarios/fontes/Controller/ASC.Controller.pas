unit ASC.Controller;

interface

uses ASC.Model.Conexao.Funcionario.Firedac.Query, ASC.Model.Conexao.Firedac;

type
  TControllerFuncionario = class
  private
    FConexao: TModelConexaoFiredac;
    FQuery: TModelFuncionario;
    FNomeFuncionario: string;
    FEmailFuncionario: string;
    FCodFuncionario: integer;
    FTipo: string;
    FSexoFuncionario: string;

    procedure SetTipo(const Value: String);
    procedure SetNomeFuncionario(const Value: String);
    procedure SetCodFuncionario(CodFuncionario: integer);
    procedure SetEmailFuncionario(const Value: String);
    procedure SetSexoFuncionario(const Value: String);

  public
    constructor New;
    destructor Destroy; override;

    property Tipo: String read FTipo write SetTipo;
    property NomeFuncionario: String read FNomeFuncionario
      write SetNomeFuncionario;
    property EmailFuncionario: String read FEmailFuncionario
      write SetEmailFuncionario;
    property CodFuncionario: integer read FCodFuncionario
      write SetCodFuncionario;

    property SexoFuncionario: string read FSexoFuncionario
      write SetSexoFuncionario;

    procedure lista;

  end;

implementation

{ TControllerPedido }

destructor TControllerFuncionario.Destroy;
begin
  inherited Destroy;
end;

procedure TControllerFuncionario.lista;
begin
  if not Assigned(FConexao) then
    FConexao := TModelConexaoFiredac.Create;

  if Tipo = 'D' then
    FQuery.QryExcluirFuncionario(CodFuncionario)
  else
  begin
    FQuery.QryIncluirEditarFuncionario(CodFuncionario, NomeFuncionario,
      EmailFuncionario, SexoFuncionario );
  end;

end;

constructor TControllerFuncionario.New;
begin
  inherited Create;
  lista;
end;

procedure TControllerFuncionario.SetCodFuncionario(CodFuncionario: integer);
begin
  FCodFuncionario := CodFuncionario;
end;

procedure TControllerFuncionario.SetEmailFuncionario(const Value: String);
begin
  FEmailFuncionario := Value;
end;

procedure TControllerFuncionario.SetNomeFuncionario(const Value: String);
begin
  FNomeFuncionario := Value;
end;

procedure TControllerFuncionario.SetSexoFuncionario(const Value: String);
begin
  FSexoFuncionario := Value;
end;

procedure TControllerFuncionario.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
