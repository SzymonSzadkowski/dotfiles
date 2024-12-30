local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values
local M = {}

M.live_with_args = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }

      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      local additional = {}
      if pieces[2] then
        local add = vim.split(pieces[2], " ")
        for _, arg in ipairs(add) do
          table.insert(additional, arg)
        end
      end

      return vim
        .iter({
          args,
          additional,
          {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--column",
            "--smart-case",
          },
        })
        :flatten():totable()
    end,

    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers
    .new(opts, {
      prompt_title = "Live grep with args",
      debounce = 100,
      finder = finder,
      sorter = require("telescope.sorters").empty(),
      previewer = conf.grep_previewer(opts),
    })
    :find()
end

return M
