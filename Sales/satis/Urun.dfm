object fUrun: TfUrun
  Left = 0
  Top = 0
  Caption = #220'r'#252'n'
  ClientHeight = 439
  ClientWidth = 998
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
    Left = 0
    Top = 0
    Width = 329
    Height = 439
    Align = alLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 44
      Width = 54
      Height = 13
      Caption = #220'r'#252'n Ad'#305'   :'
    end
    object Label2: TLabel
      Left = 8
      Top = 84
      Width = 55
      Height = 13
      Caption = 'Barkod      :'
    end
    object Label3: TLabel
      Left = 8
      Top = 124
      Width = 52
      Height = 13
      Caption = 'Fiyat        :'
    end
    object Label4: TLabel
      Left = 8
      Top = 167
      Width = 54
      Height = 13
      Caption = 'Adet         :'
    end
    object edtFiyat: TEdit
      Left = 83
      Top = 121
      Width = 225
      Height = 21
      TabOrder = 0
    end
    object edtUrunAdi: TEdit
      Left = 83
      Top = 41
      Width = 225
      Height = 21
      TabOrder = 1
    end
    object edtBarkod: TEdit
      Left = 83
      Top = 81
      Width = 225
      Height = 21
      TabOrder = 2
    end
    object edtAdet: TEdit
      Left = 83
      Top = 164
      Width = 225
      Height = 21
      TabOrder = 3
    end
    object btnEkle: TButton
      Left = 0
      Top = 228
      Width = 129
      Height = 37
      Caption = 'Ekle'
      TabOrder = 4
      OnClick = btnEkleClick
    end
    object btnGuncelle: TButton
      Left = 83
      Top = 271
      Width = 129
      Height = 37
      Caption = 'G'#252'ncelle'
      TabOrder = 5
      OnClick = btnGuncelleClick
    end
    object btnSil: TButton
      Left = 192
      Top = 314
      Width = 129
      Height = 37
      Caption = 'Sil'
      TabOrder = 6
    end
  end
  object edtAra: TEdit
    Left = 360
    Top = 44
    Width = 457
    Height = 21
    TabOrder = 1
    OnKeyPress = edtAraKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 360
    Top = 81
    Width = 457
    Height = 289
    DataSource = fDataModule.dsStokAra
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UrunAdi'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fiyat'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Barkod'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Adet'
        Width = 126
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 376
    Top = 392
    Width = 137
    Height = 25
    Caption = 'Stok '#199#305'k'#305#351' Raporu'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 544
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Eski Belge'
    TabOrder = 4
    OnClick = Button2Click
  end
end
