unit Müsteri;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,adodb,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfMusteri = class(TForm)
    edtÝsimSoyisim: TEdit;
    edtTel: TEdit;
    edtAdres: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    edtCariAra: TLabeledEdit;
    btnTemizle: TButton;
    DBGrid1: TDBGrid;
    btnGuncelle: TButton;
    btnSil: TButton;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtTahsilEt: TButton;
    edtOdemeYap: TButton;
    btnExtreAl: TButton;
    btnSatisFaturasi: TButton;
    btnAlisFaturasi: TButton;
    procedure Button1Click(Sender: TObject);
    procedure edtCariAraKeyPress(Sender: TObject; var Key: Char);
    procedure btnTemizleClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnGuncelleClick(Sender: TObject);
    procedure edtTahsilEtClick(Sender: TObject);
    procedure edtOdemeYapClick(Sender: TObject);
    procedure btnExtreAlClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMusteri: TfMusteri;

implementation

{$R *.dfm}

uses AnaForm, DataModule, Satis, CariIslemler, Extre;

procedure TfMusteri.Button1Click(Sender: TObject);

begin
 if (trim(edtÝsimSoyisim.Text)='') or (trim(edtTel.Text)='') or (trim(edtAdres.Text)='')then
 begin
   ShowMessage('Lütfen tüm alanlarý doldur ortaðððm');
   if trim(edtAdres.Text)='' then edtAdres.SetFocus;
   if trim(edtTel.Text)='' then edtTel.SetFocus;
   if trim(edtÝsimSoyisim.Text)='' then edtÝsimSoyisim.SetFocus;
   exit;
 end;

  if (Length(edtTel.Text)<14) or (Length(edtTel.Text)> 14) then
  begin
    ShowMessage('Girilen Telefon Boþluklar Dahil 14 Hane Olmalýdýr.');
    exit;
  end;


screen.Cursor:=crHourGlass;
 try

   try
      fDataModule.qMusteriler.Close;
      fDataModule.qMusteriler.SQL.Text:='select * from MUSTERILER where MusteriAdiSoyadi like '+ QuotedStr(trim(edtÝsimSoyisim.Text));
      fDataModule.qMusteriler.Open;


        if fDataModule.qMusteriler.IsEmpty then
        begin
        fDataModule.QMusteriler.Insert;
        fDataModule.qMusterilerMusteriAdiSoyadi.Value:=edtÝsimSoyisim.Text;
        fDataModule.QMusterilerTel.Value:=edtTel.Text;
        fDataModule.QMusterilerAdres.Value:=edtAdres.Text;
        fDataModule.QMusteriler.Post;
        ShowMessage('Yeni Cari Eklendi');
        edtÝsimSoyisim.Text:='';
        edtTel.Text:='';
        edtAdres.Text:='';
        edtÝsimSoyisim.SetFocus;

        end
        else
        ShowMessage('Olan Cariyi Ekleyemen AGA');
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

procedure TfMusteri.DBGrid1DblClick(Sender: TObject);
begin
 edtÝsimSoyisim.Text   :=fDataModule.qMusterilerMusteriAdiSoyadi.Value;
 edtTel.Text           :=fDataModule.qMusterilerTel.Value;
 edtAdres.Text         :=fDataModule.qMusterilerAdres.Value;

end;

procedure TfMusteri.btnExtreAlClick(Sender: TObject);
begin
fEkstreAl.ShowModal;
end;

procedure TfMusteri.btnGuncelleClick(Sender: TObject);
begin
        fDataModule.qMusteriler.Edit;
        fDataModule.qMusterilerMusteriAdiSoyadi.Value:=edtÝsimSoyisim.Text;
        fDataModule.qMusterilerTel.Value             := edtTel.Text;
        fDataModule.qMusterilerAdres.Value           := edtAdres.Text;
        fDataModule.qMusteriler.Post;
end;

procedure TfMusteri.btnTemizleClick(Sender: TObject);
begin
   edtCariAra.Text:='';
end;

procedure TfMusteri.edtCariAraKeyPress(Sender: TObject; var Key: Char);
begin
   fDataModule.qMusteriAra.Close;
   fDataModule.qMusteriAra.SQL.Clear;
   fDataModule.qMusteriAra.SQL.Add('Select * From MUSTERILER');
   fDataModule.qMusteriAra.SQL.Add('Where MusteriAdiSoyadi Like :Arama');
   fDataModule.qMusteriAra.Parameters[0].Value:=('%'+edtCariAra.Text+'%');
   fDataModule.qMusteriAra.Open;
  // edtCariAra.Text:='';
end;

procedure TfMusteri.edtOdemeYapClick(Sender: TObject);
begin
fDataModule.qBelgeler.Close;
fDataModule.qBelgeler.SQL.Text:='select top 1 * from BELGELER where id=0';
fDataModule.qBelgeler.Open;
fDataModule.qBelgeler.Insert;
fDataModule.qBelgelerislemTarihi.Value:=Now;
fDataModule.qBelgelerMusteri_id.Value:=fDataModule.qMusteriAraid.Value;
fDataModule.qBelgelerTutar.Value:=111;
fDataModule.qBelgeler.Post;


fDataModule.qHareketler.Close;
fDataModule.qHareketler.SQL.Text:='select top 1 * from HAREKETLER where id='+fDataModule.qBelgelerid.AsInteger.ToString;
fDataModule.qHareketler.Open;
fCariIslemler.rbtnOdeme.Checked;
fCariIslemler.ShowModal;

end;

procedure TfMusteri.edtTahsilEtClick(Sender: TObject);
begin
fDataModule.qBelgeler.Close;
fDataModule.qBelgeler.SQL.Text:='select top 1 * from BELGELER where id=0';
fDataModule.qBelgeler.Open;
fDataModule.qBelgeler.Insert;
fDataModule.qBelgelerislemTarihi.Value:=Now;
fDataModule.qBelgelerMusteri_id.Value:=fDataModule.qMusteriAraid.Value;
fDataModule.qBelgelerTutar.Value:=111;
fDataModule.qBelgeler.Post;


fDataModule.qHareketler.Close;
fDataModule.qHareketler.SQL.Text:='select top 1 * from HAREKETLER where id='+fDataModule.qBelgelerid.AsInteger.ToString;
fDataModule.qHareketler.Open;
fCariIslemler.rbtnTahsilat.Checked;
fCariIslemler.ShowModal;
end;

end.
