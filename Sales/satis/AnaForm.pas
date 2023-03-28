unit AnaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfAnaForm = class(TForm)
    Panel1: TPanel;
    btnSatis: TButton;
    btnUrun: TButton;
    btnKasa: TButton;
    btnCari: TButton;
    btnKasaRaporu: TButton;
    procedure btnSatisClick(Sender: TObject);
    procedure btnCariClick(Sender: TObject);
    procedure btnUrunClick(Sender: TObject);
    procedure btnKasaClick(Sender: TObject);
    procedure btnKasaRaporuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAnaForm: TfAnaForm;

implementation

{$R *.dfm}

uses DataModule, Satis, Müsteri, Urun, StokCikisRapor, KasaRaporu;

procedure TfAnaForm.btnCariClick(Sender: TObject);
begin
fMusteri.ShowModal;
end;

procedure TfAnaForm.btnKasaClick(Sender: TObject);
begin
fStokCikisRapor.ShowModal;
end;

procedure TfAnaForm.btnKasaRaporuClick(Sender: TObject);
begin
fkasaraporu.showmodal;
end;

procedure TfAnaForm.btnSatisClick(Sender: TObject);
begin
fDataModule.qBelgeler.Close;
fDataModule.qBelgeler.SQL.Text:='select top 1 * from BELGELER where id=0';
fDataModule.qBelgeler.Open;
fDataModule.qBelgeler.Insert;
fDataModule.qBelgelerislemTarihi.Value:=Now;
fDataModule.qBelgelerMusteri_id.Value:=0;
fDataModule.qBelgelerTutar.Value:=0;
fDataModule.qBelgeler.Post;


fDataModule.qHareketler.Close;
fDataModule.qHareketler.SQL.Text:='select top 1 * from HAREKETLER where id='+fDataModule.qBelgelerid.AsInteger.ToString;
fDataModule.qHareketler.Open;
fSatis.ShowModal;
end;

procedure TfAnaForm.btnUrunClick(Sender: TObject);
begin
fUrun.ShowModal;
end;

end.
