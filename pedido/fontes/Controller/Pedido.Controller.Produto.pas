unit Pedido.Controller.Produto;

interface

uses Pedido.Model.Conexao.Firedac, System.Classes, Vcl.Forms,
  Pedido.View.Principal, Pedido.Model.Conexao.Produto.Firedac.Query;

type
  TControllerProduto = class
  private
    FConexao: TModelConexaoFiredac;
    FQuery: TModelProduto;
    FCodigo: String;

    procedure SetCodigo(const Value: String);
    function GetCodigo: String;
  public
    constructor New;
    destructor Destroy; override;
    property Codigo: String read FCodigo write SetCodigo;
    procedure lista;

  end;

implementation

{ TControllerPedido }

destructor TControllerProduto.Destroy;
begin

  inherited Destroy;

end;

function TControllerProduto.GetCodigo: String;
begin
  Result := FCodigo;
end;

procedure TControllerProduto.lista;
var
 vLista : integer;
begin
  if not Assigned(FConexao) then
    FConexao := TModelConexaoFiredac.Create;

  FQuery.QryListaProduto(FrmPedido.edCodProduto.text);
end;

constructor TControllerProduto.New;
begin
  inherited Create;
  lista;
end;

procedure TControllerProduto.SetCodigo(const Value: String);
begin
  FCodigo := Value;
end;

end.
