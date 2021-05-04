local lpeg = require("lpeg")
local inspect = require('inspect')

local function P(obj)
  print(inspect(obj))
end
local function one_of(...)
  return lpeg.S(...)
end
local function grammer(...)
  return lpeg.P(...)
end
local function range(...)
  return lpeg.R(...)
end

local function zero_or_more(p)
 return p ^ 0 
end

local function one_or_more(p)
  return p ^ 1
end

local function at_most_once(p)
  return p ^ -1
end

local function at_most_n(p, n)
  return p * -n
end

local function reduce(t, f)
  local args = t
  local acc
  for i, p in ipairs(args) do
    if i == 1 then 
      acc = p 
    else
      acc = f(acc, p)
    end
  end
  return acc 

end

local function all(...)
  return reduce({...}, function(a, b) return a*b end)
end

local function either(...)
  return reduce({...}, function(a, b) return a+b end)
end

local function capture(...)
  return lpeg.C(...)
end

local function apply(p, fn)
  return p / fn
end

local function nonterm(...)
  return lpeg.V(...)
end

local whitespace = zero_or_more(one_of(" \t\r\n"))
local startings = whitespace * one_of('[({') * whitespace

-- match ending tokens
local endings = whitespace * one_of('])}') * whitespace

-- captures any symbol
local symbol = whitespace * (one_or_more(
  either(
    range('az'),
    range('AZ'),
    one_of('-_?!')
)))

local number = whitespace * apply(capture(one_or_more(range('09'))), tonumber)

local function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

local moonlisp_parser = grammer {
  'root',
  root = either(nonterm('list'), symbol, number),
  list = startings * apply(capture(zero_or_more(either(symbol, nonterm('list')))), function(list_elms) return split(list_elms, ' ') end) * endings
}

return moonlisp_parser
