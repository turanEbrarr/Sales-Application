object fAnaForm: TfAnaForm
  Left = 0
  Top = 0
  ActiveControl = btnSatis
  Caption = 'Turan Sat'#305#351
  ClientHeight = 376
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 451
    Top = 0
    Width = 108
    Height = 376
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 416
    ExplicitHeight = 369
    object btnSatis: TButton
      Left = 1
      Top = 1
      Width = 106
      Height = 74
      Align = alTop
      Caption = 'Sat'#305#351
      TabOrder = 0
      OnClick = btnSatisClick
    end
    object btnUrun: TButton
      Left = 1
      Top = 75
      Width = 106
      Height = 74
      Align = alTop
      Caption = #220'r'#252'n'
      TabOrder = 1
      OnClick = btnUrunClick
    end
    object btnKasa: TButton
      Left = 1
      Top = 149
      Width = 106
      Height = 74
      Align = alTop
      Caption = 'Stok '#199#305'k'#305#351' Rapor'
      TabOrder = 2
      OnClick = btnKasaClick
    end
    object btnCari: TButton
      Left = 1
      Top = 223
      Width = 106
      Height = 74
      Align = alTop
      Caption = 'Cari'
      TabOrder = 3
      OnClick = btnCariClick
    end
    object btnKasaRaporu: TButton
      Left = 1
      Top = 297
      Width = 106
      Height = 74
      Align = alTop
      Caption = 'Kasa Raporu'
      TabOrder = 4
      OnClick = btnKasaRaporuClick
    end
  end
end
