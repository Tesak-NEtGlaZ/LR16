program FrequencyDictionary;

type
  PNode = ^TNode;
  TNode = record
    word: string;
    count: integer;
    next: PNode;
  end;

var
  head, current: PNode;
  inputText: string;
  word: string;
  totalWords: integer;
  i: integer;

procedure AddWord(var head: PNode; w: string);
var
  node, prev, newnode: PNode;
  found: boolean;
begin
  if head = nil then
  begin
    New(head);
    head^.word := w;
    head^.count := 1;
    head^.next := nil;
    exit;
  end;

  node := head;
  prev := nil;
  found := False;

  while (node <> nil) and not found do
  begin
    if node^.word = w then
    begin
      node^.count := node^.count + 1;
      found := True;
    end
    else if node^.word > w then
      found := True
    else
    begin
      prev := node;
      node := node^.next;
    end;
  end;

  if not found or (node = nil) or (node^.word <> w) then
  begin
    New(newnode);
    newnode^.word := w;
    newnode^.count := 1;
    
    if prev = nil then
    begin
      newnode^.next := head;
      head := newnode;
    end
    else
    begin
      newnode^.next := node;
      prev^.next := newnode;
    end;
  end;
end;

function CountUniqueWords(head: PNode): integer;
var
  count: integer;
  node: PNode;
begin
  count := 0;
  node := head;
  
  while node <> nil do
  begin
    count := count + 1;
    node := node^.next;
  end;
  
  CountUniqueWords := count;
end;

procedure PrintDictionary(head: PNode);
var
  node: PNode;
begin
  node := head;
  writeln('Алфавитно-частотный словарь:');
  writeln('----------------------------');
  
  while node <> nil do
  begin
    writeln(node^.word:15, ' - ', node^.count:3, ' раз(а)');
    node := node^.next;
  end;
end;

procedure FreeDictionary(var head: PNode);
var
  node, temp: PNode;
begin
  node := head;
  
  while node <> nil do
  begin
    temp := node;
    node := node^.next;
    Dispose(temp);
  end;
  
  head := nil;
end;

begin
  head := nil;
  writeln('Введите текст для анализа (завершите пустой строкой):');
  
  repeat
    readln(inputText);
    if inputText <> '' then
    begin
      word := '';
      for i := 1 to length(inputText) do
      begin
        if inputText[i] in ['a'..'z','A'..'Z'] then
          word := word + inputText[i]
        else if word <> '' then
        begin
          AddWord(head, LowerCase(word));
          word := '';
        end;
      end;
      
      if word <> '' then
        AddWord(head, LowerCase(word));
    end;
  until inputText = '';

  PrintDictionary(head);
  totalWords := CountUniqueWords(head);
  writeln('----------------------------');
  writeln('Количество различных слов: ', totalWords);
  FreeDictionary(head);
end.