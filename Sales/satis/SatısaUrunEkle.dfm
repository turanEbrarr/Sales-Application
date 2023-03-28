object fSatisaUrunEkle: TfSatisaUrunEkle
  Left = 0
  Top = 0
  Caption = 'Ekle'
  ClientHeight = 482
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtUrunEkle: TEdit
    Left = 24
    Top = 32
    Width = 393
    Height = 21
    BorderStyle = bsNone
    TabOrder = 0
    OnKeyPress = edtUrunEkleKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 72
    Width = 393
    Height = 393
    DataSource = fDataModule.dsStokAra
    TabOrder = 1
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
        FieldName = 'Belge_id'
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Urun_id'
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Miktar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tutar'
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'otoTutar'
        Width = 0
        Visible = True
      end>
  end
end
