unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DMPrinc, Data.DB, System.Actions,
  Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, Vcl.Mask,
  Vcl.DBCtrls, Datasnap.DBClient, uDM, uFuncoes;

type
  TForm1 = class(TForm)
    pnlTopo: TPanel;
    pnlGrid: TPanel;
    pnlBottom: TPanel;
    DBGProdutos: TDBGrid;
    ActionList1: TActionList;
    actDel: TAction;
    actEditar: TAction;
    lblTotal: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lblNomeCliente: TLabel;
    lblCidade: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    lblNomeProduto: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cdsPedido: TClientDataSet;
    DSPedidos: TDataSource;
    cdsPedidoNoPedido: TFDAutoIncField;
    cdsPedidoDtEmissao: TDateField;
    cdsPedidoCdCliente: TIntegerField;
    cdsPedidoVlTotal: TBCDField;
    DbeCdCliente: TDBEdit;
    actNovoPedido: TAction;
    Button1: TButton;
    actCancelaEdicao: TAction;
    cdsPedProdutos: TClientDataSet;
    cdsPedProdutosSequencia: TAutoIncField;
    cdsPedProdutosNoPedido: TIntegerField;
    cdsPedProdutosCdProduto: TIntegerField;
    cdsPedProdutosQtde: TBCDField;
    cdsPedProdutosVlUnitário: TBCDField;
    cdsPedProdutosVlTotal: TBCDField;
    dsPedProdutos: TDataSource;
    DBeProduto: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    cdsPedProdutosGrid: TClientDataSet;
    IntegerField2: TIntegerField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    dsPedProdutosGrid: TDataSource;
    cdsPedProdutosGridDescricao: TStringField;
    actGravarProduto: TAction;
    Button2: TButton;
    procedure actDelExecute(Sender: TObject);
    procedure DBGProdutosExit(Sender: TObject);
    procedure FDPedProdutosAfterApplyUpdates(DataSet: TFDDataSet;
      AErrors: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cdsPedidoCdClienteValidate(Sender: TField);
    procedure actNovoPedidoExecute(Sender: TObject);
    procedure actCancelaEdicaoExecute(Sender: TObject);
    procedure cdsPedProdutosQtdeChange(Sender: TField);
    procedure cdsPedProdutosCdProdutoValidate(Sender: TField);
    procedure actGravarProdutoExecute(Sender: TObject);
    procedure cdsPedProdutosGridAfterPost(DataSet: TDataSet);
  private
    FVlrTotal: Currency;
    procedure SetVlrTotal(const Value: Currency);
    function ValidaCliente(Sender: TField):Boolean;
    procedure CancelaEdicaoPedido;
    procedure SelecionarPedido(NoPedido:Integer = 0);
    procedure SelecionarItems(NoPedido:Integer = 0);
    procedure CancelaEdicaoProduto;
    function ValidaProduto(Sender: TField): Boolean;
    { Private declarations }
  public
    { Public declarations }
  published
     property VlrTotal: Currency read FVlrTotal write SetVlrTotal;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.actCancelaEdicaoExecute(Sender: TObject);
begin
   CancelaEdicaoPedido;
end;

procedure TForm1.actDelExecute(Sender: TObject);
begin
   if MessageDlg('Confirma exclusão deste item?', mtWarning, [mbYes, MbNo],0) = mrYes then
   begin
      //exluir reggisitro.

      DBGProdutos.DataSource.DataSet.Refresh;
   end;
end;

procedure TForm1.actGravarProdutoExecute(Sender: TObject);
begin
  cdsPedProdutosGrid.Append;
  cdsPedProdutosGrid.FieldbyName('CdProduto' ).AsInteger := cdsPedProdutos.FieldbyName('CdProduto' ).AsInteger;
  cdsPedProdutosGrid.FieldbyName('Descricao' ).AsString  := lblNomeProduto.Caption;
  cdsPedProdutosGrid.FieldbyName('Qtde'      ).AsInteger := cdsPedProdutos.FieldbyName('Qtde'      ).AsInteger;
  cdsPedProdutosGrid.FieldbyName('VlUnitário').AsFloat   := cdsPedProdutos.FieldbyName('VlUnitário').AsFloat;
  cdsPedProdutosGrid.FieldbyName('VlTotal'   ).AsFloat   := cdsPedProdutos.FieldbyName('VlTotal'   ).AsFloat;
  cdsPedProdutosGrid.Post;
end;

procedure TForm1.actNovoPedidoExecute(Sender: TObject);
begin
   SelecionarPedido;
   SelecionarItems;
   lblNomeCliente.Caption := '';
   lblCidade.Caption := '';
   actCancelaEdicao.Enabled := False;
end;

procedure TForm1.CancelaEdicaoPedido;
begin
  DbeCdCliente.Clear;
  DbeCdCliente.SetFocus;
  DbeCdCliente.Focused;
  DbeCdCliente.ReadOnly := False;
  DbeCdCliente.Color := clWindow;
  DbeCdCliente.TabStop := True;
  cdsPedProdutosGrid.close;
  actNovoPedido.Execute;
end;

procedure TForm1.CancelaEdicaoProduto;
begin
  SelecionarItems;
  DBeProduto.SetFocus;
  DBeProduto.Focused;
end;

procedure TForm1.SelecionarItems(NoPedido: Integer);
begin
  try
    DM.FDPedprodutos.Active := False;
    Dm.FDPedprodutos.ParamByName('NoPedido').AsInteger := NoPedido;
    DM.cdsPedProdutos.Active := True;
    cdsPedProdutos.XMLData := dm.cdsPedProdutos.XMLData;
  finally
    Dm.FDPedprodutos.Active := False;
  end;
end;

procedure TForm1.SelecionarPedido(NoPedido:Integer = 0);
begin
  try
    DM.FDPedidos.Active := False;
    Dm.FDPedidos.ParamByName('NoPedido').AsInteger := NoPedido;
    DM.cdsPedidos.Active := True;
    cdsPedido.XMLData := dm.cdsPedidos.XMLData;
  finally
    Dm.FDPedidos.Active := False;
  end;
end;

procedure TForm1.cdsPedidoCdClienteValidate(Sender: TField);
begin
   if Sender.AsInteger > 0 then
   begin
     if not ValidaCliente(Sender) then
     begin
       CancelaEdicaoPedido;
     end;
   end else
   begin
      CancelaEdicaoPedido;
   end;
end;

procedure TForm1.cdsPedProdutosCdProdutoValidate(Sender: TField);
begin
   if Sender.AsInteger > 0 then
   begin
     if not ValidaProduto(Sender) then
     begin
       CancelaEdicaoProduto;
     end;
   end else
   begin
      CancelaEdicaoProduto;
   end;
end;

procedure TForm1.cdsPedProdutosGridAfterPost(DataSet: TDataSet);
var Total : Currency;
begin
   cdsPedProdutosGrid.DisableConstraints;
   try
     cdsPedProdutosGrid.First;
     Total := 0;
     while not cdsPedProdutosGrid.Eof do
     begin
        Total :=  Total + cdsPedProdutosGrid.FieldByName('VlTotal').AsCurrency;
        cdsPedProdutosGrid.Next;
     end;
     VlrTotal := Total;
   finally
     cdsPedProdutosGrid.Last;
     cdsPedProdutosGrid.EnableConstraints;
   end;
end;

procedure TForm1.cdsPedProdutosQtdeChange(Sender: TField);
begin
   cdsPedProdutosVlTotal.AsFloat :=  cdsPedProdutosQtde.AsFloat *
                                     cdsPedProdutosVlUnitário.AsFloat;
end;

procedure TForm1.DBGProdutosExit(Sender: TObject);
begin
   actEditar.Enabled := False;
   actDel.Enabled := False;
end;

procedure TForm1.FDPedProdutosAfterApplyUpdates(DataSet: TFDDataSet;
  AErrors: Integer);
var Total : Currency;
begin
   dataset.DisableConstraints;
   try
     dataset.First;
     Total := 0;
     while not DataSet.Eof do
     begin
        Total :=  Total + dataset.FieldByName('VlTotal').AsCurrency;
        dataset.Next;
     end;
     VlrTotal := Total;
   finally
     DataSet.Last;
     DataSet.EnableConstraints;
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   VlrTotal := 0;
   actNovoPedido.Execute;
end;

procedure TForm1.SetVlrTotal(const Value: Currency);
begin
   FVlrTotal := Value;
   LblTotal.caption :=  format('Total: %m',[value]);
end;

function TForm1.ValidaCliente(Sender: TField):Boolean;
var
  FdQuery: TFDQuery;
begin
  Result := False;
  FdQuery := CriaQuery('Select * from Clientes where codigo = ' + Sender.AsString);
  try
    FdQuery.Active := true;
    if FdQuery.RecordCount = 1 then
    begin
      lblNomeCliente.Caption := FdQuery.FieldByName('Nome').AsString;
      lblCidade.Caption := Format('%s - %s', [FdQuery.FieldByName('Cidade').AsString, FdQuery.FieldByName('UF').AsString]);
      DbeCdCliente.ReadOnly := True;
      DbeCdCliente.Color := clSilver;
      DbeCdCliente.TabStop := False;
      actCancelaEdicao.Enabled := true;
      cdsPedProdutosGrid.CreateDataSet;
      Result := True;
    end else
    begin
      MessageDlg('Cliente não encontrado', mtInformation, [mbOK],0);
      Result := False;
    end;
  finally
    FreeAndNil(FdQuery);
  end;
end;

function TForm1.ValidaProduto(Sender: TField):Boolean;
var
  FdQuery: TFDQuery;
begin
  Result := False;
  FdQuery := CriaQuery('Select * from Produtos where codigo = ' + Sender.AsString);
  try
    FdQuery.Active := true;
    if FdQuery.RecordCount = 1 then
    begin
      lblNomeProduto.Caption := FdQuery.FieldByName('Descricao').AsString;
      cdsPedProdutos.FieldByName('Qtde').AsFloat := 1;
      cdsPedProdutos.FieldByName('VlUnitário').AsFloat := FdQuery.FieldByName('PrecoVenda').AsFloat;
      Result := True;
    end else
    begin
      MessageDlg('Produto não encontrado', mtInformation, [mbOK],0);
      Result := False;
    end;
  finally
    FreeAndNil(FdQuery);
  end;
end;


end.
