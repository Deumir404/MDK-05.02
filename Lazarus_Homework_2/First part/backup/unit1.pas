unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, math, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button_math: TButton;
    Edit_a: TEdit;
    Edit_b: TEdit;
    Label1: TLabel;
    answer: TLabel;
    Label_a: TLabel;
    Label_b: TLabel;
    procedure Button_mathClick(Sender: TObject);
    procedure Label_aClick(Sender: TObject);
    procedure Label_bClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label_aClick(Sender: TObject);
begin

end;

procedure TForm1.Button_mathClick(Sender: TObject);
var a,b : integer;
  f :  float;
begin
  a:= StrToInt(Edit_a.text);
  b:= StrToInt(Edit_b.text);
  f := sqrt(pi()/8)*sqrt(sqrt(a+b)/(power(a,2)+power(b,2)))-a*power(b,3);
  answer.Caption:= FloatToStr(f);
end;

procedure TForm1.Label_bClick(Sender: TObject);
begin

end;

end.

