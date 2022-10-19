unit Pedido.Controller;

interface

uses Pedido.Model.Conexao.Firedac.Query, Pedido.Model.Conexao.Firedac;

type
  TControllerPedido = class
  private
    FConexao: TModelConexaoFiredac;
    FQuery: TModelConexaoFiredacQuery;
    FNome: string;
    FTipo: string;
    FCodigo: integer;
    FValor: Double;
    FQuantidade: integer;
    FCodItem: integer;
    FNPedido: integer;
    FTotal: Real;
    FCodCliente: integer;

    procedure SetNome(const Value: String);
    procedure SetTipo(const Value: String);
    procedure SetCodigo(Codigo: integer);
    procedure SetQuantidade(const Value: integer);
    procedure SetValor(const Value: Double);
    procedure SetCodItem(CodItem: integer);
    procedure SeNPedido(NPedido: integer);

    function GetTotal: Real;
    procedure SetTotal(Total: Real);

    procedure SetNPedido(const Value: integer);
    procedure SetCodCliente(const Value: integer);
  public
    constructor New;
    destructor Destroy; override;
    property Nome: String read FNome write SetNome;
    property Tipo: String read FTipo write SetTipo;
    property Codigo: integer read FCodigo write SetCodigo;
    property CodItem: integer read FCodItem write SetCodItem;
    property NPedido: integer read FNPedido write SetNPedido;
    property Valor: Double read FValor write SetValor;
    property Total: Real read FTotal write SetTotal;
    property Quantidade: integer read FQuantidade write SetQuantidade;
    procedure lista;

    property CodCliente: integer read FCodCliente write SetCodCliente;

  end;

implementation

{ TControllerPedido }

destructor TControllerPedido.Destroy;
begin
  inherited Destroy;
end;

function TControllerPedido.GetTotal: Real;
begin
  Result := Total;
end;

procedure TControllerPedido.lista;
begin
  if not Assigned(FConexao) then
    FConexao := TModelConexaoFiredac.Create;

  if Tipo = 'N' then
    FQuery.QryNovoPedido(CodCliente, Valor)

  else if Tipo = 'L' then
    FQuery.QryListaPedido(NPedido)
  else
  begin
    FQuery := TModelConexaoFiredacQuery.Create;
    FQuery.QryIncluirEditarItemPedido(CodItem, NPedido, Codigo, Quantidade,
      Valor, '');
    FQuery.QryListaPedido(NPedido);
  end;

  if Tipo = 'D' then
    FQuery.QryExcluirItemPedido(CodItem);

  FQuery.TotalPedido(NPedido);

end;

constructor TControllerPedido.New;
begin
  inherited Create;
  lista;
end;

procedure TControllerPedido.SeNPedido(NPedido: integer);
begin
  FNPedido := NPedido;
end;

procedure TControllerPedido.SetCodCliente(const Value: integer);
begin
  FCodCliente := Value;
end;

procedure TControllerPedido.SetCodigo(Codigo: integer);
begin
  FCodigo := Codigo;
end;

procedure TControllerPedido.SetCodItem(CodItem: integer);
begin
  FCodItem := CodItem;
end;

procedure TControllerPedido.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TControllerPedido.SetNPedido(const Value: integer);
begin
  FNPedido := Value;
end;

procedure TControllerPedido.SetQuantidade(const Value: integer);
begin
  FQuantidade := Value;
end;

procedure TControllerPedido.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TControllerPedido.SetTotal(Total: Real);
begin
  FTotal := Total;
end;

procedure TControllerPedido.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
