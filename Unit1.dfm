object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Agenda de Contatos'
  ClientHeight = 468
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object lblNome: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object lblTelefone: TLabel
    Left = 216
    Top = 8
    Width = 44
    Height = 15
    Caption = 'Telefone'
  end
  object lblEmail: TLabel
    Left = 344
    Top = 8
    Width = 34
    Height = 15
    Caption = 'e-mail'
  end
  object lblBuscar: TLabel
    Left = 8
    Top = 416
    Width = 35
    Height = 15
    Caption = 'Buscar'
  end
  object lblListaContatos: TLabel
    Left = 8
    Top = 71
    Width = 91
    Height = 15
    Caption = 'Lista de Contatos'
  end
  object ListBoxContatos: TListBox
    Left = 8
    Top = 88
    Width = 585
    Height = 321
    ItemHeight = 15
    TabOrder = 6
  end
  object btnAdicionar: TButton
    Left = 358
    Top = 57
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 3
    OnClick = btnAdicionarClick
  end
  object edtNome: TEdit
    Left = 8
    Top = 24
    Width = 202
    Height = 23
    TabOrder = 0
  end
  object btnEditar: TButton
    Left = 438
    Top = 57
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 4
    OnClick = btnEditarClick
  end
  object btnRemover: TButton
    Left = 518
    Top = 57
    Width = 75
    Height = 25
    Caption = 'Remover'
    TabOrder = 5
    OnClick = btnRemoverClick
  end
  object btnBuscar: TButton
    Left = 440
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 8
    OnClick = btnBuscarClick
  end
  object edtTelefone: TEdit
    Left = 216
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object edtEmail: TEdit
    Left = 344
    Top = 24
    Width = 250
    Height = 23
    TabOrder = 2
  end
  object edtBuscar: TEdit
    Left = 8
    Top = 432
    Width = 423
    Height = 23
    TabOrder = 7
  end
  object btnAtualizar: TButton
    Left = 520
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 9
    OnClick = btnAtualizarClick
  end
end
