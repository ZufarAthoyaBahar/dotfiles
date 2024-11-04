return {
  "olimorris/onedarkpro.nvim",
  config = function()
    require("onedarkpro").setup({
      theme = "onedark", -- or "deep", "darker"
     
        italic = true,
        italic_comments = true,
    })
  end,
}
