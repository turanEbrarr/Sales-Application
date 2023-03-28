unit SatýsaUrunEkle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfSatisaUrunEkle = class(TForm)
    edtUrunEkle: TEdit;
    DBGrid1: TDBGrid;
    procedure edtUrunEkleKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSatisaUrunEkle: TfSatisaUrunEkle;

implementation

{$R *.dfm}

uses DataModule, Satis;

procedure TfSatisaUrunEkle.DBGrid1DblClick(Sender: TObject);
begin
     fDataModule.qHareketler.Insert;//veya append
     fDataModule.qHareketlerUrun_id.Value:=fDataModule.qStokAraid.Value;
     fDataModule.qHareketlerFiyat.Value:=fDataModule.qStokAraFiyat.Value;
     fDataModule.qHareketlerUrunAdi.Value:=fDataModule.qStokAraUrunAdi.Value;
     fDataModule.qHareketlerMiktar.Value:=1;
     fDataModule.qHareketlerBelge_id.Value:=fDataModule.qBelgelerid.Value;
     i:=i+((fDataModule.qHareketlerFiyat.Value * fDataModule.qHareketlerMiktar.Value));
     fSatis.edtToplam.Text:=CurrToStr(i);
     fDataModule.qHareketler.Post;
     fDataModule.qStokAra.Edit;
     fDataModule.qStokAraAdet.Value:= fDataModule.qStokAraAdet.Value-1;
     fDataModule.qStokAra.Post;
end;

procedure TfSatisaUrunEkle.edtUrunEkleKeyPress(Sender: TObject; var Key: Char);
begin
    if key=chr(13) then
 begin
   fDataModule.qStokAra.Close;
   fDataModule.qStokAra.SQL.Clear;
   fDataModule.qStokAra.SQL.Add('Select * From stoklar');
   fDataModule.qStokAra.SQL.Add('Where UrunAdi Like :Arama');
   fDataModule.qStokAra.Parameters[0].Value:=('%'+edtUrunEkle.Text+'%');
   fDataModule.qStokAra.Open;
end;
end;

end.
