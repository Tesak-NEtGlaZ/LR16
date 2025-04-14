program PointerExample;

var
  i: integer;
  i_ptr: ^integer;

begin
  i := 2;

  i_ptr := @i;

  writeln('Значение переменной i: ', i);
  writeln('Значение по адресу i_ptr: ', i_ptr^);

  i_ptr^ := 5;
  writeln('После изменения через указатель:');
  writeln('Значение переменной i: ', i);
  writeln('Значение по адресу i_ptr: ', i_ptr^);
end.