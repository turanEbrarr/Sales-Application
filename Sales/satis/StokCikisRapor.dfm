object fStokCikisRapor: TfStokCikisRapor
  Left = 0
  Top = 0
  Caption = 'Stok '#199#305'k'#305#351' Raporu'
  ClientHeight = 318
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtArama: TEdit
    Left = 56
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = edtAramaKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 48
    Top = 120
    Width = 633
    Height = 153
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
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fiyat'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Miktar'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tutar'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'otoTutar'
        Width = 62
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 376
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = Edit1KeyPress
  end
end
