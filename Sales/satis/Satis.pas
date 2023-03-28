unit Satis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, adodb;

type
  TfSatis = class(TForm)
    edtArama: TEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnSatisiSonlandir: TButton;
    edtToplam: TEdit;
    Panel2: TPanel;
    btnCariyeAktar: TButton;
    btnUrunSil: TButton;
    btnBelgeIptal: TButton;
    Button4: TButton;
    btnEkle: TButton;
    Button1: TButton;
    procedure edtAramaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSatisiSonlandirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCariyeAktarClick(Sender: TObject);
    procedure btnEkleClick(Sender: TObject);
    procedure btnBelgeIptalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSatis: TfSatis;
  i:Currency;

implementation

{$R *.dfm}

uses DataModule, CariyeAktar, AnaForm, Müsteri, SatısaUrunEkle;

procedure TfSatis.btnBelgeIptalClick(Sender: TObject);
begin
 fDataModule.qHareketler.Close;
 fDataModule.qHareketler.Open;
end;

procedure TfSatis.btnCariyeAktarClick(Sender: TObject);
begin
fDataModule.qTutarHesapla.Close;
fDataModule.qTutarHesapla.SQL.Clear;
fDataModule.qTutarHesapla.SQL.Text:='select sum(tutar) from HAREKETLER where Belge_id='+fDataModule.qBelgelerid.AsString;
fDataModule.qTutarHesapla.Open;
fDataModule.qBelgeler.Edit;

fDataModule.qBelgelerTutar.Value:=fDataModule.qTutarHesapla.Fields[0].AsCurrency;

fDataModule.qBelgeler.Post;

//ShowMessage(CurrToStr(fDataModule.qTutarHesapla.Fields[0].AsCurrency)+' ₺');

//fDataModule.qBelgeler.Edit;
//fDataModule.qBelgelerid.Value:=fDataModule.qBelgelerid.Value+1;
//fDataModule.qBelgeler.Post;
ShowMessage(CurrToStr(i)+' ₺');
edtToplam.Text:=CurrToStr(i);
fCariyeAktar.edtAktraılcakTutar.Text:=CurrToStr(i);
i:=0;
edtToplam.Text:='';
fCariyeAktar.ShowModal;
end;

procedure TfSatis.btnEkleClick(Sender: TObject);
begin
fSatisaUrunEkle.ShowModal;
end;

procedure TfSatis.btnSatisiSonlandirClick(Sender: TObject);
var
 BelgeToplami:Currency;


begin
{
fDataModule.qTutarHesapla.Close;
fDataModule.qTutarHesapla.SQL.Clear;

 fDataModule.qHareketler.DisableControls;
 fDataModule.qHareketler.First;
 while not fDataModule.qHareketler.Eof do
  begin

   fDataModule.qTutarHesapla.SQL.text:=('update HAREKETLER set Tutar = ' +
                                        fDataModule.qHareketlerotoTutar.AsString +
                                        ' where id=' + fDataModule.qHareketlerid.AsString);
   fDataModule.qTutarHesapla.ExecSQL;
   fDataModule.qHareketler.Next;
  end;//while
 }
fDataModule.qTutarHesapla.Close;
fDataModule.qTutarHesapla.SQL.Clear;
fDataModule.qTutarHesapla.SQL.Text:='select sum(tutar) from HAREKETLER where Belge_id='+fDataModule.qBelgelerid.AsString;
fDataModule.qTutarHesapla.Open;
fDataModule.qBelgeler.Edit;

fDataModule.qBelgelerTutar.Value:=fDataModule.qTutarHesapla.Fields[0].AsCurrency;

fDataModule.qBelgeler.Post;

//ShowMessage(CurrToStr(fDataModule.qTutarHesapla.Fields[0].AsCurrency)+' ₺');
//fDataModule.qTutarHesapla.Edit;
//fDataModule.qTutarHesapla.Fields[0].AsCurrency:=0;
//fDataModule.qTutarHesapla.Post;
ShowMessage(CurrToStr(i)+' ₺');
i:=0;
fDataModule.qBelgeler.Edit;
fDataModule.qbelgelerMusteri_id.Value:=115110;
fDataModule.qBelgeler.Post;

 fDataModule.qHareketler.Close;
 fDataModule.qHareketler.Open;
 edtArama.SetFocus;
edtToplam.Text:=CurrToStr(i);

end;

procedure TfSatis.Button1Click(Sender: TObject);
begin
fSatis.Close;
i:=0;
edtToplam.Text:='';
end;

procedure TfSatis.edtAramaKeyPress(Sender: TObject; var Key: Char);
begin
 if key=chr(13) then
 begin
   fDataModule.qStokArama.Close;
   fDataModule.qStokArama.SQL.Clear;
   fDataModule.qStokArama.SQL.Add('Select * From stoklar');
   fDataModule.qStokArama.SQL.Add('Where Barkod Like :Arama');
   fDataModule.qStokArama.Parameters[0].Value:=('%'+edtArama.Text+'%');
   fDataModule.qStokArama.Open;

   if not fDataModule.qStokArama.IsEmpty then
   begin
     fDataModule.qHareketler.Insert;//veya append
     fDataModule.qHareketlerUrun_id.Value:=fDataModule.qStokAramaid.Value;
     fDataModule.qHareketlerFiyat.Value:=fDataModule.qStokAramaFiyat.Value;
     fDataModule.qHareketlerUrunAdi.Value:=fDataModule.qStokAramaUrunAdi.Value;
     fDataModule.qHareketlerMiktar.Value:=1;
     fDataModule.qHareketlerTarih.Value:=Now;
     fDataModule.qHareketlerBelge_id.Value:=fDataModule.qBelgelerid.Value;
     fDataModule.qStokArama.Edit;
     fDataModule.qStokAramaAdet.Value:=fDataModule.qStokAramaAdet.Value-1;
     fDataModule.qStokArama.Post;
     i:=i+fDataModule.qStokAramaFiyat.Value;
     fDataModule.qHareketler.Post;
     edtToplam.Text:=CurrToStr(i);
   end;
      edtArama.Text:='';
 end;

end;

procedure TfSatis.FormCreate(Sender: TObject);
begin
i:=0;
end;

procedure TfSatis.FormShow(Sender: TObject);
begin
 edtArama.SetFocus;
end;

end.
