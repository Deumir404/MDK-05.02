unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, math, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var num_1, num_2 : integer;
  k : float;
begin
  num_1 :=  StrtoInt(Edit1.text);
  num_2 :=  StrtoInt(Edit2.text);
  k := power(num_1, num_2);
  memo1.Lines.add('число '+Edit1.Text+' в степени '+Edit2.Text+' равно: '+IntToStr(k));
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

end.

