unit KasaRaporu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfKasaRaporu = class(TForm)
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fKasaRaporu: TfKasaRaporu;

implementation

{$R *.dfm}

uses DataModule;

procedure TfKasaRaporu.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=chr(13) then
 begin
   fDataModule.qBelgeler.Close;
   fDataModule.qBelgeler.SQL.Clear;
   fDataModule.qBelgeler.SQL.Add('Select * From BELGELER');
   fDataModule.qBelgeler.SQL.Add('Where islemTarihi Like :Arama');
   fDataModule.qBelgeler.Parameters[0].Value:=('%'+Edit1.Text+'%');
   fDataModule.qBelgeler.Open;
end;
end;

end.
