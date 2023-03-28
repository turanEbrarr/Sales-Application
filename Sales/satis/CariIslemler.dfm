object fCariIslemler: TfCariIslemler
  Left = 0
  Top = 0
  Caption = 'Cari '#304#351'lemler'
  ClientHeight = 283
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 99
    Width = 61
    Height = 13
    Caption = 'Tutar Giriniz:'
  end
  object Label2: TLabel
    Left = 24
    Top = 179
    Width = 74
    Height = 13
    Caption = 'Tahsilat '#304'ndirimi'
  end
  object Edit1: TEdit
    Left = 120
    Top = 96
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 120
    Top = 176
    Width = 233
    Height = 21
    TabOrder = 1
  end
  object rbtnTahsilat: TRadioButton
    Left = 32
    Top = 24
    Width = 113
    Height = 17
    Caption = 'Tahsil Et'
    TabOrder = 2
  end
  object rbtnOdeme: TRadioButton
    Left = 240
    Top = 24
    Width = 113
    Height = 17
    Caption = #214'deme Yap'
    TabOrder = 3
  end
  object btnOnayla: TButton
    Left = 24
    Top = 216
    Width = 329
    Height = 41
    Caption = 'Onayla'
    TabOrder = 4
    OnClick = btnOnaylaClick
  end
end
