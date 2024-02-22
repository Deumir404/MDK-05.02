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

function FindPlace(Head: PNode; NewWord: string): PNode;
var pp: PNode; count: integer;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
  begin
    pp := pp^.next;
  end;
  FindPlace := pp;
end;

procedure AddAfter(var Head: Pnode; NewNode: Pnode);
begin
  NewNode^.next := Head^.next;
  Head^.next := NewNode;
end;
  
procedure AddBefore ( var Head: PNode; p, NewNode: PNode );
var q:PNode;
begin
  q := Head;
  if p = Head then
    AddFirst(Head, NewNode)
  else begin
    while (q<>nil) and (q^.next <> p) do
      q := q^.next;
    if q <> nil then AddAfter(q,NewNode);
  end;
end;

procedure AddLast ( var Head: PNode; NewNode: PNode );
var pp: PNode;
begin
  if Head = nil then
    AddFirst ( Head, NewNode ) // добавляем в пустой список
  else begin
    pp:= FindPlace(Head, NewNode^.word);
    AddBefore (Head, pp, NewNode ); // после узла pp добавляем узел
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

function Find(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  // пока не конец списка и слово в просматриваемом узле не равно искомому
  while (pp <> nil) and (NewWord <> pp^.word) do 
    pp := pp^.next;
  Result := pp;
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
  Writeln('Amount unique word ',count);
end;

procedure show_list(Head: PNode);
var pp: PNode; correct: integer;
begin
  pp := Head;
  correct := 2;
  while pp <> nil do
  begin
    if correct mod 2 = 0 then
    begin
      Writeln(pp^);
    end;
    pp := pp^.next;
    //inc(correct);
  end;
end;

procedure show_min_max(Head: PNode);
var pp: PNode; min, max: PNode;
begin
  pp := Head;
  min := pp;
  max := pp;
  while pp <> nil do
  begin
    if min^.count > pp^.count then
      min := pp;
    if max^.count < pp^.count then
      max := pp;
    pp := pp^.next;
  end;
  Writeln('Max count element ',max^.word);
  Writeln('Min count element ',min^.word);
end;
  

begin
  Assign(F, 'laba_15_2.txt');
  Reset(F);
  Head := nil;
  while not EOF(F) do
  begin
    Readln(F, WordToFind);
    Previous := Find(Head, WordToFind);
    if Previous = nil then
      Addlast(Head, CreateNode(WordToFind))
    else inc(previous^.count);
  end;
  count_list(Head);
  Writeln('--------');
  Show_list(Head);
  Writeln('--------');
  Show_min_max(Head);
  Close(F);
end.
