-- Define class
-- Represents a numeric const definition
-- The following filds are stored:
--   name = constant name
classDefine = {
 name = '',
}
classDefine.__index = classDefine
setmetatable(classDefine,classFeature)

-- register define
function classDefine:register ()
 output(' tolua_constant(tolua_S,"'..self.lname..'",'..self.name..');') 
end

-- Print method
function classDefine:print (ident,close)
 print(ident.."Define{")
 print(ident.." name = '"..self.name.."',")
 print(ident.." lname = '"..self.lname.."',")
 print(ident.."}"..close)
end


-- Internal constructor
function _Define (t)
 setmetatable(t,classDefine)
 t:buildnames()

 if t.name == '' then
  error("#invalid define")
 end

 append(t)
 return t
end

-- Constructor
-- Expects a string representing the constant name
function Define (n)
 return _Define{
  name = n
 }
end


