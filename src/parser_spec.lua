require 'busted.runner'()
local assert = require('luassert')
local equal = assert.are.same
local p = require('parser')
local parser = p.parser
local types = p.types

describe('parser: ', function()
  it('numbers', function()
    equal(types.make_number(123), parser:match("123"))
    -- TODO(amirreza): need to parse floating point numbers
    -- TOOD(amirreza): need to parse hex numbers
    -- TODO(amirreza): needto parse number seperators
  end)
  it('symbol', function()
    equal(types.make_symbol('amirreza'), parser:match('amirreza'))
    equal(types.make_symbol('exists?'), parser:match('exists?'))
  end)

  -- it('list', function()
  --   equal({1, 2, 3}, parser:match('[1 2 3]'))
  -- end)
end)
