unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Grids;

type

  { Tfmain }

  Tfmain = class(TForm)
    Panel1: TPanel;
    bAdd: TSpeedButton;
    bEdit: TSpeedButton;
    bDel: TSpeedButton;
    bSort: TSpeedButton;
    SG: TStringGrid;
    procedure bAddClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bSortClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

type
  Contacts = record
    Name: string[100];
    Desc: string[200];
    Prop: string[200];
    Price: real;
    Stock: boolean;
  end; //record
var
  fmain: Tfmain;
  adres: string; //адрес, откуда запущена программа

implementation
uses Edit;

{$R *.lfm}

{ Tfmain }


procedure TfMain.bAddClick(Sender: TObject);
begin
  //очищаем поля, если там что-то есть:
  fEdit.eName.Text:= '';
  fEdit.eDesc.Text:= '';
  fEdit.eProperty.Text := '';
  fEdit.ePrice.Text := '';
  fEdit.CB_stock.Checked := false;
  //устанавливаем ModalResult редактора в mrNone:
  fEdit.ModalResult:= mrNone;
  //теперь выводим форму:
  fEdit.ShowModal;
  //если пользователь ничего не ввел - выходим:
  if (fEdit.eName.Text= '') or (fEdit.eDesc.Text= '') then exit;
  //если пользователь не нажал "Сохранить" - выходим:
  if fEdit.ModalResult <> mrOk then exit;
  //иначе добавляем в сетку строку, и заполняем её:
  SG.RowCount:= SG.RowCount + 1;
  SG.Cells[0, SG.RowCount-1]:= fEdit.eName.Text;
  SG.Cells[1, SG.RowCount-1]:= fEdit.eDesc.Text;
  SG.Cells[2, SG.RowCount-1]:= fEdit.eProperty.Text;
  SG.Cells[3, SG.RowCount-1]:= fEdit.ePrice.Text;
  if fEdit.CB_stock.Checked then
         SG.Cells[4, SG.RowCount-1]:= 'Да'
  else SG.Cells[4, SG.RowCount-1]:= 'Нет'
end;

procedure Tfmain.bDelClick(Sender: TObject);
begin
  //если данных нет - выходим:
  if SG.RowCount = 1 then exit;
  //иначе выводим запрос на подтверждение:
  if MessageDlg('Требуется подтверждение',
                'Вы действительно хотите удалить контакт "' +
                SG.Cells[0, SG.Row] + '"?',
      mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
         SG.DeleteRow(SG.Row);
end;


procedure Tfmain.bEditClick(Sender: TObject);
begin
  //если данных в сетке нет - просто выходим:
  if SG.RowCount = 1 then exit;
  //иначе записываем данные в форму редактора:
  fEdit.eName.Text:= SG.Cells[0, SG.Row];
  fEdit.eDesc.Text:= SG.Cells[1, SG.Row];
  fEdit.eProperty.Text:= SG.Cells[2, SG.Row];
  fEdit.ePrice.Text:= SG.Cells[3, SG.Row];
  if SG.Cells[4, SG.Row] = 'Да' then
         fEdit.CB_stock.Checked:= True
  else  fEdit.CB_stock.Checked:= False;
  //устанавливаем ModalResult редактора в mrNone:
  fEdit.ModalResult:= mrNone;
  //теперь выводим форму:
  fEdit.ShowModal;
  //сохраняем в сетку возможные изменения,
  //если пользователь нажал "Сохранить":
  if fEdit.ModalResult = mrOk then begin
    SG.Cells[0, SG.Row]:= fEdit.eName.Text;
    SG.Cells[1, SG.Row]:= fEdit.eDesc.Text;
    SG.Cells[2, SG.Row]:= fEdit.eProperty.Text;
    SG.Cells[3, SG.Row]:= fEdit.ePrice.Text;
    if fEdit.CB_stock.Checked then
       SG.Cells[4, SG.Row]:= 'Да'
    else SG.Cells[4, SG.Row]:= 'Нет';
  end;
end;

procedure Tfmain.bSortClick(Sender: TObject);
begin
  //если данных в сетке нет - просто выходим:
  if SG.RowCount = 1 then exit;
  //иначе сортируем список:
  SG.SortColRow(true, 0);
end;

procedure Tfmain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  MyCont: Contacts; //для очередной записи
  f: file of Contacts; //файл данных
  i: integer; //счетчик цикла
begin
  //если строки данных пусты, просто выходим:
  if SG.RowCount = 1 then exit;
  //иначе открываем файл для записи:
  try
    AssignFile(f, adres + 'ingredients.dat');
    Rewrite(f);
    //теперь цикл - от первой до последней записи сетки:
    for i:= 1 to SG.RowCount-1 do begin
      //получаем данные текущей записи:
      MyCont.Name:= SG.Cells[0, i];
      MyCont.Desc:= SG.Cells[1, i];
      MyCont.Prop:= SG.Cells[2, i];
      MyCont.Price:= StrToFloat(SG.Cells[3, i]);
      if SG.Cells[4, i] = 'Да' then
         MyCont.Stock:= True
      else MyCont.Stock := False;
      //записываем их:
      Write(f, MyCont);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure Tfmain.FormCreate(Sender: TObject);
var
  MyCont: Contacts; //для очередной записи
  f: file of Contacts; //файл данных
  i: integer; //счетчик цикла
begin
  //сначала получим адрес программы:
  adres:= ExtractFilePath(ParamStr(0));
  //настроим сетку:
  SG.Cells[0, 0]:= 'Название';
  SG.Cells[1, 0]:= 'Описание';
  SG.Cells[2, 0]:= 'Свойство';
  SG.Cells[3, 0]:= 'Цена, руб';
  SG.Cells[4, 0]:= 'Наличие на складе';
  SG.ColWidths[0]:= 140;
  SG.ColWidths[1]:= 150;
  SG.ColWidths[2]:= 150;
  SG.ColWidths[3]:= 150;
  SG.ColWidths[4]:= 105;
  //если файла данных нет, просто выходим:
  if not FileExists(adres + 'ingredients.dat') then exit;
  //иначе файл есть, открываем его для чтения и
  //считываем данные в сетку:
  try
    AssignFile(f, adres + 'ingredients.dat');
    Reset(f);
    //теперь цикл - от первой до последней записи сетки:
    while not Eof(f) do begin
      //считываем новую запись:
      Read(f, MyCont);
      //добавляем в сетку новую строку, и заполняем её:
        SG.RowCount:= SG.RowCount + 1;
        SG.Cells[0, SG.RowCount-1]:= MyCont.Name;
        SG.Cells[1, SG.RowCount-1]:= MyCont.Desc;
        SG.Cells[2, SG.RowCount-1]:= MyCont.Prop;
        SG.Cells[3, SG.RowCount-1]:= FloatToStr(MyCont.Price);
        if MyCont.Stock then
           SG.Cells[4, SG.RowCount-1]:= 'Да'
        else SG.Cells[4, SG.RowCount-1]:= 'Нет'
    end;
  finally
    CloseFile(f);
  end;
end;



end.

