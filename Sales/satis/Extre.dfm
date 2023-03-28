object fEkstreAl: TfEkstreAl
  Left = 0
  Top = 0
  Caption = 'Extre Al'
  ClientHeight = 349
  ClientWidth = 760
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
    Top = 43
    Width = 147
    Height = 13
    Caption = 'Aranacak Carinin '#304'D'#39'sini Giriniz:'
  end
  object edtArama: TEdit
    Left = 224
    Top = 40
    Width = 113
    Height = 21
    TabOrder = 0
    OnKeyPress = edtAramaKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 83
    Width = 705
    Height = 254
    DataSource = fDataModule.dsExtreAl
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
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tutar'
        Width = 405
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Musteri_id'
        Width = 362
        Visible = True
      end>
  end
end
