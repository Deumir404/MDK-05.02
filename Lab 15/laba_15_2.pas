program WordCount;

type PNode = ^Node;   { указатель на узел }   
     Node = record    { структура узла }
       word: string[40]; { слово }
       count: integer;   { счетчик повторов слов }
       next: PNode;      { ссылка на следующий }
     end;
var
  F: Text;
  Head, Current, Previous: PNode;
  WordToFind: string;

procedure AddFirst ( var Head: PNode; NewNode: PNode );
begin
  NewNode^.next := Head;
  Head := NewNode;
end;


procedure Addafter ( var Head: PNode; NewNode: PNode );
begin
  Head^.next := NewNode;
end;

procedure AddLast ( var Head: PNode; NewNode: PNode );
var pp: PNode;
begin
  if Head = nil then
    AddFirst ( Head, NewNode ) // добавляем в пустой список
  else begin
    pp := Head;
    while pp^.next <> nil do // поиск последнего узла
      pp := pp^.next;
    AddAfter ( pp, NewNode ); // после узла pp добавляем узел
  end;
end;

function CreateNode(NewWord: string): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;

function FindPlace(Head: PNode; NewWord: string): PNode;
var pp: PNode; count: integer;
begin
  pp := Head;
  while (pp <> nil) and (NewWord <> pp^.word) do
  begin
    pp := pp^.next;
  end;
  Result := pp;
  FindPlace := Result
end;

procedure count_list(Head: PNode);
var pp: PNode; count: integer;
begin
  pp := Head;
  count := 0;
  while pp <> nil do
  begin
    count += 1;
    pp := pp^.next;
  end;
  Writeln(count);
end;

procedure show_list(Head: PNode);
var pp: PNode; correct: integer;
begin
  pp := Head;
  correct := 1;
  while pp <> nil do
  begin
    if correct mod 2 = 0 then
    begin
      Writeln(pp^);
    end;
    pp := pp^.next;
    inc(correct);
  end;
end;

procedure show_min_max(Head: PNode);
var pp: PNode; min, max: integer;
begin
  pp := Head;
  min := pp^.count;
  max := pp^.count;
  while pp <> nil do
  begin
    if min > pp^.count then
      min := pp^.count;
    if max < pp^.count then
      max := pp^.count;
    pp := pp^.next;
  end;
  Writeln('Max element ',max);
  Writeln('Min element ',min);
end;
  

begin
  Assign(F, 'laba_15_2.txt');
  Reset(F);
  Head := nil;
  while not EOF(F) do
  begin
    Readln(F, WordToFind);
   // Addlast(Head, CreateNode(WordToFind));
    Previous := FindPlace(Head, WordToFind);
    if Previous = nil 
      then Addlast(Head, CreateNode(WordToFind))
    else 
      inc(previous^.count);
  end;
  count_list(Head);
  Writeln('--------');
  Show_list(Head);
  Writeln('--------');
  Show_min_max(Head);
  Close(F);
end.
