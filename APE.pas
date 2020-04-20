type
  tree = ^node;
  node = record
    info: integer;
    left: tree;
    right: tree;
  end;
  
var
  treeGlobal: tree;
  amount: integer;

procedure createTree(var treeGlobal: tree; n: integer);
var
  nodeLeft, nodeRight: integer;
  val: integer;
begin
  new(treeGlobal);
  write('Введите значение переменной: ');
  readln(val);
  treeGlobal^.info := val;
  nodeLeft := n div 2;
  nodeRight := n - nodeLeft - 1;
  if ( nodeLeft > 0 ) then
    createTree( treeGlobal^.left, nodeLeft )
  else
    treeGlobal^.left := nil;
    
  if ( nodeRight > 0 ) then
    createTree( treeGlobal^.right, nodeRight )
  else
    treeGlobal^.right := nil;   
end;

procedure RSD(var treeGlobal: tree);
begin
  if (treeGlobal <> nil) then
    begin
      writeln(treeGlobal^.info);
      RSD(treeGlobal^.left);
      RSD(treeGlobal^.right);
    end;
end; 

function Maximum(treeGlobal : tree) : integer;
begin
  if treeGlobal = nil then result := 0 
  else result := 1 + Max(Maximum(treeGlobal^.left), Maximum(treeGlobal^.right))
end;

function isPerfectTree(treeGlobal : tree) : boolean;
begin
  result := (treeGlobal = nil) or
    ((abs(Maximum(treeGlobal^.left) - Maximum(treeGlobal^.right)) <= 1) 
      and isPerfectTree(treeGlobal^.left) and isPerfectTree(treeGlobal^.right)
    )
end;
  
begin
  write('Введите количество элементов в древе: ');
  readln(amount);
  createTree(treeGlobal, amount);
  RSD(treeGlobal);
  Maximum( treeGlobal );
  if ( isPerfectTree ( treeGlobal ) ) then 
    write(true);
end.