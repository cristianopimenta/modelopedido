unit ASC.View.Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, ASC.Controller.Funcionario;

type
  TFrmFuncionario = class(TForm)
    GroupBox2: TGroupBox;
    edConsultaFuncionario: TEdit;
    btnPesqusiarCliente: TButton;
    GroupBox6: TGroupBox;
    dbGridFuncionario: TDBGrid;
    Panel1: TPanel;
    edNomeFuncionario: TEdit;
    edEmailFuncionario: TEdit;
    btnRegistro: TButton;
    btnCancelar: TButton;
    btnFechar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    cbSexo: TComboBox;
    procedure btnRegistroClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesqusiarClienteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbGridFuncionarioCellClick(Column: TColumn);
    procedure cbSexoCloseUp(Sender: TObject);
  private
    { Private declarations }
    vStatusRegistro: string;
    vSexoFuncionario: string;

  public
    { Public declarations }

    vCodFuncionario: integer;
    funcionarios: TControllerFuncionario;
    procedure salvarRegistro(codFuncionario: integer;
      statusRegistro, sexo: string);
    procedure novoRegistro(statusRegistro: string);
  end;

var
  FrmFuncionario: TFrmFuncionario;

implementation

{$R *.dfm}

uses uDm;

procedure TFrmFuncionario.btnCancelarClick(Sender: TObject);
begin
  if Assigned(funcionarios) then
    funcionarios.Destroy;
  edConsultaFuncionario.Text := '';
  edNomeFuncionario.Text := '';
  edEmailFuncionario.Text := '';
  btnRegistro.Caption := 'Inserir';
  vStatusRegistro := 'N';
end;

procedure TFrmFuncionario.btnFecharClick(Sender: TObject);
begin
  Close;
  if Assigned(funcionarios) then
    funcionarios.Destroy;
end;

procedure TFrmFuncionario.btnPesqusiarClienteClick(Sender: TObject);
begin
  vStatusRegistro := 'L';

  if not Assigned(funcionarios) then
    funcionarios := TControllerFuncionario.Create;

  funcionarios.Tipo := vStatusRegistro;

end;

procedure TFrmFuncionario.btnRegistroClick(Sender: TObject);
begin

  if btnRegistro.Caption = 'Inserir' then
  begin
    novoRegistro(vStatusRegistro);
  end
  else if btnRegistro.Caption = 'Salvar Registro' then
  begin
    salvarRegistro(vCodFuncionario, vStatusRegistro, vSexoFuncionario );
  end;
end;

procedure TFrmFuncionario.Button1Click(Sender: TObject);
begin
  vStatusRegistro := 'D';

  if not Assigned(funcionarios) then
    funcionarios := TControllerFuncionario.Create;

  funcionarios.Tipo := vStatusRegistro;
  funcionarios.vCodFuncionario := vCodFuncionario;

end;

procedure TFrmFuncionario.cbSexoCloseUp(Sender: TObject);
begin
 case cbSexo.ItemIndex of
    0:
      vSexoFuncionario := 'M';
    1:
      vSexoFuncionario := 'F';
  end;
end;

procedure TFrmFuncionario.dbGridFuncionarioCellClick(Column: TColumn);
begin
  vCodFuncionario := dbGridFuncionario.DataSource.DataSet.FieldByName
    ('codfuncionario').AsInteger;
end;

procedure TFrmFuncionario.FormCreate(Sender: TObject);
begin
  vStatusRegistro := 'N';
end;

procedure TFrmFuncionario.novoRegistro(statusRegistro: string);
begin
  edNomeFuncionario.setfocus;
  btnRegistro.Caption := 'Salvar Registro';
  vStatusRegistro := 'S';
end;

procedure TFrmFuncionario.salvarRegistro(codFuncionario: integer;
  statusRegistro, sexo: string);
begin
  dm.qry.Close;
  if not Assigned(funcionarios) then
    funcionarios := TControllerFuncionario.Create;

  funcionarios.Tipo := vStatusRegistro;
  funcionarios.NomeFuncionario := edNomeFuncionario.Text;
  funcionarios.EmailFuncionario := edEmailFuncionario.Text;
  funcionarios.SexoFuncionario := vSexoFuncionario;

  if codFuncionario < 1 then
    codFuncionario := 0;

  funcionarios.vCodFuncionario := codFuncionario;
  funcionarios.New;

end;

end.
