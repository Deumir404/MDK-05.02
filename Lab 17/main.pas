unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFmain }

  TFmain = class(TForm)
    Label1: TLabel;
    lClock: TLabel;
    Timer1: TTimer;
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure lClockClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Fmain: TFmain;

implementation

{$R *.lfm}

{ TFmain }

procedure TFmain.Timer1Timer(Sender: TObject);
  var i: byte; //для получения случайного числа
begin
  //первым делом меняем надпись метки:
  lClock.Caption:= TimeToStr(Now);
  //получаем случайное направление:
  i:= Random(4);
  //теперь в зависимости от направления двигаем метку:
  case i of
    0: lClock.Left:= lClock.Left + 50; //вправо
    1: lClock.Left:= lClock.Left - 50; //влево
    2: lClock.Top:= lClock.Top + 50; //вверх
    3: lClock.Top:= lClock.Top - 50; //вниз
  end;
  //теперь проверяем: не вышла ли метка за пределы формы?
  //если вышла - возвращаем её обратно
  //если ушла влево:
  if lClock.Left < 0 then lClock.Left:= 0;
  //если ушла вверх:
  if lClock.Top < 0 then lClock.Top:= 0;
  //если ушла вправо:
  if (lClock.Left + lClock.Width) > fMain.Width then
    lClock.Left:= fMain.Width - lClock.Width;
  //если ушла вниз:
  if (lClock.Top + lClock.Height) > fMain.Height then
    lClock.Top:= fMain.Height - lClock.Height;
end;

procedure TFmain.lClockClick(Sender: TObject);
begin

end;

procedure TFmain.FormKeyPress(Sender: TObject; var Key: char);
begin
  if key = #27 then close();
end;

end.

