program ListOperations;

type
  PNode = ^TNode;
  TNode = record
    data: integer;
    next: PNode;
  end;

var
  head, current: PNode;
  i: integer;

procedure AddNode(var head: PNode; value: integer);
var
  newNode, temp: PNode;
begin
  New(newNode);
  newNode^.data := value;
  newNode^.next := nil;

  if head = nil then
    head := newNode
  else
  begin
    temp := head;
    while temp^.next <> nil do
      temp := temp^.next;
    temp^.next := newNode;
  end;
end;

procedure PrintList(head: PNode);
begin
  writeln('Полный список:');
  current := head;
  while current <> nil do
  begin
    write(current^.data, ' ');
    current := current^.next;
  end;
  writeln;
end;

procedure PrintEvenElements(head: PNode);
begin
  writeln('Четные элементы списка:');
  current := head;
  while current <> nil do
  begin
    if current^.data mod 2 = 0 then
      write(current^.data, ' ');
    current := current^.next;
  end;
  writeln;
end;

procedure FreeList(var head: PNode);
var
  temp: PNode;
begin
  while head <> nil do
  begin
    temp := head;
    head := head^.next;
    Dispose(temp);
  end;
end;

begin
  head := nil;

  for i := 1 to 10 do
    AddNode(head, i);

  PrintList(head);

  PrintEvenElements(head);

  FreeList(head);
end.