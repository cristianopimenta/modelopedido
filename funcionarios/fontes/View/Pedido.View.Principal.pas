unit Pedido.View.Principal;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ASC.Controller, FireDAC.Phys.MySQLDef,
  FireDAC.Phys, FireDAC.Phys.MySQL;

type
  TFrmPedido = class(TForm)
    GroupBox1: TGroupBox;
    btnListar: TButton;
    GroupBox2: TGroupBox;
    edconsultaCliente: TEdit;
    btnPesqusiarCliente: TButton;
    Label1: TLabel;
    lbTotal: TLabel;
    btnGravarPedido: TButton;
    btnFechar: TButton;
    Button2: TButton;
    nPedido: TEdit;
    pnConteudo: TPanel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox3: TGroupBox;
    edCodProduto: TEdit;
    edQuantidade: TEdit;
    edVlrUnitario: TEdit;
    btnSalvar2: TButton;
    dbgPedido: TDBGrid;
    lbAjuda: TLabel;
    GroupBox6: TGroupBox;
    dbGridCliente: TDBGrid;
    procedure btnSalvar2Click(Sender: TObject);
    procedure btnPesqusiarClienteClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edCodProdutoChange(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure dbgPedidoCellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure dbgPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure dbGridClienteDblClick(Sender: TObject);
    procedure edconsultaClienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    vCodItem: integer;
    pedidos: TControllerPedido;

  public
    { Public declarations }

  end;

var
  FrmPedido: TFrmPedido;

implementation

{$R *.dfm}

uses uDm, ASC.Controller.Funcionario, Winapi.Windows;
{ TFrmPedido }

procedure TFrmPedido.btnGravarPedidoClick(Sender: TObject);
begin
  dm.qPedido.close;

  btnGravarPedido.Enabled := false;
  btnFechar.Enabled := true;
  btnSalvar2.Enabled := true;
  nPedido.Enabled := false;
  pnConteudo.Enabled := true;

  if not Assigned(pedidos) then
    pedidos := TControllerPedido.Create;

  pedidos.Tipo := 'N';
  pedidos.CodCliente := dbGridCliente.DataSource.DataSet.FieldByName('codigo')
    .AsInteger;
  pedidos.Total := 0;
  pedidos.New;

  edCodProduto.SetFocus;
  edCodProduto.Text := '1';
  edQuantidade.Text := '1';

  lbAjuda.Caption :=
    'Atenção não se esqueça de preencher todos os itens para nosso pedido!';

  dm.qPedido.Open;
  nPedido.Text := IntToStr(dm.qPedido.FieldByName('npedido').AsInteger);
  FrmPedido.Caption := 'Pedidos - Número Pedido: ' +
    IntToStr(dm.qPedido.FieldByName('npedido').AsInteger);

end;

procedure TFrmPedido.btnListarClick(Sender: TObject);
begin
  edCodProduto.Text := '';
  Pedido.Controller.Produto.TControllerProduto.New;
end;

procedure TFrmPedido.btnPesqusiarClienteClick(Sender: TObject);
begin
  Pedido.Controller.Cliente.TControllerCliente.New;
  lbAjuda.Caption :=
    'Parabens agora clique duas vezes para selecionar o cliente e habilitar a inclusão de novo pedido.';
end;

procedure TFrmPedido.btnSalvar2Click(Sender: TObject);
begin
  if (edCodProduto.Text = '') or (edQuantidade.Text = '') or
    (edVlrUnitario.Text = '') then
  begin
    ShowMessage('Informar itens, preenchimento obrigatório!');
    edCodProduto.SetFocus;
    abort;
  end
  else
  begin
    pedidos := TControllerPedido.Create;
    pedidos.Codigo := StrToInt(edCodProduto.Text);
    pedidos.Quantidade := StrToInt(edQuantidade.Text);
    pedidos.Valor := StrToFloat(edVlrUnitario.Text);
    pedidos.CodItem := vCodItem;
    pedidos.nPedido := dm.qPedido.FieldByName('npedido').AsInteger;
    pedidos.New;
  end;

  lbTotal.Caption := FormatFloat('###0.00',
    dm.qtotal.FieldByName('total').asFloat);
end;

procedure TFrmPedido.btnFecharClick(Sender: TObject);
begin
  pedidos.Destroy;
  ShowMessage('Pedido Fechado');
  dm.qPedido.close;
  dm.Qry.close;
  dm.qryProdutos.close;
  lbTotal.Caption := '0,00';
  edCodProduto.Text := '';
  edCodProduto.Text := '';
  edQuantidade.Text := '';
  btnFechar.Enabled := false;
  nPedido.Enabled := true;
  pnConteudo.Enabled := false;
  lbAjuda.Caption := 'SUCESSO! Já pode abrir outro pedido!';

end;

procedure TFrmPedido.Button2Click(Sender: TObject);
begin

  if nPedido.Text = '' then
  begin
    lbAjuda.Caption := 'Oiee você precisa informar o número do pedido! ;)';
    nPedido.SetFocus;
    abort;
  end
  else
  begin

    pedidos := TControllerPedido.Create;
    pedidos.Tipo := 'L';
    pedidos.nPedido := StrToInt(nPedido.Text);
    pedidos.New;

    lbTotal.Caption := FormatFloat('###0.00',
      dm.qtotal.FieldByName('total').asFloat);
  end;

end;

procedure TFrmPedido.dbgPedidoCellClick(Column: TColumn);
begin
  edCodProduto.Text := IntToStr(dbgPedido.DataSource.DataSet.FieldByName
    ('codigo_produto').AsInteger);
  edVlrUnitario.Text := FloatToStr(dbgPedido.DataSource.DataSet.FieldByName
    ('vlr_unitario').asFloat);
  edQuantidade.Text := IntToStr(dbgPedido.DataSource.DataSet.FieldByName
    ('quantidade').AsInteger);
  vCodItem := dbgPedido.DataSource.DataSet.FieldByName('codigo_item').AsInteger;

  lbAjuda.Caption := 'Oiee para confirmar alteração não se esqueça do Enter!';
end;

procedure TFrmPedido.dbgPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_delete then
  begin
    if MessageDlg('Deseja Excluir esse Item', mtConfirmation, [mbYes, mbNo], 0)
      = mrYes then
    begin
      if not Assigned(pedidos) then
        pedidos := TControllerPedido.Create;

      pedidos.Tipo := 'D';
      pedidos.CodItem := dbgPedido.DataSource.DataSet.FieldByName('codigo_item')
        .AsInteger;
      pedidos.New;
    end;
  end;
  lbTotal.Caption := FormatFloat('###0.00',
    dm.qtotal.FieldByName('total').asFloat);
end;

procedure TFrmPedido.dbgPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin

    if not Assigned(pedidos) then
      pedidos := TControllerPedido.Create;
    pedidos.Tipo := '';
    pedidos.Codigo := dbgPedido.DataSource.DataSet.FieldByName('codigo_produto')
      .AsInteger;
    pedidos.Quantidade := dbgPedido.DataSource.DataSet.FieldByName('quantidade')
      .AsInteger;
    pedidos.Valor := dbgPedido.DataSource.DataSet.FieldByName
      ('vlr_unitario').asFloat;
    pedidos.CodItem := dbgPedido.DataSource.DataSet.FieldByName('codigo_item')
      .AsInteger;;
    pedidos.New;

  end;
  lbTotal.Caption := FormatFloat('###0.00',
    dm.qtotal.FieldByName('total').asFloat);
end;

procedure TFrmPedido.dbGridClienteDblClick(Sender: TObject);
begin
  if btnFechar.Enabled = false then
  begin
    btnGravarPedido.Enabled := true;
    ShowMessage('Cliente ' + dbGridCliente.DataSource.DataSet.FieldByName
      ('nome').AsString + #13 +
      'Foi selecionado, por favor Clique em Novo Pedido!');
  end
  else
    lbAjuda.Caption := 'agora para abrir novo pedido, feche o pedido atual!'
end;

procedure TFrmPedido.edCodProdutoChange(Sender: TObject);
begin
  Pedido.Controller.Produto.TControllerProduto.New;
end;

procedure TFrmPedido.edconsultaClienteChange(Sender: TObject);
begin
  lbAjuda.Caption :=
    'agora para pesquisar cliente, clique no botão Pesquisar Cliente!'
end;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
  Pedido.Controller.Cliente.TControllerCliente.New;
  lbAjuda.Caption :=
    'Olá, olha ja listei todos os clientes para você, mas se quiser um em particular clique no campo pesquisar cliente digite o nome dele e depois clique no botão Pesquisar Cliente! :)';
end;

end.
