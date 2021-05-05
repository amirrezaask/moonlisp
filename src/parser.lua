local p = require('patterns') 
local types = require('types')
local inspect = require('inspect')

local whitespace = p.zero_or_more(p.one_of(" \t\r\n"))
local startings = whitespace * p.one_of('[({') * whitespace

-- match ending tokens
local endings = whitespace * p.one_of('])}') * whitespace

-- captures any symbol
local symbol = whitespace * p.apply(p.one_or_more(
  p.either(
    p.range('az'),
    p.range('AZ'),
    p.one_of('-_?!')
)), types.make_symbol)

local number = whitespace * p.apply(p.apply(p.one_or_more(p.range('09')), tonumber), types.make_number)

local moonlisp_parser = p.grammer {
  'root',
  root = p.either(p.nonterm('list'), symbol, number),
  list = startings *
      p.apply(p.zero_or_more(p.either(number, symbol, p.nonterm('list'))),
      function(...)
        return types.make_list({...})
    end
  )
    * endings
}

return {parser = moonlisp_parser, types = types}
