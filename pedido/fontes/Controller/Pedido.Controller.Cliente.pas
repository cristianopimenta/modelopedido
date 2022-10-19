unit Pedido.Controller.Cliente;

interface

uses Pedido.Model.Conexao.Firedac, System.Classes, Vcl.Forms,
  Pedido.Model.Conexao.Cliente.Firedac.Query, Pedido.View.Principal;

type
  TControllerCliente = class
  private
    FConexao: TModelConexaoFiredac;
    FQuery: TModelCliente;
    FNomeCliente: string;

    procedure SetNomeCliente(const Value: String);
    function GetNomeCliente: String;
  public
    constructor New;
    destructor Destroy; override;
    property NomeCliente: String read FNomeCliente write SetNomeCliente;
    procedure lista;

  end;

implementation

{ TControllerPedido }

destructor TControllerCliente.Destroy;
begin

  inherited Destroy;

end;

function TControllerCliente.GetNomeCliente: String;
begin
  Result := FNomeCliente;
end;

procedure TControllerCliente.lista;
begin
  if not Assigned(FConexao) then
    FConexao := TModelConexaoFiredac.Create;


  FQuery.QryListaCliente(FrmPedido.edconsultaCliente.text);
end;

constructor TControllerCliente.New;
begin
  inherited Create;
  lista;
end;

procedure TControllerCliente.SetNomeCliente(const Value: String);
begin
  FNomeCliente := Value;
end;

end.
