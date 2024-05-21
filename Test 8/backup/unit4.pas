unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Trectangle }

  Trectangle = class(TForm)
    Button_math: TButton;
    Edit_a: TEdit;
    Edit_b: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    answer_memo: TMemo;
    procedure Button_mathClick(Sender: TObject);
  private

  public

  end;

var
  rectangle: Trectangle;

implementation

{$R *.lfm}

{ Trectangle }

procedure Trectangle.Button_mathClick(Sender: TObject);
var a,b :real;
begin
  a := StrtoFloat(Edit_a.text);
  b := StrtoFloat(Edit_b.text);
  if (a>0) and (b>0) then
     answer_memo.Lines.add('Площадь равна '+ Floattostr(a*b) + ' cm')
  else answer_memo.Lines.add('Прямоугольник не существует')
end;

end.

