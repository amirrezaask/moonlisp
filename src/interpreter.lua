local inspect = require('inspect')
local interpreter = {}
local builtin = {
  'def',
  'fn',
  'macro'
}
local function handle_values(sexp)
  if sexp.t == 'string' then return string.format('"%s"', sexp.value) end
  if sexp.t == 'symbol' then return string.format('%s', sexp.value) end
  if sexp.t == 'number' then return string.format('%s', sexp.value) end
end

local function is_builtin(fn)
  for _, name in ipairs(builtin) do
    if name == fn then return true end
  end
  return false
end

local function handle_builtin(fn, args)

end

local function handle_function_call(fn, args)

end

local eval = function(sexp)
  if handle_values(sexp) then return handle_values(sexp) end
  local fn = sexp.value[1].value
  local _args = sexp.value
  table.remove(_args, 1)
  local args = {}
  for _, a in ipairs(_args) do
    table.insert(args, a.value)
  end
  if is_builtin(fn) then return handle_builtin(fn, args) end
  return string.format("%s(%s)", fn, table.concat(args, ', '))
end


-- 'handle(1, 2)'
-- local parser = require('parser').parser
-- local code = parser:match('(handle 1 2)')
-- print(inspect(code))
-- print(inspect(eval(code)))
return eval
