require 'busted.runner'()
local assert = require('luassert')

describe('parser: ', function()
  it('numbers', function()
    local parser = require('parser')
    assert.are.equal(parser:match("123"), 123)
  end)

end)
