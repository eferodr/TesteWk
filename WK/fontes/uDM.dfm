object DM: TDM
  OldCreateOrder = False
  Height = 580
  Width = 816
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'D:\TESTE WK\exe\libmysql.dll'
    Left = 48
    Top = 88
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=teste'
      'User_Name=root'
      'Password=a123456*'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 156
  end
  object FDClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from Clientes'
      ''
      'where codigo = :codigo')
    Left = 616
    Top = 32
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 1
        Value = 1
      end>
  end
  object FDPedidos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from Pedidos'
      ''
      'where NOPedido = :NoPedido')
    Left = 240
    Top = 28
    ParamData = <
      item
        Name = 'NOPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object FDPedidosNoPedido: TFDAutoIncField
      FieldName = 'NoPedido'
      Origin = 'NoPedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDPedidosDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'DtEmissao'
      Required = True
    end
    object FDPedidosCdCliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CdCliente'
      Origin = 'CdCliente'
    end
    object FDPedidosVlTotal: TBCDField
      FieldName = 'VlTotal'
      Origin = 'VlTotal'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object FDProdutos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from Produtos'
      ''
      'where codigo = :codigo')
    Left = 648
    Top = 76
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 1
        Value = 1
      end>
  end
  object cdsPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedidos'
    Left = 400
    Top = 24
    object cdsPedidosNoPedido: TAutoIncField
      FieldName = 'NoPedido'
      ReadOnly = True
    end
    object cdsPedidosDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Required = True
    end
    object cdsPedidosCdCliente: TIntegerField
      FieldName = 'CdCliente'
    end
    object cdsPedidosVlTotal: TBCDField
      FieldName = 'VlTotal'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object dspPedidos: TDataSetProvider
    DataSet = FDPedidos
    Left = 320
    Top = 24
  end
  object FDPedProdutos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from PedProdutos'
      'where noPedido = :NoPedido')
    Left = 240
    Top = 84
    ParamData = <
      item
        Name = 'NOPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object FDPedProdutosSequencia: TFDAutoIncField
      FieldName = 'Sequencia'
      Origin = 'Sequencia'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDPedProdutosNoPedido: TIntegerField
      FieldName = 'NoPedido'
      Origin = 'NoPedido'
      Required = True
    end
    object FDPedProdutosCdProduto: TIntegerField
      FieldName = 'CdProduto'
      Origin = 'CdProduto'
      Required = True
    end
    object FDPedProdutosQtde: TBCDField
      FieldName = 'Qtde'
      Origin = 'Qtde'
      Required = True
      Precision = 4
      Size = 3
    end
    object FDPedProdutosVlUnitário: TBCDField
      FieldName = 'VlUnit'#225'rio'
      Origin = '`VlUnit'#225'rio`'
      Required = True
      Precision = 10
      Size = 2
    end
    object FDPedProdutosVlTotal: TBCDField
      FieldName = 'VlTotal'
      Origin = 'VlTotal'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object dspPedProdutos: TDataSetProvider
    DataSet = FDPedProdutos
    Left = 320
    Top = 88
  end
  object cdsPedProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedProdutos'
    Left = 408
    Top = 88
    object cdsPedProdutosSequencia: TAutoIncField
      FieldName = 'Sequencia'
      ReadOnly = True
    end
    object cdsPedProdutosNoPedido: TIntegerField
      FieldName = 'NoPedido'
      Required = True
    end
    object cdsPedProdutosCdProduto: TIntegerField
      FieldName = 'CdProduto'
      Required = True
    end
    object cdsPedProdutosQtde: TBCDField
      FieldName = 'Qtde'
      Required = True
      Precision = 4
      Size = 3
    end
    object cdsPedProdutosVlUnitário: TBCDField
      FieldName = 'VlUnit'#225'rio'
      Required = True
      Precision = 10
      Size = 2
    end
    object cdsPedProdutosVlTotal: TBCDField
      FieldName = 'VlTotal'
      Required = True
      Precision = 10
      Size = 2
    end
  end
end
