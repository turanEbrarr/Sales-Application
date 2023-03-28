unit CariIslemler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfCariIslemler = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    rbtnTahsilat: TRadioButton;
    rbtnOdeme: TRadioButton;
    Label2: TLabel;
    btnOnayla: TButton;
    procedure btnOnaylaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCariIslemler: TfCariIslemler;

implementation

{$R *.dfm}

uses M�steri, DataModule;

procedure TfCariIslemler.btnOnaylaClick(Sender: TObject);
  begin
      //  if not(rbtnTahsilat.Checked)or not(rbtnOdeme.Checked) then
      //  begin
      //  ShowMessage('Transfer t�r� se�iniz!');
      //  exit;
      //  end;
        if rbtnTahsilat.Checked then
        begin
          fDataModule.qMusteriAra.Edit;
          fDataModule.qMusteriAraDurum.Value:= fDataModule.qMusteriAraDurum.Value-StrToCurr(Edit1.Text);
          fDataModule.qMusteriAra.Post;
          Edit1.Text:='';
          Edit2.Text:='';
          exit;
         end else
         if rbtnOdeme.Checked then
        begin
          fDataModule.qMusteriAra.Edit;
          fDataModule.qMusteriAraDurum.Value:= fDataModule.qMusteriAraDurum.Value+StrToCurr(Edit1.Text);
          fDataModule.qMusteriAra.Post;
          Edit1.Text:='';
          Edit2.Text:='';
          exit;
        end else
        begin
          begin
          ShowMessage('Transfer t�r� se�iniz!');
          Edit1.Text:='';
          Edit2.Text:='';
          exit;
        end;

      fCariIslemler.CloseModal;


  end;
  end;

end.
