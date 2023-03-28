object fCariyeAktar: TfCariyeAktar
  Left = 0
  Top = 0
  Caption = 'Cariye Aktar'
  ClientHeight = 373
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 104
    Width = 372
    Height = 269
    Align = alBottom
    DataSource = fDataModule.dsMusteriAra
    TabOrder = 0
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
        Width = 50
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
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Adres'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Durum'
        Width = 50
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 372
    Height = 89
    Align = alTop
    TabOrder = 1
    object edtCariAra: TLabeledEdit
      Left = 16
      Top = 61
      Width = 185
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = 'Cari Ara'
      TabOrder = 0
      OnKeyPress = edtCariAraKeyPress
    end
    object edtAktraılcakTutar: TLabeledEdit
      Left = 16
      Top = 20
      Width = 121
      Height = 21
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = 'Aktar'#305'lacak Tutar'
      TabOrder = 1
    end
    object Button1: TButton
      Left = 272
      Top = 59
      Width = 75
      Height = 25
      Caption = 'Aktar'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
