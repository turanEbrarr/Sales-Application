object fEski: TfEski
  Left = 0
  Top = 0
  Caption = 'ESki'
  ClientHeight = 301
  ClientWidth = 635
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
    Left = 8
    Top = 51
    Width = 177
    Height = 13
    Caption = 'Aranacak Belgenin '#304'D'#39'sini  Giriniz'
  end
  object edtArama: TEdit
    Left = 184
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = edtAramaKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 619
    Height = 193
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
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Belge_id'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Urun_id'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UrunAdi'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fiyat'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Miktar'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tutar'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'otoTutar'
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tarih'
        Width = 151
        Visible = True
      end>
  end
end
