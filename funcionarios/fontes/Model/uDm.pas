unit uDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  Tdm = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    conexao: TFDConnection;
    Qry: TFDQuery;
    dsQry: TDataSource;
    dsCliente: TDataSource;
    qryCliente: TFDQuery;
    dsProdutos: TDataSource;
    qryProdutos: TFDQuery;
    Qrydescricao: TStringField;
    Qrycodigo_produto: TIntegerField;
    Qryvlr_unitario: TBCDField;
    Qryquantidade: TBCDField;
    Qryvlr_total: TBCDField;
    Qrycodigo_item: TFDAutoIncField;
    qTotal: TFDQuery;
    qVazia: TFDQuery;
    qPedido: TFDQuery;
    qPedidonpedido: TIntegerField;
    qryFuncionarios: TFDQuery;
    dsFuncionarios: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    statusConexao : integer;
    function LoadConfig(): string;
  end;

var
  dm: Tdm;

implementation

uses
  System.IniFiles, Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
var
  retorno : string;
begin
  retorno := LoadConfig;
  if retorno <> 'OK' then
    ShowMessage(retorno);
end;



function Tdm.LoadConfig: string;
var
  arq_ini, base, UserName, Password, driver, serverDB: string;
  ini: TIniFile;
  oParams: TStrings;
begin
  conexao.Connected := False;
  try
    arq_ini := System.SysUtils.GetCurrentDir + '\servidor.ini';

    if NOT FileExists(arq_ini) then
    begin
      Result := 'Arquivo INI não encontrado: ' + arq_ini;
      exit;
    end;

    ini := TIniFile.Create(arq_ini);

    driver := ini.ReadString('Banco de Dados', 'DriverID', '');
    base := ini.ReadString('Banco de Dados', 'Database', '');
    serverDB := ini.ReadString('Banco de Dados', 'Server', '');
    UserName := ini.ReadString('Banco de Dados', 'UserName', '');
    Password := ini.ReadString('Banco de Dados', 'Password', '');

    try
       with dm.conexao do
        begin
        Params.Values['DriverID'] := driver;
        Params.Values['Server'] := serverDB;
        Params.Values['Database'] := base;
        Params.Values['User_Name'] := UserName;
        Params.Values['Password'] := Password;
        Connected := True;
        end;

      { with conexao.Params as TFDPhysMySQLConnectionDefParams do
        begin
        // Protocol := ipTCPIP;
        DriverID := 'MySql';
        Server := serverDB;
        Database := base;
        UserName := UserName;
        Password := Password;
        Port := 3306;
        end; }
      // Result := 'OK';
      // conexao.Connected := True;

      if conexao.Connected then
      begin
        Result := 'OK';
        statusConexao := 1;
      end
      else
      begin
        statusConexao := 0;
        Result := 'Erro ao conectar com o banco de dados';
        abort;
      end;
    except
      on ex: exception do
        Result := 'Erro ao conectar com o banco de dados: ' + ex.Message;
    end;
  finally
    ini.DisposeOf;
  end;
end;

end.
