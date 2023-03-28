unit M�steri;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,adodb,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfMusteri = class(TForm)
    edt�simSoyisim: TEdit;
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
 if (trim(edt�simSoyisim.Text)='') or (trim(edtTel.Text)='') or (trim(edtAdres.Text)='')then
 begin
   ShowMessage('L�tfen t�m alanlar� doldur orta���m');
   if trim(edtAdres.Text)='' then edtAdres.SetFocus;
   if trim(edtTel.Text)='' then edtTel.SetFocus;
   if trim(edt�simSoyisim.Text)='' then edt�simSoyisim.SetFocus;
   exit;
 end;

  if (Length(edtTel.Text)<14) or (Length(edtTel.Text)> 14) then
  begin
    ShowMessage('Girilen Telefon Bo�luklar Dahil 14 Hane Olmal�d�r.');
    exit;
  end;


screen.Cursor:=crHourGlass;
 try

   try
      fDataModule.qMusteriler.Close;
      fDataModule.qMusteriler.SQL.Text:='select * from MUSTERILER where MusteriAdiSoyadi like '+ QuotedStr(trim(edt�simSoyisim.Text));
      fDataModule.qMusteriler.Open;


        if fDataModule.qMusteriler.IsEmpty then
        begin
        fDataModule.QMusteriler.Insert;
        fDataModule.qMusterilerMusteriAdiSoyadi.Value:=edt�simSoyisim.Text;
        fDataModule.QMusterilerTel.Value:=edtTel.Text;
        fDataModule.QMusterilerAdres.Value:=edtAdres.Text;
        fDataModule.QMusteriler.Post;
        ShowMessage('Yeni Cari Eklendi');
        edt�simSoyisim.Text:='';
        edtTel.Text:='';
        edtAdres.Text:='';
        edt�simSoyisim.SetFocus;

        end
        else
        ShowMessage('Olan Cariyi Ekleyemen AGA');
   except on e:exception do
     begin
      ShowMessage('Kay�t esnas�nda hata olu�tu.'+#13#10+'Hata Mesaj�:'+e.Message);
       screen.Cursor:=crDefault;
     end;

 end;
 finally
    screen.Cursor:=crDefault;
 end;



end;

procedure TfMusteri.DBGrid1DblClick(Sender: TObject);
begin
 edt�simSoyisim.Text   :=fDataModule.qMusterilerMusteriAdiSoyadi.Value;
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
        fDataModule.qMusterilerMusteriAdiSoyadi.Value:=edt�simSoyisim.Text;
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
