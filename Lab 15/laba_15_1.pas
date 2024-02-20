program laba15_1;
var i : integer;
var i_ptr: ^integer;
begin
  i := 2;
  new(i_ptr);
  i_ptr := @i;
  writeln('Адрес  ='  , i_ptr); 
  writeln('Значение = ', i_ptr^); 
end.