object fSatis: TfSatis
  Left = 0
  Top = 0
  Caption = 'fSatis'
  ClientHeight = 455
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 41
    Align = alTop
    TabOrder = 0
    TabStop = True
    object edtArama: TEdit
      Left = 64
      Top = 11
      Width = 409
      Height = 21
      BorderStyle = bsNone
      TabOrder = 0
      OnKeyPress = edtAramaKeyPress
    end
    object btnEkle: TButton
      Left = 479
      Top = 7
      Width = 75
      Height = 25
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 0
      Font.Name = 'Segoe UI'
      Font.Pitch = fpVariable
      Font.Style = []
      Font.Quality = fqProof
      ParentFont = False
      TabOrder = 1
      OnClick = btnEkleClick
    end
    object Button1: TButton
      Left = 9
      Top = 9
      Width = 49
      Height = 25
      Caption = #8592
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 104
    Top = 47
    Width = 655
    Height = 308
    DataSource = fDataModule.dsHareketler
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Belge_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Urun_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UrunAdi'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fiyat'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Miktar'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tutar'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'otoTutar'
        Visible = True
      end>
  end
  object TPanel
    Left = 0
    Top = 361
    Width = 767
    Height = 96
    TabOrder = 2
    object btnSatisiSonlandir: TButton
      Left = 54
      Top = 25
      Width = 657
      Height = 57
      Caption = 'Sat'#305#351#305' Sonland'#305'r'
      TabOrder = 0
      OnClick = btnSatisiSonlandirClick
    end
  end
  object edtToplam: TEdit
    Left = 630
    Top = 327
    Width = 121
    Height = 21
    BorderStyle = bsNone
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 8
    Top = 47
    Width = 90
    Height = 308
    TabOrder = 4
    object btnCariyeAktar: TButton
      Left = 0
      Top = 0
      Width = 90
      Height = 77
      Caption = 'Cariye Aktar'
      TabOrder = 0
      OnClick = btnCariyeAktarClick
    end
    object btnUrunSil: TButton
      Left = 0
      Top = 77
      Width = 90
      Height = 77
      Caption = #220'r'#252'n Sil'
      TabOrder = 1
    end
    object btnBelgeIptal: TButton
      Left = 0
      Top = 154
      Width = 90
      Height = 77
      Caption = 'Belge '#304'ptal'
      TabOrder = 2
      OnClick = btnBelgeIptalClick
    end
    object Button4: TButton
      Left = 0
      Top = 231
      Width = 90
      Height = 77
      Caption = 'Button1'
      TabOrder = 3
    end
  end
end
