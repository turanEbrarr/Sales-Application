unit EskiBelge;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfEski = class(TForm)
    edtArama: TEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure edtAramaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEski: TfEski;

implementation

{$R *.dfm}

uses DataModule;

procedure TfEski.edtAramaKeyPress(Sender: TObject; var Key: Char);
begin
if key=chr(13) then
 begin
   fDataModule.qHareketler.Close;
   fDataModule.qHareketler.SQL.Clear;
   fDataModule.qHareketler.SQL.Add('Select * From HAREKETLER');
   fDataModule.qHareketler.SQL.Add('Where Belge_id Like :Arama');
   fDataModule.qHareketler.Parameters[0].Value:=('%'+edtArama.Text+'%');
   fDataModule.qHareketler.Open;
end;
end;

end.
