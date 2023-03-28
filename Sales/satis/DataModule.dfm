object fDataModule: TfDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 457
  Width = 559
  object qStokArama: TADOQuery
    Connection = con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from stoklar where id=0')
    Left = 184
    Top = 32
    object qStokAramaid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qStokAramaUrunAdi: TWideStringField
      FieldName = 'UrunAdi'
      Size = 255
    end
    object qStokAramaFiyat: TBCDField
      FieldName = 'Fiyat'
      Precision = 19
    end
    object qStokAramaBarkod: TWideStringField
      FieldName = 'Barkod'
      Size = 255
    end
    object qStokAramaAdet: TIntegerField
      FieldName = 'Adet'
    end
  end
  object dsStokArama: TDataSource
    DataSet = qStokArama
    Left = 240
    Top = 32
  end
  object qHareketler: TADOQuery
    Connection = con
    CursorType = ctStatic
    OnCalcFields = qHareketlerCalcFields
    Parameters = <>
    SQL.Strings = (
      'select *  from HAREKETLER'
      '')
    Left = 384
    Top = 24
    object qHareketlerid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qHareketlerBelge_id: TIntegerField
      FieldName = 'Belge_id'
    end
    object qHareketlerUrun_id: TIntegerField
      FieldName = 'Urun_id'
    end
    object qHareketlerUrunAdi: TWideStringField
      FieldName = 'UrunAdi'
      Size = 255
    end
    object qHareketlerFiyat: TBCDField
      FieldName = 'Fiyat'
      OnChange = qHareketlerFiyatChange
      Precision = 19
    end
    object qHareketlerMiktar: TBCDField
      FieldName = 'Miktar'
      OnChange = qHareketlerMiktarChange
      Precision = 19
    end
    object qHareketlerTutar: TBCDField
      FieldName = 'Tutar'
      Precision = 19
    end
    object qHareketlerotoTutar: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'otoTutar'
      Calculated = True
    end
    object qHareketlerTarih: TDateTimeField
      FieldName = 'Tarih'
    end
  end
  object dsHareketler: TDataSource
    DataSet = qHareketler
    Left = 448
    Top = 24
  end
  object qBelgeler: TADOQuery
    Connection = con
    CursorType = ctStatic
    OnCalcFields = qHareketlerCalcFields
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from BELGELER'
      'where id=0')
    Left = 392
    Top = 168
    object qBelgelerid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qBelgelerislemTarihi: TDateTimeField
      FieldName = 'islemTarihi'
    end
    object qBelgelerTutar: TBCDField
      FieldName = 'Tutar'
      Precision = 19
    end
    object qBelgelerMusteri_id: TIntegerField
      FieldName = 'Musteri_id'
    end
  end
  object dsBelgeler: TDataSource
    DataSet = qBelgeler
    Left = 448
    Top = 168
  end
  object qTutarHesapla: TADOQuery
    Connection = con
    Parameters = <>
    Left = 416
    Top = 272
  end
  object qMusteriler: TADOQuery
    Connection = con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from MUSTERILER'
      'where id=0'
      '')
    Left = 56
    Top = 128
    object qMusterilerid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qMusterilerMusteriAdiSoyadi: TWideStringField
      FieldName = 'MusteriAdiSoyadi'
      Size = 255
    end
    object qMusterilerTel: TWideStringField
      FieldName = 'Tel'
      Size = 255
    end
    object qMusterilerAdres: TWideStringField
      FieldName = 'Adres'
      Size = 255
    end
    object qMusterilerDurum: TBCDField
      FieldName = 'Durum'
      Precision = 19
    end
  end
  object qMusteriAra: TADOQuery
    Connection = con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select top 2 * from MUSTERILER where id=0')
    Left = 48
    Top = 240
    object qMusteriAraid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qMusteriAraMusteriAdiSoyadi: TWideStringField
      FieldName = 'MusteriAdiSoyadi'
      Size = 255
    end
    object qMusteriAraTel: TWideStringField
      FieldName = 'Tel'
      Size = 255
    end
    object qMusteriAraAdres: TWideStringField
      FieldName = 'Adres'
      Size = 255
    end
    object qMusteriAraDurum: TBCDField
      FieldName = 'Durum'
      Precision = 19
    end
  end
  object dsMusteriAra: TDataSource
    DataSet = qMusteriAra
    Left = 56
    Top = 192
  end
  object qStokAra: TADOQuery
    Connection = con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *from STOKLAR')
    Left = 184
    Top = 96
    object qStokAraid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qStokAraUrunAdi: TWideStringField
      FieldName = 'UrunAdi'
      Size = 255
    end
    object qStokAraFiyat: TBCDField
      FieldName = 'Fiyat'
      Precision = 19
    end
    object qStokAraBarkod: TWideStringField
      FieldName = 'Barkod'
      Size = 255
    end
    object qStokAraAdet: TIntegerField
      FieldName = 'Adet'
    end
  end
  object dsStokAra: TDataSource
    DataSet = qStokAra
    Left = 240
    Top = 96
  end
  object con: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=C:\PRJ\' +
      'satis\DATA\MAINDB.mdb;Persist Security Info=True'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 32
  end
  object qExtreAl: TADOQuery
    Connection = con
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select top 1 * from BELGELERr where id=0'
      '')
    Left = 120
    Top = 336
    object qExtreAlid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qExtreAlislemTarihi: TDateTimeField
      FieldName = 'islemTarihi'
    end
    object qExtreAlTutar: TBCDField
      FieldName = 'Tutar'
      Precision = 19
    end
    object qExtreAlMusteri_id: TIntegerField
      FieldName = 'Musteri_id'
    end
  end
  object dsExtreAl: TDataSource
    DataSet = qExtreAl
    Left = 176
    Top = 336
  end
end
