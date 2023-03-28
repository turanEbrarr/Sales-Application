unit StokCikisRapor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfStokCikisRapor = class(TForm)
    edtArama: TEdit;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    procedure edtAramaKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStokCikisRapor: TfStokCikisRapor;

implementation

{$R *.dfm}

uses DataModule;

procedure TfStokCikisRapor.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=chr(13) then
 begin
   fDataModule.qHareketler.Close;
   fDataModule.qHareketler.SQL.Clear;
   fDataModule.qHareketler.SQL.Add('Select * From HAREKETLER');
   fDataModule.qHareketler.SQL.Add('Where Tarih Like :Arama');
   fDataModule.qHareketler.Parameters[0].Value:=('%'+Edit1.Text+'%');
   fDataModule.qHareketler.Open;
end;
end;

procedure TfStokCikisRapor.edtAramaKeyPress(Sender: TObject; var Key: Char);
begin
if key=chr(13) then
 begin
   fDataModule.qHareketler.Close;
   fDataModule.qHareketler.SQL.Clear;
   fDataModule.qHareketler.SQL.Add('Select * From HAREKETLER');
   fDataModule.qHareketler.SQL.Add('Where UrunAdi Like :Arama');
   fDataModule.qHareketler.Parameters[0].Value:=('%'+edtArama.Text+'%');
   fDataModule.qHareketler.Open;
end;
end;

end.
