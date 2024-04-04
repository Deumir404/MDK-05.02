program Queue_com;

uses crt;



type PNode_din = ^Node_din;   { указатель на узел }   
     Node_din = record    { узел и его структура }
       word: string[40]; { поле для слова }
       next: PNode_din;    { поле - ссылка на следующий узел }
       prev: PNode_din;    { поле - ссылка на предыдущий узел }         
     end;

procedure CreateBase ( var Head, Tail: PNode_din; NewNode: PNode_din);
begin
  Head := NewNode;
  Tail := NewNode;
end;


procedure DelHead_din ( var Head: PNode_din);
begin
  if Head = nil then
    Writeln('Очередь пуста')
  else if Head^.next = nil then
  begin
    var a := Head;
    Head := nil;
    dispose(a);
  end
  else
  begin
    var a := Head;
    Head := Head^.next;
    dispose(a);
  end
end;





procedure show_list_din(Head: PNode_din);
var pp: PNode_din; correct: integer;
begin
  if Head = nil then
    Write('Очередь пуста')
  else
    pp := Head;
    while pp <> nil do
    begin
      Write('<-',pp^.word);
      pp := pp^.next;
    end;
end;



function CreateNode_din(NewWord: string): PNode_din;
var NewNode: PNode_din;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.next := nil;
  Result := NewNode;
end;

procedure AddTail_din ( var Head,Tail: PNode_din);
begin
  Writeln('Введите слово');
  var word:string;
  Readln(word);
  var NewNode := CreateNode_din(word);
  if Head = nil then
    CreateBase(Head,Tail,Newnode)
  else
    begin
    Tail^.next := NewNode;
    Tail := NewNode;
    end
    
    
end;
  
var c := '0';
    Head, Tail: PNode_din;
    
Procedure Show_menu_din();
begin
  Head := nil;
  Tail := nil;
while((c <> 'e') and (c<>'E')) do
begin
  Clrscr();
  show_list_din(Head);
  Writeln();
  Writeln('1. Добавить в конец');
  Writeln('2. Удалить Начало');
  Writeln('e. Выход');
  c:=ReadKey();
  if (c = '1') then
    AddTail_din(Head,Tail)
  else if (c = '2') then
    DelHead_din(Head)
  else if (c = 'e') then
  begin
    c := '0';
    break;
   end
  else Writeln('Нажмите кнопку из списка');Sleep(1000);
end;
end;







type PNode = ^Node;   { указатель на узел }   
     Node = record    { узел и его структура }
       word: string[40]; { поле для слова }      
     end;
     
function CreateNode(NewWord: string): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  Result := NewNode;
end;

var
  Correct:= 0;
  Queue: array of PNode;
  
procedure DelHead ( var Queue: array of PNode);
begin
  for var i:=0 to correct-2 do
    Queue[i] := Queue[i+1];
  if correct > 0 then
    Correct -= 1
end;

procedure AddTail (var Queue: array of PNode; var Correct: integer);
var word_1:string;NewNode:PNode;
begin
  if correct <> 10 then
  begin
    Writeln('Введите слово');
    Readln(word_1);
    NewNode := CreateNode(word_1);
    Queue[correct] := NewNode;
    Correct += 1;
  end
  else 
    Writeln('Очередь заполнена')
end;

procedure show_list(Queue: array of PNode; Correct:integer);
begin
  if correct > 0 then
    for var i:=0 to Correct-1 do
      Write('<-',Queue[i]^.word)
  else
    write('Очередь пуста')
end;

Procedure show_menu();
begin
var stat := '0';
SetLength(Queue,10);
while((stat <> 'e') and (stat<>'E')) do
begin
  Clrscr();
  show_list(Queue, Correct);
  Writeln();
  Writeln('1. Добавить в конец');
  Writeln('2. Удалить Начало');
  Writeln('e. Выход');
  stat:=ReadKey();
  if (stat = '1') then
    AddTail(Queue,Correct)
  else if (stat = '2') then
    DelHead(Queue)
  else if (stat = 'e') then
  begin
    stat := '0';
    break;
   end
  else Writeln('Нажмите кнопку из списка');Sleep(1000);
end;
end;



var d:='0';
begin
  while((d <> 'e') and (d <>'E')) do
  begin
  Clrscr();
  Writeln('1. Использовать динамическую структуру');
  Writeln('2. Использовать массив(10 чисел)');
  Writeln('e. Выход');
  d:=ReadKey();
  if (d = '1') then
    Show_menu_din()
  else if (d = '2') then
    Show_menu()
  else if (d = 'e') then
    d := 'e'
  else Writeln('Нажмите кнопку из списка');Sleep(1000);
  end;
end.

