require 'busted.runner'()
local assert = require('luassert')
local equal = assert.are.same
local p = require('parser')
local parser = p.parser
local interpreter = require("interpreter")

describe('make lua code', function()
  it('handle function calls', function()
    local sexp = parser:match("(handle 1 2)")
    local code = interpreter(sexp)
    equal('handle(1, 2)', code)
  end)

  it('handle numbers', function()
    local sexp = parser:match('2')
    local code = interpreter(sexp)
    equal('2', code)
  end)

  it('handle strings', function()
    local sexp = parser:match('"amirreza"')
    local code = interpreter(sexp)
    equal('"amirreza"', code)
  end)

  it('handle symbols', function()
    local sexp = parser:match('symbol')
    local code = interpreter(sexp)
    equal('symbol', code)
  end)

  it('handle def', function()
    local sexp = parser:match('(def name "value")')
    local code = interpreter(sexp)
    equal('local name = "value"', code)
  end)

  it('handle fn', function()
    local sexp = parser:match('(fn (name) (print name))')
    local code = interpreter(sexp)
    equal('function(name)\nprint(name)end', code)
  end)
  it('handle macro', function()

  end)
end)
