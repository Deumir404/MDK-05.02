uses GraphABC;
uses DrawFractal;



 

var m: integer; 

 
var x, y, x1, y1: integer;

procedure KeyDown(key: integer);
begin
  case key of
    VK_Down: begin y := y - 5; y1 := y1 - 5 end;
    VK_Up: begin y += 5; y1 += 5 end;
    VK_Right: begin x := x - 5; x1 := x1 - 5 end;
    VK_Left: begin x := x + 5; x1 := x1 + 5 end;
    VK_A: x := x - 50;
    Vk_S: x := x + 50;
    vk_z: if m>0 then m -= 1;
    vk_x:if m<5 then m += 1;
    vk_F: 
  end; 
  Window.Clear; 
  draw(x, y, x1, y1, m);
  instruction(m);
  redraw;
end;
 

 
begin
  LockDrawing;
  x := 100;
  y := 200;
  x1 := 400;
  y1 := 200;
  m:= 2;
  draw(x, y, x1, y1, m);
  instruction(m);
  redraw;
  OnkeyDown := keydown;
end.