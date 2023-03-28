object fMusteri: TfMusteri
  Left = 0
  Top = 0
  Caption = 'Cari Ekran'#305
  ClientHeight = 488
  ClientWidth = 738
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
    Left = 117
    Top = 225
    Width = 621
    Height = 257
    TabOrder = 0
    object Label1: TLabel
      Left = 31
      Top = 179
      Width = 35
      Height = 13
      Caption = 'Adres :'
    end
    object Label2: TLabel
      Left = 31
      Top = 126
      Width = 43
      Height = 13
      Caption = 'Telefon :'
    end
    object Label3: TLabel
      Left = 28
      Top = 67
      Width = 61
      Height = 13
      Caption = #304'sim Soyisim:'
    end
    object Label4: TLabel
      Left = 31
      Top = 15
      Width = 50
      Height = 13
      Caption = 'Cari Kay'#305't:'
    end
    object edtİsimSoyisim: TEdit
      Left = 95
      Top = 64
      Width = 225
      Height = 21
      TabOrder = 0
    end
    object edtTel: TEdit
      Left = 95
      Top = 123
      Width = 225
      Height = 21
      TabOrder = 1
    end
    object edtAdres: TEdit
      Left = 95
      Top = 176
      Width = 225
      Height = 21
      TabOrder = 2
    end
    object Button1: TButton
      Left = 351
      Top = 56
      Width = 65
      Height = 141
      Caption = 'Ekle'
      TabOrder = 3
      OnClick = Button1Click
    end
    object btnSil: TButton
      Left = 438
      Top = 129
      Width = 65
      Height = 68
      Caption = 'Sil'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 104
    Top = 8
    Width = 626
    Height = 64
    TabOrder = 1
    object btnTemizle: TButton
      Left = 366
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Temizle'
      TabOrder = 0
      OnClick = btnTemizleClick
    end
    object edtCariAra: TLabeledEdit
      Left = 16
      Top = 27
      Width = 297
      Height = 21
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = 'Cari Arama'
      TabOrder = 1
      OnKeyPress = edtCariAraKeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 112
    Top = 72
    Width = 626
    Height = 147
    DataSource = fDataModule.dsMusteriAra
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
        FieldName = 'MusteriAdiSoyadi'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tel'
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Adres'
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Durum'
        Width = 360
        Visible = True
      end>
  end
  object btnGuncelle: TButton
    Left = 555
    Top = 280
    Width = 65
    Height = 68
    Caption = 'G'#252'ncelle'
    TabOrder = 3
    OnClick = btnGuncelleClick
  end
  object Panel3: TPanel
    Left = 0
    Top = 8
    Width = 111
    Height = 477
    Caption = 'Panel3'
    ShowCaption = False
    TabOrder = 4
    object Label5: TLabel
      Left = 0
      Top = 0
      Width = 63
      Height = 13
      Caption = 'Cari '#304#351'lemler:'
    end
    object edtTahsilEt: TButton
      Left = 0
      Top = 19
      Width = 111
      Height = 90
      Caption = 'Tahsil Et'
      TabOrder = 0
      OnClick = edtTahsilEtClick
    end
    object edtOdemeYap: TButton
      Left = 0
      Top = 112
      Width = 111
      Height = 90
      Caption = #214'deme Yap'
      TabOrder = 1
      OnClick = edtOdemeYapClick
    end
    object btnExtreAl: TButton
      Left = 0
      Top = 204
      Width = 111
      Height = 90
      Caption = 'Extre Al'
      TabOrder = 2
      OnClick = btnExtreAlClick
    end
    object btnSatisFaturasi: TButton
      Left = 0
      Top = 296
      Width = 111
      Height = 90
      Caption = 'Sat'#305#351' Faturas'#305
      TabOrder = 3
    end
    object btnAlisFaturasi: TButton
      Left = 0
      Top = 388
      Width = 111
      Height = 90
      Caption = 'Al'#305#351' Faturas'#305
      TabOrder = 4
    end
  end
end
