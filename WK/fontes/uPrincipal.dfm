object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 508
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 185
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlTopo'
    ShowCaption = False
    TabOrder = 0
    TabStop = True
    StyleElements = []
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 10
      Width = 710
      Height = 48
      Margins.Left = 5
      Margins.Top = 10
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 40
        Top = 10
        Width = 43
        Height = 18
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeCliente: TLabel
        Left = 248
        Top = 10
        Width = 3
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object lblCidade: TLabel
        Left = 248
        Top = 29
        Width = 3
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object DbeCdCliente: TDBEdit
        Left = 121
        Top = 8
        Width = 121
        Height = 21
        DataField = 'CdCliente'
        DataSource = DSPedidos
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 68
      Width = 710
      Height = 114
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 45
        Top = 20
        Width = 49
        Height = 18
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNomeProduto: TLabel
        Left = 248
        Top = 22
        Width = 3
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 45
        Top = 50
        Width = 29
        Height = 18
        Caption = 'Qtde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 45
        Top = 80
        Width = 70
        Height = 18
        Caption = 'Pre'#231'o Unit.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 308
        Top = 80
        Width = 68
        Height = 18
        Caption = 'Pre'#231'o Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBeProduto: TDBEdit
        Left = 124
        Top = 20
        Width = 121
        Height = 21
        DataField = 'CdProduto'
        DataSource = dsPedProdutos
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 124
        Top = 50
        Width = 121
        Height = 21
        DataField = 'Qtde'
        DataSource = dsPedProdutos
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 124
        Top = 80
        Width = 121
        Height = 21
        DataField = 'VlUnit'#225'rio'
        DataSource = dsPedProdutos
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 382
        Top = 80
        Width = 121
        Height = 21
        DataField = 'VlTotal'
        DataSource = dsPedProdutos
        ReadOnly = True
        TabOrder = 3
      end
      object Button2: TButton
        Left = 552
        Top = 80
        Width = 83
        Height = 25
        Action = actGravarProduto
        TabOrder = 4
      end
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 185
    Width = 720
    Height = 280
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlGrid'
    ParentShowHint = False
    ShowCaption = False
    ShowHint = False
    TabOrder = 1
    object DBGProdutos: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 710
      Height = 270
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabStop = False
      Align = alClient
      BiDiMode = bdLeftToRight
      DataSource = dsPedProdutosGrid
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgRowLines, dgRowSelect, dgCancelOnExit]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Trebuchet MS'
      TitleFont.Style = [fsBold]
      StyleElements = []
      OnExit = DBGProdutosExit
      Columns = <
        item
          Expanded = False
          FieldName = 'CdProduto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtde'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlUnit'#225'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlTotal'
          Visible = True
        end>
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 465
    Width = 720
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBottom'
    ShowCaption = False
    TabOrder = 2
    StyleElements = []
    DesignSize = (
      720
      43)
    object lblTotal: TLabel
      Left = 624
      Top = 8
      Width = 42
      Height = 18
      Anchors = [akRight, akBottom]
      Caption = 'Total : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 30
    end
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 83
      Height = 25
      Action = actCancelaEdicao
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 632
    Top = 232
    object actDel: TAction
      Caption = 'Delete'
      Enabled = False
      ShortCut = 46
      OnExecute = actDelExecute
    end
    object actEditar: TAction
      Caption = 'Editar'
      Enabled = False
      ShortCut = 13
    end
    object actNovoPedido: TAction
      Caption = 'Novo Pedido'
      Hint = 'Novo Pedido'
      ShortCut = 113
      OnExecute = actNovoPedidoExecute
    end
    object actCancelaEdicao: TAction
      Caption = 'Cancela Edi'#231#227'o'
      Hint = 'Cancela Edi'#231#227'o'
      ShortCut = 27
      OnExecute = actCancelaEdicaoExecute
    end
    object actGravarProduto: TAction
      Caption = 'Gravar Produto'
      ShortCut = 16397
      OnExecute = actGravarProdutoExecute
    end
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 573
    Top = 20
    object cdsPedidoNoPedido: TFDAutoIncField
      FieldName = 'NoPedido'
      Origin = 'NoPedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsPedidoDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'DtEmissao'
      Required = True
    end
    object cdsPedidoCdCliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CdCliente'
      Origin = 'CdCliente'
      OnValidate = cdsPedidoCdClienteValidate
    end
    object cdsPedidoVlTotal: TBCDField
      FieldName = 'VlTotal'
      Origin = 'VlTotal'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object DSPedidos: TDataSource
    DataSet = cdsPedido
    Left = 664
    Top = 20
  end
  object cdsPedProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedProdutos'
    Left = 568
    Top = 64
    object cdsPedProdutosSequencia: TAutoIncField
      FieldName = 'Sequencia'
      ReadOnly = True
    end
    object cdsPedProdutosNoPedido: TIntegerField
      FieldName = 'NoPedido'
    end
    object cdsPedProdutosCdProduto: TIntegerField
      FieldName = 'CdProduto'
      Required = True
      OnValidate = cdsPedProdutosCdProdutoValidate
    end
    object cdsPedProdutosQtde: TBCDField
      FieldName = 'Qtde'
      Required = True
      OnChange = cdsPedProdutosQtdeChange
      Precision = 4
      Size = 3
    end
    object cdsPedProdutosVlUnitário: TBCDField
      FieldName = 'VlUnit'#225'rio'
      Required = True
      OnChange = cdsPedProdutosQtdeChange
      currency = True
      Precision = 10
      Size = 2
    end
    object cdsPedProdutosVlTotal: TBCDField
      FieldName = 'VlTotal'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object dsPedProdutos: TDataSource
    DataSet = cdsPedProdutos
    Left = 669
    Top = 60
  end
  object cdsPedProdutosGrid: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CdProduto'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Qtde'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 4
        Size = 3
      end
      item
        Name = 'VlUnit'#225'rio'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 10
        Size = 2
      end
      item
        Name = 'VlTotal'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 10
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspPedProdutos'
    StoreDefs = True
    AfterPost = cdsPedProdutosGridAfterPost
    Left = 568
    Top = 104
    object IntegerField2: TIntegerField
      FieldName = 'CdProduto'
      Required = True
      OnValidate = cdsPedProdutosCdProdutoValidate
    end
    object cdsPedProdutosGridDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object BCDField1: TBCDField
      FieldName = 'Qtde'
      Required = True
      OnChange = cdsPedProdutosQtdeChange
      Precision = 4
      Size = 3
    end
    object BCDField2: TBCDField
      FieldName = 'VlUnit'#225'rio'
      Required = True
      OnChange = cdsPedProdutosQtdeChange
      currency = True
      Precision = 10
      Size = 2
    end
    object BCDField3: TBCDField
      FieldName = 'VlTotal'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object dsPedProdutosGrid: TDataSource
    DataSet = cdsPedProdutosGrid
    Left = 677
    Top = 108
  end
end
