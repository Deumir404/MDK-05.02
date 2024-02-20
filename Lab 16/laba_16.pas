program WordCount;

type PNode = ^Node;   { указатель на узел }   
     Node = record    { узел и его структура }
       word: string[40]; { поле для слова }
       next: PNode;    { поле - ссылка на следующий узел }
       prev: PNode;    { поле - ссылка на предыдущий узел }         
     end;
var
  F, R: Text;
  Head, Tail, Current, Previous: PNode;
  WordToFind: string;

procedure CreateBase ( var Head: PNode; NewNode: PNode );
begin
  NewNode^.next := Head;
  Head := NewNode;
  Tail := NewNode;
end;

procedure AddHead ( var Head: PNode; NewNode: PNode );
begin
  NewNode^.next := Head;
  Head := NewNode;
end;

procedure DelHead ( var Head: PNode);
begin
  Head := Head^.next;
  dispose(Head^.prev);
end;


procedure AddTail ( var Tail: PNode; NewNode: PNode );
begin
  Tail^.next := NewNode;
  NewNode^.prev := Tail;
  Tail := NewNode;
end;

procedure DelTail ( var Tail: PNode);
begin
  Tail := Tail^.prev;
  dispose(Tail^.next)
end;

procedure show_list(Head: PNode);
var pp: PNode; correct: integer;
begin
  pp := Head;
  while pp <> nil do
  begin
    Write(pp^.word,' ');
    pp := pp^.next;
  end;
end;



function CreateNode(NewWord: string): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.next := nil;
  NewNode^.prev := nil;
  Result := NewNode;
end;
  

begin
  Assign(F, 'laba_16.txt');
  Reset(F);
  Assign(R, 'laba_16_2.txt');
  Rewrite(R);
  Head := nil;
  Tail := nil;
  while not EOF(F) do
  begin
    Readln(F, WordToFind);
    if Head = nil 
      then CreateBase(Head, CreateNode(WordToFind))
    else
      AddTail(Tail, CreateNode(WordToFind));
  end;
  show_list(Head);
  var cursor := Tail;
  while cursor <> nil do
  begin
    Writeln(R, cursor^.word);
    cursor := cursor^.prev;
  end;
  Writeln('Complete');
  Close(F);
  close(R);
end.
