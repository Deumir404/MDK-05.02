unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TTriangle_1 }

  TTriangle_1 = class(TForm)
    Button_math: TButton;
    Edit_a: TEdit;
    Edit_b: TEdit;
    Edit_c: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Answer_memo: TMemo;
    procedure Button_mathClick(Sender: TObject);
  private

  public

  end;

var
  Triangle_1: TTriangle_1;

implementation

{$R *.lfm}

{ TTriangle_1 }

procedure TTriangle_1.Button_mathClick(Sender: TObject);
var a,b,c, p, answer : real;
begin
  a := StrtoFloat(Edit_a.text);
  b := StrtoFloat(Edit_b.text);
  c := StrtoFloat(Edit_c.text);
  p := (a+b+c) / 2;
  if (a+b>c) and (a+c>b) and (b+c>b) then
     begin
     answer := sqrt(p*(p-a)*(p-b)*(p-c));
     Answer_memo.Lines.add('Площадь равна '+ Floattostr(answer) + ' cm');
     end
  else
  begin
    Answer_memo.Lines.add('Треугольник не существует');
    end;
end;


 end.
