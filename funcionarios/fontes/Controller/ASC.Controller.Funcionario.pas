unit ASC.Controller.Funcionario;

interface

uses ASC.Model.Conexao.Firedac, System.Classes, Vcl.Forms,
  ASC.Model.Conexao.Funcionario.Firedac.Query;

type
  TControllerFuncionario = class
  private
    FConexao: TModelConexaoFiredac;
    FQuery: TModelFuncionario;
    FCodFuncionario: integer;
    FNomeFuncionario: string;
    FEmailFuncionario: string;
    FSexoFuncionario: string;
    FTipo: string;
    procedure SetNomeFuncionario(const Value: String);
    function GetNomeFuncionario: String;

    procedure SetSexoFuncionario(const Value: String);
    function GetSexoFuncionario: String;

    procedure SetEmailFuncionario(const Value: String);
    function GetEmailFuncionario: String;

    procedure SetTipo(const Value: String);

    procedure SetCodFuncionario(const Value: integer);
    function GetCodFuncionario: integer;

  public
    vCodFuncionario: integer;
    constructor New;
    destructor Destroy; override;
    property NomeFuncionario: String read FNomeFuncionario
      write SetNomeFuncionario;
    property EmailFuncionario: String read FEmailFuncionario
      write SetEmailFuncionario;

    property SexoFuncionario: String read FSexoFuncionario
      write SetSexoFuncionario;
    procedure lista;

    property Tipo: String read FTipo write SetTipo;

  end;

implementation

{ TControllerPedido }

uses ASC.View.Funcionario;

destructor TControllerFuncionario.Destroy;
begin
  inherited Destroy;
end;

function TControllerFuncionario.GetCodFuncionario: integer;
begin
  Result := FCodFuncionario;
end;

function TControllerFuncionario.GetEmailFuncionario: String;
begin
  Result := FEmailFuncionario;
end;

function TControllerFuncionario.GetNomeFuncionario: String;
begin
  Result := FNomeFuncionario;
end;

function TControllerFuncionario.GetSexoFuncionario: String;
begin
  Result := FSexoFuncionario;
end;

procedure TControllerFuncionario.lista;
begin
  if not Assigned(FConexao) then
    FConexao := TModelConexaoFiredac.Create;

  if Tipo = 'S' then
    FQuery.QryIncluirEditarFuncionario(vCodFuncionario, NomeFuncionario,
      EmailFuncionario, SexoFuncionario)

  else if Tipo = 'L' then
    FQuery.QryListaFuncionario(FrmFuncionario.edConsultaFuncionario.text)

  else if Tipo = 'D' then
    FQuery.QryExcluirFuncionario(vCodFuncionario);

end;

constructor TControllerFuncionario.New;
begin
  inherited Create;
  lista;
end;

procedure TControllerFuncionario.SetCodFuncionario(const Value: integer);
begin
  FCodFuncionario := Value;
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
