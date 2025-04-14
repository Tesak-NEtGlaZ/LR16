program FindMinMaxInList;

type
  PNode = ^TNode;
  TNode = record
    data: integer;
    next: PNode;
  end;

var
  head, current: PNode;
  i: integer;
  minValue, maxValue: integer;

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
  writeln('Содержимое списка:');
  current := head;
  while current <> nil do
  begin
    write(current^.data, ' ');
    current := current^.next;
  end;
  writeln;
end;

procedure FindMinMax(head: PNode; var minVal, maxVal: integer);
begin
  if head = nil then
  begin
    writeln('Список пуст!');
    exit;
  end;

  minVal := head^.data;
  maxVal := head^.data;
  current := head^.next;

  while current <> nil do
  begin
    if current^.data < minVal then
      minVal := current^.data;
    if current^.data > maxVal then
      maxVal := current^.data;
    current := current^.next;
  end;
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
  Randomize;

  for i := 1 to 10 do
    AddNode(head, Random(100) + 1);

  PrintList(head);

  FindMinMax(head, minValue, maxValue);

  writeln('Минимальный элемент: ', minValue);
  writeln('Максимальный элемент: ', maxValue);

  FreeList(head);
end.