local types = {
  number = "number",
  string = "string",
  list = "list",
  symbol = 'symbol',
}

function types.make_number(n)
  return {
    t=types.number,
    value=n,
    represent = function(self)
      return string.format('%s', self.value)
  end}
end

function types.make_string(n)
  return {t=types.string, value=n, represent = function(self)
      return string.format('"%s"', self.value)
  end}
end

function types.make_symbol(n)
  return {t=types.symbol, value=n, represent = function(self)
      return string.format('%s', self.value)
  end}
end

function types.make_list(t)
  return {t=types.list, value=t, represent = function(self)
    local elems = {}
    for _, e in ipairs(self.value) do
      if e.represent then
        table.insert(elems, e:represent())
      end
    end
    return string.format('{%s}', table.concat(elems, ', '))
  end}
end

return types


