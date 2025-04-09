return {
  {
    "hoob3rt/lualine.nvim",
    opts = {
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
        },
        inactive_winbar = {
          lualine_c = {'filename'},
        }
    }
  }
}
