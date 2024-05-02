unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    delete_1_symbol: TButton;
    four: TButton;
    five: TButton;
    six: TButton;
    mult: TButton;
    opposite: TButton;
    one: TButton;
    two: TButton;
    three: TButton;
    minus: TButton;
    zero: TButton;
    CE: TButton;
    comm: TButton;
    plus: TButton;
    equal: TButton;
    negative: TButton;
    C: TButton;
    SQRT_button: TButton;
    seven: TButton;
    eight: TButton;
    nine: TButton;
    divide: TButton;
    square: TButton;
    field: TEdit;
    procedure fourClick(Sender: TObject);
    procedure fiveClick(Sender: TObject);
    procedure sixClick(Sender: TObject);
    procedure multClick(Sender: TObject);
    procedure oppositeClick(Sender: TObject);
    procedure oneClick(Sender: TObject);
    procedure twoClick(Sender: TObject);
    procedure threeClick(Sender: TObject);
    procedure minusClick(Sender: TObject);
    procedure zeroClick(Sender: TObject);
    procedure delete_1_symbolClick(Sender: TObject);
    procedure commClick(Sender: TObject);
    procedure plusClick(Sender: TObject);
    procedure equalClick(Sender: TObject);
    procedure negativeClick(Sender: TObject);
    procedure CEClick(Sender: TObject);
    procedure CClick(Sender: TObject);
    procedure SQRT_buttonClick(Sender: TObject);
    procedure sevenClick(Sender: TObject);
    procedure eightClick(Sender: TObject);
    procedure nineClick(Sender: TObject);
    procedure divideClick(Sender: TObject);
    procedure squareClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Math : array[1..3] of string;
  comma : array[1..3] of boolean;
  correct : integer;

implementation

{$R *.lfm}

{ TForm1 }

 { TForm1 }
procedure TForm1.oneClick(Sender: TObject);
 begin
   math[correct]:= math[correct] + '1';
   field.text := math[1] + math[2] + math[3];
 end;

procedure TForm1.fourClick(Sender: TObject);
begin
   math[correct]:= math[correct] + '4';
   field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.fiveClick(Sender: TObject);
begin
   math[correct]:= math[correct] + '5';
   field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.sixClick(Sender: TObject);
begin
   math[correct]:= math[correct] + '6';
   field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.multClick(Sender: TObject);
begin
  math[2] := '*';
  correct := 3;
  field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.oppositeClick(Sender: TObject);
begin
     if math[1] <> '' then
  begin
     if strtofloat(math[1]) <> 0 then
     begin
          math[1] := FloattoStr(sqrt(StrtoFloat(math[1])));
          field.text := math[1] + math[2] + math[3];
     end
     else
     begin
        field.text := 'Ошибка';
        correct := 1;
        comma[1] := False;
        math[1] := '';
        math[3] := '';
        math[2] := '';
     end;
end;
end;

procedure TForm1.twoClick(Sender: TObject);
begin
   math[correct]:= math[correct] + '2';
   field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.threeClick(Sender: TObject);
begin
   math[correct]:= math[correct] + '3';
   field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.minusClick(Sender: TObject);
begin
  math[2] := '-';
  correct := 3;
  field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.zeroClick(Sender: TObject);
begin
      math[correct]:= math[correct] + '0';
      field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.delete_1_symbolClick(Sender: TObject);
begin
     if math[correct] <> '' then
          begin
      if math[correct][length(math[correct])] = ',' then
         comma[correct] := False;
  Delete(math[correct],length(math[correct]),1);
  field.text := math[1] + math[2] + math[3];
          end;
end;

procedure TForm1.commClick(Sender: TObject);
begin
     if (length(math[correct]) <> 0) and (comma[correct] = False) then
        begin
             comma[correct] := True;
             math[correct] :=  math[correct] + ',';
             field.text := math[1] + math[2] + math[3];
        end;
end;

procedure TForm1.negativeClick(Sender: TObject);
begin
     if math[correct] <> '' then
        begin
             math[correct] := floattostr(strtofloat(math[correct]) * -1);
             field.text := math[1] + math[2] + math[3];
        end;
end;

procedure TForm1.plusClick(Sender: TObject);
begin
  math[2] := '+';
  correct := 3;
  field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.equalClick(Sender: TObject);
begin
  if (math[1] = '') then
     begin
     field.text := 'Ошибка';
     correct := 1;
     comma[1] := False;
     comma[2] := False;
     comma[3] := False;
     math[1] := '';
     math[3] := '';
     math[2] := '';
     end
  else if (math[2] = '+') and (math[3] <> '') then
     begin
       math[1] := FloattoStr(StrtoFloat(math[1]) + StrtoFloat(math[3]));
       math[3] := '';
       comma[3] := False;
       field.text := math[1] + math[2] + math[3];
     end
  else if (math[2] = '-') and (math[3] <> '') then
     begin
       math[1] := FloattoStr(StrtoFloat(math[1]) - StrtoFloat(math[3]));
       math[3] := '';
       comma[3] := False;
       field.text := math[1] + math[2] + math[3];
     end
  else if (math[2] = '*') and (math[3] <> '') then
     begin
       math[1] := FloattoStr(StrtoFloat(math[1]) * StrtoFloat(math[3]));
       math[3] := '';
       comma[3] := False;
       field.text := math[1] + math[2] + math[3];
     end
  else if (math[2] = '/') and (math[3] <> '') then
     begin
       if strtofloat(math[3]) <> 0 then
     begin
          math[1] := FloattoStr(StrtoFloat(math[1])/StrToFloat(math[3]));
          correct := 3;
          comma[1] := False;
          math[3] := '';
          field.text := math[1] + math[2] + math[3];
     end
     else
     begin
        field.text := 'Ошибка';
        correct := 1;
        comma[1] := False;
        math[1] := '';
        math[3] := '';
        math[2] := '';
     end;
     end
end;

procedure TForm1.CEClick(Sender: TObject);
begin
  comma[correct] := False;
  math[correct] := '';
  field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.CClick(Sender: TObject);
begin
  math[1] := '';
  math[2] := '';
  math[3] := '';
  comma[1] := False;
  comma[2] := False;
  comma[3] := False;
  field.text := math[1] + math[2] + math[3];
  correct:= 1;
end;

procedure TForm1.SQRT_buttonClick(Sender: TObject);
begin
  if math[1] <> '' then
  begin
     if strtofloat(math[1]) >= 0 then
     begin
          math[1] := FloattoStr(sqrt(StrtoFloat(math[1])));
          field.text := math[1] + math[2] + math[3];
     end
     else
     begin
        field.text := 'Ошибка';
        correct := 1;
        comma[1] := False;
        math[1] := '';
        math[3] := '';
        math[2] := '';
     end;
end;
end;

procedure TForm1.sevenClick(Sender: TObject);
begin
   math[correct]:= math[correct] + '7';
   field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.eightClick(Sender: TObject);
begin
      math[correct]:= math[correct] + '8';
      field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.nineClick(Sender: TObject);
begin
      math[correct]:= math[correct] + '9';
      field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.divideClick(Sender: TObject);
begin
  math[2] := '/';
  correct := 3;
  field.text := math[1] + math[2] + math[3];
end;

procedure TForm1.squareClick(Sender: TObject);
begin
     math[1] := Floattostr(StrtoFloat(math[1])* StrtoFloat(math[1]));
     math[3] := '';
     math[2] := '';
     field.text := math[1] + math[2] + math[3];
end;



end.

