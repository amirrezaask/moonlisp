local inspect = require('inspect')
local interpreter = {}

local function eval_def(sexp)
  local name = sexp.value[2].value
  local value = sexp.value[3]:represent()
  return string.format("local %s = %s", name, value)
end

local function eval_fn(sexp)
end

local function eval_macro(sexp)

end

local special_forms = {
  def = eval_def,
  fn = eval_fn,
  macro = eval_macro,
}

local function handle_values(sexp)
  if sexp.t == 'string' then return string.format('"%s"', sexp.value) end
  if sexp.t == 'symbol' then return string.format('%s', sexp.value) end
  if sexp.t == 'number' then return string.format('%s', sexp.value) end
end

local function is_special_form(sexp)
  for name, _ in pairs(special_forms) do
    if name == sexp.value[1].value then return true end
  end
  return false
end

local function unpack_sexp(sexp)
  local fn = sexp.value[1].value
  table.remove(sexp.value, 1)
  local args = {}
  for _, e in ipairs(sexp.value) do
    table.insert(args, e:represent())
  end
  return fn, args
end


local function handle_special_forms(sexp)
  for name, callback in pairs(special_forms) do
    if name == sexp.value[1].value then return callback(sexp) end
  end
end

local function handle_function_call(sexp)
  local fn, args = unpack_sexp(sexp)
  return string.format("%s(%s)", fn, table.concat(args, ", "))
end

local eval = function(sexp)
  if handle_values(sexp) then return handle_values(sexp) end
  if is_special_form(sexp) then return handle_special_forms(sexp) end
  return handle_function_call(sexp) 
end

-- local parser = require('parser').parser
-- local code = parser:match('2')
-- print(inspect(eval(code)))
return eval
