unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider, Datasnap.DBClient,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDConnection1: TFDConnection;
    FDClientes: TFDQuery;
    FDPedidos: TFDQuery;
    FDPedidosNoPedido: TFDAutoIncField;
    FDPedidosDtEmissao: TDateField;
    FDPedidosCdCliente: TIntegerField;
    FDPedidosVlTotal: TBCDField;
    FDProdutos: TFDQuery;
    cdsPedidos: TClientDataSet;
    dspPedidos: TDataSetProvider;
    cdsPedidosNoPedido: TAutoIncField;
    cdsPedidosDtEmissao: TDateField;
    cdsPedidosCdCliente: TIntegerField;
    cdsPedidosVlTotal: TBCDField;
    FDPedProdutos: TFDQuery;
    dspPedProdutos: TDataSetProvider;
    cdsPedProdutos: TClientDataSet;
    FDPedProdutosSequencia: TFDAutoIncField;
    FDPedProdutosNoPedido: TIntegerField;
    FDPedProdutosCdProduto: TIntegerField;
    FDPedProdutosQtde: TBCDField;
    FDPedProdutosVlUnitário: TBCDField;
    FDPedProdutosVlTotal: TBCDField;
    cdsPedProdutosSequencia: TAutoIncField;
    cdsPedProdutosNoPedido: TIntegerField;
    cdsPedProdutosCdProduto: TIntegerField;
    cdsPedProdutosQtde: TBCDField;
    cdsPedProdutosVlUnitário: TBCDField;
    cdsPedProdutosVlTotal: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
