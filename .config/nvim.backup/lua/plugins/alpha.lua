return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    dashboard.section.header.val = {
      [[                      TTTTTTTTTTTTTTTTTTTTTTTUUUUUUUU     UUUUUUUURRRRRRRRRRRRRRRRR   UUUUUUUU     UUUUUUUUVVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM]],
[[                      T:::::::::::::::::::::TU::::::U     U::::::UR::::::::::::::::R  U::::::U     U::::::UV::::::V           V::::::VI::::::::IM:::::::M             M:::::::M]],
[[                      T:::::::::::::::::::::TU::::::U     U::::::UR::::::RRRRRR:::::R U::::::U     U::::::UV::::::V           V::::::VI::::::::IM::::::::M           M::::::::M]],
[[                      T:::::TT:::::::TT:::::TUU:::::U     U:::::UURR:::::R     R:::::RUU:::::U     U:::::UUV::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::M]],
[[                      TTTTTT  T:::::T  TTTTTT U:::::U     U:::::U   R::::R     R:::::R U:::::U     U:::::U  V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M]],
[[                              T:::::T         U:::::D     D:::::U   R::::R     R:::::R U:::::D     D:::::U   V:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M]],
[[                              T:::::T         U:::::D     D:::::U   R::::RRRRRR:::::R  U:::::D     D:::::U    V:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M]],
[[                              T:::::T         U:::::D     D:::::U   R:::::::::::::RR   U:::::D     D:::::U     V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M]],
[[                              T:::::T         U:::::D     D:::::U   R::::RRRRRR:::::R  U:::::D     D:::::U      V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M]],
[[                              T:::::T         U:::::D     D:::::U   R::::R     R:::::R U:::::D     D:::::U       V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M]],
[[                              T:::::T         U:::::D     D:::::U   R::::R     R:::::R U:::::D     D:::::U        V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M]],
[[                              T:::::T         U::::::U   U::::::U   R::::R     R:::::R U::::::U   U::::::U         V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M]],
[[                            TT:::::::TT       U:::::::UUU:::::::U RR:::::R     R:::::R U:::::::UUU:::::::U          V:::::::V         II::::::IIM::::::M               M::::::M]],
[[                            T:::::::::T        UU:::::::::::::UU  R::::::R     R:::::R  UU:::::::::::::UU            V:::::V          I::::::::IM::::::M               M::::::M]],
[[                            T:::::::::T          UU:::::::::UU    R::::::R     R:::::R    UU:::::::::UU               V:::V           I::::::::IM::::::M               M::::::M]],
[[                            TTTTTTTTTTT            UUUUUUUUU      RRRRRRRR     RRRRRRR      UUUUUUUUU                  VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM]],    }

    alpha.setup(dashboard.opts)
  end,
}
