program TuranSatis;

uses
  Vcl.Forms,
  AnaForm in 'AnaForm.pas' {fAnaForm},
  DataModule in 'DataModule.pas' {fDataModule: TDataModule},
  Satis in 'Satis.pas' {fSatis},
  Müsteri in 'Müsteri.pas' {fMusteri},
  CariyeAktar in 'CariyeAktar.pas' {fCariyeAktar},
  Urun in 'Urun.pas' {fUrun},
  SatýsaUrunEkle in 'SatýsaUrunEkle.pas' {fSatisaUrunEkle},
  CariIslemler in 'CariIslemler.pas' {fCariIslemler},
  Extre in 'Extre.pas' {fEkstreAl},
  StokCikisRapor in 'StokCikisRapor.pas' {fStokCikisRapor},
  EskiBelge in 'EskiBelge.pas' {fEski},
  KasaRaporu in 'KasaRaporu.pas' {fKasaRaporu},
  Fatura in 'Fatura.pas' {fFatura};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfAnaForm, fAnaForm);
  Application.CreateForm(TfDataModule, fDataModule);
  Application.CreateForm(TfSatis, fSatis);
  Application.CreateForm(TfMusteri, fMusteri);
  Application.CreateForm(TfCariyeAktar, fCariyeAktar);
  Application.CreateForm(TfUrun, fUrun);
  Application.CreateForm(TfSatisaUrunEkle, fSatisaUrunEkle);
  Application.CreateForm(TfCariIslemler, fCariIslemler);
  Application.CreateForm(TfEkstreAl, fEkstreAl);
  Application.CreateForm(TfStokCikisRapor, fStokCikisRapor);
  Application.CreateForm(TfEski, fEski);
  Application.CreateForm(TfKasaRaporu, fKasaRaporu);
  Application.CreateForm(TfFatura, fFatura);
  Application.Run;
end.
