unit Pedido.Model.Conexao.Firedac.Query;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.DB, Firedac.Stan.Intf, Firedac.Stan.Option,
  Firedac.Stan.Param, Firedac.Stan.Error, Firedac.DatS, Firedac.Phys.Intf,
  Firedac.DApt.Intf, Firedac.Comp.DataSet, Firedac.Comp.Client,
  Pedido.Model.Conexao.Firedac, Firedac.Phys.MySQLDef, Firedac.Phys,
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
    function QryListaPedido(codpedido: integer): TDataset;

    function QryIncluirEditarItemPedido(codigoItem, codigoPedido, codigo,
      quantidade: integer; valor: double; descricao: String): TDataset;

    function QryExcluirItemPedido(codigo: integer): TDataset;
    function TotalPedido(nPedido: integer): TDataset;

    function QryNovoPedido(codigo_cliente: integer; valor_total: Real)
      : TDataset;

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

function TModelConexaoFiredacQuery.QryExcluirItemPedido(codigo: integer)
  : TDataset;
begin
  sqlString := 'delete from pedidos_produtos where codigo_item = :codigoItem';

  with dm.Qry do
  begin
    close;
    sql.clear;
    sql.add(sqlString);
    parambyname('codigoItem').asInteger := codigo;
    execsql
  end;

end;

function TModelConexaoFiredacQuery.QryIncluirEditarItemPedido(codigoItem,
  codigoPedido, codigo, quantidade: integer; valor: double; descricao: String)
  : TDataset;
begin
  if codigoItem = 0 then
  begin
    // incluit intem
    sqlString := '';
    sqlString :=
      'insert into pedidos_produtos (codigo_pedido, codigo_produto, quantidade, vlr_unitario, vlr_total)'
      + 'values (:codigo_pedido, :codigo_produto, :quantidade, :valor, :total)';

    with dm.Qry do
    begin
      close;
      sql.clear;
      sql.add(sqlString);
      parambyname('codigo_pedido').asInteger := codigoPedido;
      parambyname('codigo_produto').asInteger := codigo;
      parambyname('quantidade').asInteger := quantidade;
      parambyname('valor').asFloat := valor;
      parambyname('total').asFloat := quantidade * valor;
      execsql;
    end;
    showmessage('Item Incluido com sucesso!');
  end
  else
  begin
    // editar Item
    sqlString := '';
    sqlString := ' update pedidos_produtos set ' +
      ' codigo_item = :codigo_item, ' + ' codigo_produto = :codigo_produto,  ' +
      ' quantidade = :quantidade, ' + ' vlr_unitario = :valor, ' +
      ' vlr_total = :total where codigo_item = :codigo_item ';

    with dm.Qry do
    begin
      close;
      sql.clear;
      sql.add(sqlString);
      parambyname('codigo_item').asInteger := codigoItem;
      parambyname('codigo_produto').asInteger := codigo;
      parambyname('quantidade').asInteger := quantidade;
      parambyname('valor').asFloat := valor;
      parambyname('total').asFloat := quantidade * valor;
      execsql;
    end;
    showmessage('Item Alterado com sucesso!');
  end;
end;

function TModelConexaoFiredacQuery.QryListaPedido(codpedido: integer): TDataset;
var
  consulta: string;
  vNpedido: integer;
begin
  consulta :=
    'SELECT pe.codigo_item, pr.descricao, pe.codigo_produto, pe.vlr_unitario, pe.quantidade,'
    + ' pe.vlr_total, pe.codigo_pedido FROM pedidos_produtos pe ' +
    'JOIN tb_produtos pr ON pr.codigo = pe.codigo_produto ' +
    'where pe.codigo_pedido = :codpedido order by pe.codigo_item desc ';

  try
    with dm.Qry do
    begin
      close;
      sql.clear;
      sql.add(consulta);
      parambyname('codpedido').asInteger := codpedido;
      open;
    end;
    Result := dm.Qry;
  finally
    // dm.Qry.DisposeOf;
  end;

end;

function TModelConexaoFiredacQuery.QryNovoPedido(codigo_cliente: integer;
  valor_total: Real): TDataset;
begin
  with dm.qVazia do
  begin
    close;
    sql.clear;
    sql.add('insert into pedidos_dados_gerais (codigo_cliente, valor_total)');
    sql.add('values (:codigo_cliente, :valor_total)');
    parambyname('codigo_cliente').asInteger := codigo_cliente;
    parambyname('valor_total').asFloat := valor_total;
    execsql;
  end;
end;

function TModelConexaoFiredacQuery.TotalPedido(nPedido: integer): TDataset;
begin
  with dm.qTotal do
  begin
    close;
    sql.clear;
    sql.add('select codigo_pedido, sum(vlr_total) as total from pedidos_produtos');
    sql.add('where codigo_pedido = :npedido');
    parambyname('npedido').asInteger := nPedido;
    open;
  end;

  Result := dm.qTotal;
end;

end.
