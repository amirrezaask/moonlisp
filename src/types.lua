local types = {
  number = "number",
  string = "string",
  list = "list",
  func = "function",
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

function types.make_list(opts)
  return {t=types.list, value=opts}
end

function types.make_func(n)
  return {t=types.func, value=n}
end

return types


