unit Pedido.Model.Conexao.Produto.Firedac.Query;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.DB, Firedac.Stan.Intf, Firedac.Stan.Option,
  Firedac.Stan.Param, Firedac.Stan.Error, Firedac.DatS, Firedac.Phys.Intf,
  Firedac.DApt.Intf, Firedac.Comp.DataSet, Firedac.Comp.Client,
  Pedido.Model.Conexao.Firedac, Firedac.Phys.MySQLDef, Firedac.Phys,
  Firedac.Phys.MySQL, uDM;

type
  TModelProduto = class
  private
    // FConexao: TModelConexaoFiredac;
    FQuery: TFDQuery;

  public
    sqlString: string;
    constructor Create;
    destructor Destroy; override;
    function QryListaProduto(codigo: String): TDataset;

  end;

implementation

uses
  Vcl.Dialogs;

{ TModelConexaoFiredacQuery }

constructor TModelProduto.Create;

begin
  // FQuery := TFDQuery.Create(nil);
end;

destructor TModelProduto.Destroy;
begin
  dm.Qry.DisposeOf;
  inherited;
end;

function TModelProduto.QryListaProduto(codigo: String): TDataset;
begin
  try
    with dm.QryProdutos do
    begin
      close;
      sql.clear;
      sql.add('select codigo "Codigo", descricao "Descrição" from tb_produtos');

      if codigo <> '' then
      begin
        sql.add('where codigo = :codigo');
        Params[0].Value := StrToInt(codigo);
      end;

      open;
    end;
    Result := dm.QryProdutos;
  finally
    // dm.Qry.DisposeOf;
  end;

end;

end.
