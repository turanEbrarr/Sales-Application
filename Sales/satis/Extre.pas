unit Extre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfEkstreAl = class(TForm)
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
  fEkstreAl: TfEkstreAl;

implementation

{$R *.dfm}

uses DataModule, Müsteri;

procedure TfEkstreAl.edtAramaKeyPress(Sender: TObject; var Key: Char);
begin
 if key=chr(13) then
 begin
   fDataModule.qExtreAl.Close;
   fDataModule.qExtreAl.SQL.Clear;
   fDataModule.qExtreAl.SQL.Add('Select * From BELGELER');
   fDataModule.qExtreAl.SQL.Add('Where Musteri_id Like :Arama');
   fDataModule.qExtreAl.Parameters[0].Value:=('%'+edtArama.Text+'%');
   fDataModule.qExtreAl.Open;
      edtArama.Text:='';
 end;
end;

end.
