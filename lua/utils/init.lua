local M = {}

function M.when_file_matches(pattern)
  return function(_, ctx)
    return vim.fs.find(function(name)
      return name:match(pattern) ~= nil
    end, { upward = true, path = ctx.dirname, type = 'file' })[1] ~= nil
  end
end

return M
