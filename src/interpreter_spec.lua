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

  end)
  it('handle strings', function()

  end)
  it('handle symbols', function()

  end)
  it('handle def', function()

  end)
  it('handle fn', function()

  end)
  it('handle macro', function()

  end)
end)
