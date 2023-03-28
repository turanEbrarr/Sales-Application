object fKasaRaporu: TfKasaRaporu
  Left = 0
  Top = 0
  Caption = 'Kasa Raporu'
  ClientHeight = 315
  ClientWidth = 907
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
    Left = 56
    Top = 48
    Width = 138
    Height = 13
    Caption = 'Aranacak Tarihi Giriniz'
  end
  object Edit1: TEdit
    Left = 200
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object DBGrid1: TDBGrid
    Left = 56
    Top = 72
    Width = 817
    Height = 217
    DataSource = fDataModule.dsBelgeler
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
        FieldName = 'islemTarihi'
        Width = 334
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tutar'
        Width = 522
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Musteri_id'
        Width = 489
        Visible = True
      end>
  end
end
