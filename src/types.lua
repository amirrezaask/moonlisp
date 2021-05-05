local types = {
  number = "number",
  string = "string",
  list = "list",
  symbol = 'symbol',
}

function types.make_number(n)
  return {t=types.number, value=n}
end

function types.make_string(n)
  return {t=types.string, value=n}
end

function types.make_symbol(n)
  return {t=types.symbol, value=n}
end

function types.make_list(t)
  return {t=types.list, value=t}
end

return types


