unit Urun;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfUrun = class(TForm)
    edtFiyat: TEdit;
    edtUrunAdi: TEdit;
    edtBarkod: TEdit;
    edtAdet: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnEkle: TButton;
    edtAra: TEdit;
    DBGrid1: TDBGrid;
    btnGuncelle: TButton;
    btnSil: TButton;
    Button1: TButton;
    Button2: TButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtAraKeyPress(Sender: TObject; var Key: Char);
    procedure btnGuncelleClick(Sender: TObject);
    procedure btnEkleClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUrun: TfUrun;

implementation

{$R *.dfm}

uses AnaForm, CariyeAktar, DataModule, Müsteri, Satis, StokCikisRapor,
  EskiBelge;
   procedure TfUrun.btnEkleClick(Sender: TObject);
begin
if (trim(edtUrunAdi.Text)='') or (trim(edtBarkod.Text)='') or (trim(edtFiyat.Text)='') or (trim(edtAdet.Text)='')then
 begin
   ShowMessage('Lütfen tüm alanlarý doldur ortaðððm');
   if trim(edtAdet.Text)='' then edtAdet.SetFocus;
   if trim(edtFiyat.Text)='' then edtFiyat.SetFocus;
   if trim(edtBarkod.Text)='' then edtBarkod.SetFocus;
   if trim(edtUrunAdi.Text)='' then edtUrunAdi.SetFocus;
   exit;
 end;
screen.Cursor:=crHourGlass;
 try

   try
      fDataModule.qStokArama.Close;
      fDataModule.qStokArama.SQL.Text:='select * from STOKLAR where UrunAdi like '+ QuotedStr(trim(edtUrunAdi.Text));
      fDataModule.qStokArama.Open;


        if fDataModule.qStokArama.IsEmpty then
        begin
        fDataModule.qStokArama.Insert;
        fDataModule.qStokAramaUrunAdi.Value:=edtUrunAdi.Text;
        fDataModule .qStokAramaBarkod.Value:=edtBarkod.Text;
        fDataModule.qStokAramaFiyat.Value:=StrToCurr(edtFiyat.Text);
        fDataModule.qStokAramaAdet.Value:=StrToInt(edtAdet.Text);
        fDataModule.qStokArama.Post;
        ShowMessage('Yeni Ürün Eklendi');
        edtUrunAdi.Text:='';
        edtBarkod.Text :='';
        edtFiyat.Text  :='';
        edtAdet.Text   :='';
        edtUrunAdi.SetFocus;
        end
        else
        ShowMessage('Olan Ürünü Ekleyemen AGA');
   except on e:exception do
     begin
      ShowMessage('Kayýt esnasýnda hata oluþtu.'+#13#10+'Hata Mesajý:'+e.Message);
       screen.Cursor:=crDefault;
     end;

 end;
 finally
    screen.Cursor:=crDefault;
 end;
end;

procedure TfUrun.btnGuncelleClick(Sender: TObject);
begin
fDataModule.qStokAra.Edit;
fDataModule.qStokAraUrunAdi.Value:=edtUrunAdi.Text;
fDataModule.qStokAraBarkod.Value:=edtBarkod.Text;
fDataModule.qStokAraFiyat.Value:= StrToCurr(edtFiyat.Text);
fDataModule.qStokAraAdet.Value:= StrToInt(edtAdet.Text);
fDataModule.qStokAra.Post;
edtUrunAdi.Text :='';
edtBarkod.Text  :='';
edtFiyat.Text   :='';
edtAdet.Text    :='';
end;


procedure TfUrun.Button1Click(Sender: TObject);
begin
fStokCikisRapor.ShowModal;
end;

procedure TfUrun.Button2Click(Sender: TObject);
begin
fEski.ShowModal;
end;

procedure TfUrun.DBGrid1DblClick(Sender: TObject);
begin
edtUrunAdi.Text:=fDataModule.qStokAraUrunAdi.Value;
edtBarkod.Text:=fDataModule.qStokAraBarkod.Value;
edtFiyat.Text:=CurrToStr(fDataModule.qStokAraFiyat.Value);
edtAdet.Text:=IntToStr(fDataModule.qStokAraAdet.Value);
end;
procedure TfUrun.edtAraKeyPress(Sender: TObject; var Key: Char);
begin
    if key=chr(13) then
 begin
   fDataModule.qStokAra.Close;
   fDataModule.qStokAra.SQL.Clear;
   fDataModule.qStokAra.SQL.Add('Select * From stoklar');
   fDataModule.qStokAra.SQL.Add('Where UrunAdi Like :Arama');
   fDataModule.qStokAra.Parameters[0].Value:=('%'+edtAra.Text+'%');
   fDataModule.qStokAra.Open;
end;
end;

end.
