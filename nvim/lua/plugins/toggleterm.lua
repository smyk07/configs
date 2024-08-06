return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 18,
    open_mapping = [[<c-\>]],
    direction = "horizontal",
    close_on_exit = true,
    persist_size = true,
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  },
}
