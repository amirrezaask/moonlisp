require 'busted.runner'()
local assert = require('luassert')
local equal = assert.are.same
local p = require('parser')
local parser = p.parser
local types = p.types

-- TODO(amirreza): make a custom assert equal to match our types objects
describe('parser: ', function()
  it('numbers', function()
    equal(types.make_number(123).value, parser:match("123").value)
    equal(types.make_number(123).t, parser:match("123").t)
    -- TODO(amirreza): need to parse floating point numbers
    -- TOOD(amirreza): need to parse hex numbers
    -- TODO(amirreza): needto parse number seperators
  end)

  it('symbol', function()
    equal(types.make_symbol('amirreza').value, parser:match('amirreza').value)
    equal(types.make_symbol('amirreza').t, parser:match('amirreza').t)
    equal(types.make_symbol('exists?').t, parser:match('exists?').t)
    equal(types.make_symbol('exists?').value, parser:match('exists?').value)
  end)

  it('string', function()
    -- TODO(amirreza): check if open and close quote are the same single or double
    equal(types.make_string('amirreza').value, parser:match([["amirreza"]]).value)
    equal(types.make_string('amirreza').t, parser:match([["amirreza"]]).t)
    equal(types.make_string('amirreza').value, parser:match([['amirreza']]).value)
    equal(types.make_string('amirreza').t, parser:match([['amirreza']]).t)
  end)

  it('list', function()
    -- equal(types.make_list({types.make_number(1), types.make_number(2), types.make_symbol('aa')}), parser:match('[1 2 aa]'))
    equal(types.make_list({types.make_list({types.make_number(1), types.make_number(2)})}).value[1].value[1].value, parser:match('[(1 2)]').value[1].value[1].value)
  end)
end)
