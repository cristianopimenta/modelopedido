unit Pedido.Model.Conexao.Cliente.Firedac.Query;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.DB, Firedac.Stan.Intf, Firedac.Stan.Option,
  Firedac.Stan.Param, Firedac.Stan.Error, Firedac.DatS, Firedac.Phys.Intf,
  Firedac.DApt.Intf, Firedac.Comp.DataSet, Firedac.Comp.Client,
  Pedido.Model.Conexao.Firedac, Firedac.Phys.MySQLDef, Firedac.Phys,
  Firedac.Phys.MySQL, uDM;

type
  TModelCliente = class
  private
    // FConexao: TModelConexaoFiredac;
    FQuery: TFDQuery;

  public
    sqlString: string;
    constructor Create;
    destructor Destroy; override;
    function QryListaCliente(nome: String): TDataset;
  end;

implementation

uses
  Vcl.Dialogs;

{ TModelConexaoFiredacQuery }

constructor TModelCliente.Create;

begin
  // FQuery := TFDQuery.Create(nil);
end;

destructor TModelCliente.Destroy;
begin
  dm.Qry.DisposeOf;
  inherited;
end;

function TModelCliente.QryListaCliente(nome: String)
  : TDataset;
begin
  try
    with dm.QryCliente do
    begin
      close;
      sql.clear;
      sql.add('select codigo "Codigo", nome "Nome", cidade "Cidade", uf "UF" from tb_clientes');
      sql.Add('where nome like ''%' + nome + '%''') ;
      open;
    end;
    Result := dm.QryCliente;
  finally
    // dm.Qry.DisposeOf;
  end;

end;

end.
