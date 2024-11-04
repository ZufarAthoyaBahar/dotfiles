-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M =  {
   base46 = {
     theme = "everforest",
     hl_add = {},
     hl_override = {
      ["@comment"] = { italic = false, fg = "#868686" },
    },
     integrations = {},
     changed_themes = {},
     transparency = false,
     theme_toggle = { "everforest", "everforest" },
   },

   ui = {
     cmp = {
       lspkind_text = true,
       style = "default", -- default/flat_light/flat_dark/atom/atom_colored
       format_colors = {
         tailwind = false,
       },
     },
 
     telescope = { style = "bordered" }, -- borderless / bordered
 
     statusline = {
       theme = "minimal", -- default/vscode/vscode_colored/minimal
       -- default/round/block/arrow separators work only for default statusline theme
       -- round and block will work for minimal theme only
       separator_style = "block",
       order = nil,
       modules = nil,
     },
 
     -- lazyload it when there are 1+ buffers
     tabufline = {
       enabled = true,
       lazyload = true,
       order = { "treeOffset", "buffers", "tabs", "btns" },
       modules = nil,
     }, 
   },

   nvdash = {
     load_on_startup = true,

     header = {
[[TTTTTTTTTTTTTTTTTTTTTTTUUUUUUUU     UUUUUUUURRRRRRRRRRRRRRRRR   UUUUUUUU     UUUUUUUUVVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM]],
[[T:::::::::::::::::::::TU::::::U     U::::::UR::::::::::::::::R  U::::::U     U::::::UV::::::V           V::::::VI::::::::IM:::::::M             M:::::::M]],
[[T:::::::::::::::::::::TU::::::U     U::::::UR::::::RRRRRR:::::R U::::::U     U::::::UV::::::V           V::::::VI::::::::IM::::::::M           M::::::::M]],
[[T:::::TT:::::::TT:::::TUU:::::U     U:::::UURR:::::R     R:::::RUU:::::U     U:::::UUV::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::M]],
[[TTTTTT  T:::::T  TTTTTT U:::::U     U:::::U   R::::R     R:::::R U:::::U     U:::::U  V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M]],
[[        T:::::T         U:::::D     D:::::U   R::::R     R:::::R U:::::D     D:::::U   V:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M]],
[[        T:::::T         U:::::D     D:::::U   R::::RRRRRR:::::R  U:::::D     D:::::U    V:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M]],
[[        T:::::T         U:::::D     D:::::U   R:::::::::::::RR   U:::::D     D:::::U     V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M]],
[[        T:::::T         U:::::D     D:::::U   R::::RRRRRR:::::R  U:::::D     D:::::U      V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M]],
[[        T:::::T         U:::::D     D:::::U   R::::R     R:::::R U:::::D     D:::::U       V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M]],
[[        T:::::T         U:::::D     D:::::U   R::::R     R:::::R U:::::D     D:::::U        V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M]],
[[        T:::::T         U::::::U   U::::::U   R::::R     R:::::R U::::::U   U::::::U         V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M]],
[[      TT:::::::TT       U:::::::UUU:::::::U RR:::::R     R:::::R U:::::::UUU:::::::U          V:::::::V         II::::::IIM::::::M               M::::::M]],
[[      T:::::::::T        UU:::::::::::::UU  R::::::R     R:::::R  UU:::::::::::::UU            V:::::V          I::::::::IM::::::M               M::::::M]],
[[      T:::::::::T          UU:::::::::UU    R::::::R     R:::::R    UU:::::::::UU               V:::V           I::::::::IM::::::M               M::::::M]],
[[      TTTTTTTTTTT            UUUUUUUUU      RRRRRRRR     RRRRRRR      UUUUUUUUU                  VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM]],
[[ ]],
[[ ]],
[[ ]],
    },

     buttons = {
       { txt = "󰙅  Toggle Tree", keys = "Ctrl n", cmd = "NvimTreeToggle" },
       { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
       { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
       -- more... check nvconfig.lua file for full list of buttons
     },
   },
 
   term = {
     winopts = { number = false },
     sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
     float = {
       relative = "editor",
       row = 0.1,
       col = 0.1,
       width = 0.8,
       height = 0.7,
       border = "rounded",
     },
   }, 
  
   lsp = { signature = true },
 
   cheatsheet = {
     theme = "grid", -- simple/grid
     -- excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
   },

   mason = { pkgs = {} },

   colorify = {
     enabled = true,
     mode = "virtual", -- fg, bg, virtual
     virt_text = "󱓻 ",
     highlight = { hex = true, lspvars = true },
   },
 }

return M
