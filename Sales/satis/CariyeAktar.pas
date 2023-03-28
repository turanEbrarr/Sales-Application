unit CariyeAktar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfCariyeAktar = class(TForm)
    DBGrid1: TDBGrid;
    edtCariAra: TLabeledEdit;
    Panel1: TPanel;
    edtAktraýlcakTutar: TLabeledEdit;
    Button1: TButton;
    procedure edtCariAraKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCariyeAktar: TfCariyeAktar;

implementation

{$R *.dfm}

uses DataModule, AnaForm, Müsteri, Satis;

procedure TfCariyeAktar.Button1Click(Sender: TObject);
begin
//fDataModule.qMusteriler.Close;
//fDataModule.qMusteriler.Open;
fDataModule.qMusteriAra.Edit;
fDataModule.qMusteriAraDurum.Value:=fDataModule.qMusteriAraDurum.Value + StrToCurr(edtAktraýlcakTutar.Text);


fDataModule.qBelgeler.Edit;
fDataModule.qbelgelerMusteri_id.Value:=fDataModule.qMusteriAraid.Value;
fDataModule.qBelgeler.Post;

fDataModule.qMusteriAra.Post;

 edtAktraýlcakTutar.Text:='';
 i:=0;
 fSatis.edtArama.Text:='';
 fDataModule.qHareketler.Close;
 fDataModule.qHareketler.Open;
 fCariyeAktar.Close;


end;

procedure TfCariyeAktar.DBGrid1DblClick(Sender: TObject);
begin
edtAktraýlcakTutar.Text:=fSatis.edtToplam.Text;
end;

procedure TfCariyeAktar.edtCariAraKeyPress(Sender: TObject; var Key: Char);
begin
   fDataModule.qMusteriAra.Close;
   fDataModule.qMusteriAra.SQL.Clear;
   fDataModule.qMusteriAra.SQL.Add('Select * From MUSTERILER');
   fDataModule.qMusteriAra.SQL.Add('Where MusteriAdiSoyadi Like :Arama');
   fDataModule.qMusteriAra.Parameters[0].Value:=('%'+edtCariAra.Text+'%');
   fDataModule.qMusteriAra.Open;
end;

procedure TfCariyeAktar.FormActivate(Sender: TObject);
begin
 edtAktraýlcakTutar.Text:=fSatis.edtToplam.Text;
end;

procedure TfCariyeAktar.FormCreate(Sender: TObject);
begin

//fSatis.edtToplam.Text:= edtAktraýlcakTutar.Text ;
end;

end.
