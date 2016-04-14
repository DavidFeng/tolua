-- Namespace class
-- Represents a namesapce definition.
-- Stores the following fields:
--    name = class name
--    {i}  = list of members
classNamespace = {
 classtype = 'namespace',
 name = '',
}
classNamespace.__index = classNamespace
setmetatable(classNamespace,classModule)

-- Print method
function classNamespace:print (ident,close)
 print(ident.."Namespace{")
 print(ident.." name = '"..self.name.."',")
 local i=1
 while self[i] do
  self[i]:print(ident.." ",",")
  i = i+1
 end
 print(ident.."}"..close)
end

-- Internal constructor
function _Namespace (t)
 setmetatable(t,classNamespace)
 append(t)
 return t
end

-- Constructor
-- Expects the name and the body of the namespace.
function Namespace (n,b)
 local c = _Namespace(_Container{name=n})
 push(c)
 c:parse(strsub(b,2,strlen(b)-1)) -- eliminate braces
 pop()
end

