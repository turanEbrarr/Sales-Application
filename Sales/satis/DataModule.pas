unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, dialogs;

type
  TfDataModule = class(TDataModule)
    qStokArama: TADOQuery;
    dsStokArama: TDataSource;
    qStokAramaid: TAutoIncField;
    qStokAramaUrunAdi: TWideStringField;
    qStokAramaFiyat: TBCDField;
    qStokAramaBarkod: TWideStringField;
    qHareketler: TADOQuery;
    dsHareketler: TDataSource;
    qHareketlerotoTutar: TCurrencyField;
    qHareketlerid: TAutoIncField;
    qHareketlerBelge_id: TIntegerField;
    qHareketlerUrun_id: TIntegerField;
    qHareketlerUrunAdi: TWideStringField;
    qHareketlerFiyat: TBCDField;
    qHareketlerMiktar: TBCDField;
    qHareketlerTutar: TBCDField;
    qBelgeler: TADOQuery;
    dsBelgeler: TDataSource;
    qBelgelerid: TAutoIncField;
    qBelgelerislemTarihi: TDateTimeField;
    qBelgelerTutar: TBCDField;
    qBelgelerMusteri_id: TIntegerField;
    qTutarHesapla: TADOQuery;
    qMusteriler: TADOQuery;
    qMusterilerid: TAutoIncField;
    qMusterilerMusteriAdiSoyadi: TWideStringField;
    qMusterilerTel: TWideStringField;
    qMusterilerAdres: TWideStringField;
    qMusteriAra: TADOQuery;
    dsMusteriAra: TDataSource;
    qMusteriAraid: TAutoIncField;
    qMusteriAraMusteriAdiSoyadi: TWideStringField;
    qMusteriAraTel: TWideStringField;
    qMusteriAraAdres: TWideStringField;
    qMusterilerDurum: TBCDField;
    qMusteriAraDurum: TBCDField;
    qStokAra: TADOQuery;
    dsStokAra: TDataSource;
    con: TADOConnection;
    qStokAraid: TAutoIncField;
    qStokAraUrunAdi: TWideStringField;
    qStokAraFiyat: TBCDField;
    qStokAraBarkod: TWideStringField;
    qStokAraAdet: TIntegerField;
    qStokAramaAdet: TIntegerField;
    qExtreAl: TADOQuery;
    dsExtreAl: TDataSource;
    qExtreAlid: TAutoIncField;
    qExtreAlislemTarihi: TDateTimeField;
    qExtreAlTutar: TBCDField;
    qExtreAlMusteri_id: TIntegerField;
    qHareketlerTarih: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qHareketlerCalcFields(DataSet: TDataSet);
    procedure qHareketlerFiyatChange(Sender: TField);
    procedure qHareketlerMiktarChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDataModule: TfDataModule;

  _PATH:string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TfDataModule.DataModuleCreate(Sender: TObject);
var i:integer;
begin
 _path:=ExtractFilePath(paramstr(0)) + 'DATA\MAINDB.MDB';

 con.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+ _path +';Persist Security Info=True';
 con.Connected:=true;

 qStokArama.Open;
 qHareketler.Open;
 qHareketler.Open;




end;

procedure TfDataModule.qHareketlerCalcFields(DataSet: TDataSet);
begin
  fDataModule.qHareketlerotoTutar.Value:=
          dataset.FindField('Miktar').AsCurrency * dataset.FindField('Fiyat').AsCurrency;

end;

procedure TfDataModule.qHareketlerFiyatChange(Sender: TField);
begin
try
   fDataModule.qHareketlerTutar.Value:=sender.Value *
   fDataModule.qHareketler.FindField('Miktar').Value;
except

end;
end;

procedure TfDataModule.qHareketlerMiktarChange(Sender: TField);
begin
try
   fDataModule.qHareketlerTutar.Value:=sender.Value *
   fDataModule.qHareketler.FindField('Fiyat').Value;
except

end;
end;

end.
