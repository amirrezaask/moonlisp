local lpeg = require('lpeg')

local patterns = {}

function patterns.one_of(...)
  return lpeg.S(...)
end

function patterns.exact(s)
  return lpeg.P(s)
end

function patterns.grammer(...)
  return lpeg.P(...)
end

function patterns.range(...)
  return lpeg.R(...)
end

function patterns.zero_or_more(p)
 return p ^ 0 
end

function patterns.one_or_more(p)
  return p ^ 1
end

function patterns.at_most_once(p)
  return p ^ -1
end

function patterns.at_most_n(p, n)
  return p * -n
end

function patterns.reduce(t, f)
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

function patterns.all(...)
  return patterns.reduce({...}, function(a, b) return a*b end)
end

function patterns.either(...)
  return patterns.reduce({...}, function(a, b) return a+b end)
end

function patterns.capture_table(...)
  return lpeg.Ct(...)
end

function patterns.apply(p, fn)
  return p / fn
end

function patterns.nonterm(...)
  return lpeg.V(...)
end

return patterns
