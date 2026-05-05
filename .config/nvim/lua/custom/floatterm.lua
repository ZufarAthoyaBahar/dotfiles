-- ============================================================
-- FLOATING TERMINAL MANAGER
-- ============================================================
local M = {}

_G.FloatTermState = {
  win = -1,         -- ID Window Floating
  sidebar_win = -1, -- ID Window Sidebar (Winbar)
  sidebar_buf = -1, -- ID Buffer Sidebar
  bufs = {},        -- List Buffer ID Terminal
  active_idx = 1,   -- Terminal yang sedang aktif
}

local config = {
  width = 0.85,
  height = 0.85,
  sidebar_width = 17,
}

-- 1. Fungsi: Update Sidebar Header (Sidebar Winbar)
local function update_sidebar()
  -- Check if sidebar window is valid
  if not vim.api.nvim_win_is_valid(_G.FloatTermState.sidebar_win) then return end
  local sbuf = _G.FloatTermState.sidebar_buf
  if not vim.api.nvim_buf_is_valid(sbuf) then return end

  -- Allow editing the sidebar buffer
  vim.bo[sbuf].modifiable = true

  -- Content for sidebar
  local lines = {}

  table.insert(lines, " Terminals ")
  table.insert(lines, "")

  for i, _ in ipairs(_G.FloatTermState.bufs) do
    local prefix = (i == _G.FloatTermState.active_idx) and "   " or "   "
    table.insert(lines, prefix .. "Term " .. i)
  end

  -- add help menu
  table.insert(lines, "")
  table.insert(lines, " -------------")
  table.insert(lines, " [n]ew")
  table.insert(lines, " [t]ab")
  table.insert(lines, " [x]close")

  -- Write to sidebar buffer
  vim.api.nvim_buf_set_lines(sbuf, 0, -1, false, lines)

  -- Add highlighting
  vim.api.nvim_buf_clear_namespace(sbuf, -1, 0, -1)

  -- Highlight active and inactive  terminal
  local hl = vim.api.nvim_get_hl(0, { name = "String" })
  local fg = hl.fg

  vim.api.nvim_set_hl(0, "StringFGOnly", { fg = fg })

  for i, _ in ipairs(_G.FloatTermState.bufs) do
    if i == _G.FloatTermState.active_idx then
      vim.api.nvim_buf_add_highlight(sbuf, -1, "StringFGOnly", i + 1, 0, -1)
    else
      vim.api.nvim_buf_add_highlight(sbuf, -1, "Comment", i + 1, 0, -1)
    end
  end

  -- Prevent editing the sidebar buffer
  vim.bo[sbuf].modifiable = false
end

-- 2. Fungsi: Main Window Floating
local function open_window(term_buf)
  -- Geometric Window
  local ui = vim.api.nvim_list_uis()[1]
  local total_width = math.floor(ui.width * config.width)
  local height = math.floor(ui.height * config.height)
  local row = math.floor((ui.height - height) / 2.1)
  local col = math.floor((ui.width - total_width) / 1.9)

  -- Sidebar dan Terminal Width
  local sidebar_width = config.sidebar_width
  local term_width = total_width - sidebar_width

  -- Create Sidebar Buffer and Window if not exist
  if _G.FloatTermState.sidebar_buf == -1 or not vim.api.nvim_buf_is_valid(_G.FloatTermState.sidebar_buf) then
    _G.FloatTermState.sidebar_buf = vim.api.nvim_create_buf(false, true)
    vim.bo[_G.FloatTermState.sidebar_buf].bufhidden = "hide"
    vim.bo[_G.FloatTermState.sidebar_buf].filetype = "floatterm-sidebar"
  end

  local sbar_opts = {
    relative = "editor",
    width = sidebar_width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "single",
  }

  if not vim.api.nvim_win_is_valid(_G.FloatTermState.sidebar_win) then
    _G.FloatTermState.sidebar_win = vim.api.nvim_open_win(_G.FloatTermState.sidebar_buf, false, sbar_opts)
  end

  -- Set Color and Transparency for Sidebar
  vim.wo[_G.FloatTermState.sidebar_win].winhl = "Normal:NormalFloat,FloatBorder:FloatBorder"

  -- Main Terminal Window
  local main_opts = {
    relative = "editor",
    width = term_width,
    height = height,
    row = row,
    col = col + sidebar_width,
    style = "minimal",
    border = "single",
  }

  -- If terminal window is not valid, create italic
  if not vim.api.nvim_win_is_valid(_G.FloatTermState.win) then
    _G.FloatTermState.win = vim.api.nvim_open_win(term_buf, true, main_opts)
  else
    vim.api.nvim_win_set_buf(_G.FloatTermState.win, term_buf)
  end

  -- Set Color and Transparency for Terminal Window
  vim.wo[_G.FloatTermState.win].winhl = "Normal:Normal,FloatBorder:FloatBorder"
  vim.wo[_G.FloatTermState.win].winblend = 20

  -- Update Sidebar and Winbar
  update_sidebar()
end

-- 3. Fungsi: Close All Floating Windows
local function close_all_windows()
  if vim.api.nvim_win_is_valid(_G.FloatTermState.win) then
    vim.api.nvim_win_hide(_G.FloatTermState.win)
    -- _G.FloatTermState.win = -1
  end
  if vim.api.nvim_win_is_valid(_G.FloatTermState.sidebar_win) then
    vim.api.nvim_win_hide(_G.FloatTermState.sidebar_win)
    -- _G.FloatTermState.sidebar_win = -1
  end
end

-- 3. Fungsi: Membuat Terminal Baru
function M.new_term()
  -- Buat buffer baru
  local buf = vim.api.nvim_create_buf(false, true)

  -- Setting buffer agar tidak hilang saat di-hide
  vim.bo[buf].bufhidden = "hide"

  -- Masukkan ke daftar state
  table.insert(_G.FloatTermState.bufs, buf)
  _G.FloatTermState.active_idx = #_G.FloatTermState.bufs

  -- Buka window dengan buffer ini
  open_window(buf)

  -- Jalankan Shell (bash/zsh/fish) di dalam buffer
  pcall(vim.fn.termopen, vim.o.shell)
  -- vim.fn.termopen(vim.o.shell)

  -- Masuk mode insert
  vim.cmd("startinsert")
end

-- 4. Fungsi Utama: Toggle (Buka/Tutup)
function M.toggle()
  -- Cek apakah window sedang terbuka
  if vim.api.nvim_win_is_valid(_G.FloatTermState.win) then
    -- Jika terbuka, tutup semua window
    close_all_windows()
  else
    -- Jika belum ada terminal sama sekali, buat baru
    if #_G.FloatTermState.bufs == 0 then
      M.new_term()
    else
      -- Jika sudah ada, buka yang terakhir aktif
      local current_buf = _G.FloatTermState.bufs[_G.FloatTermState.active_idx]
      -- Cek apakah buffer masih valid, jika tidak hapus dari list
      if not vim.api.nvim_buf_is_valid(current_buf) then
        table.remove(_G.FloatTermState.bufs, _G.FloatTermState.active_idx)
        M.new_term()
      else
        open_window(current_buf)
        vim.cmd("startinsert")
      end
    end
  end
end

-- 5. Fungsi: Siklus Terminal (Next)
function M.next()
  if #_G.FloatTermState.bufs < 2 then return end

  _G.FloatTermState.active_idx = _G.FloatTermState.active_idx + 1
  if _G.FloatTermState.active_idx > #_G.FloatTermState.bufs then
    _G.FloatTermState.active_idx = 1
  end

  local next_buf = _G.FloatTermState.bufs[_G.FloatTermState.active_idx]
  vim.api.nvim_win_set_buf(_G.FloatTermState.win, next_buf)

  update_sidebar()
  vim.cmd("startinsert")
end

-- 6. Fungsi: Siklus Terminal (Previous)
function M.prev()
  if #_G.FloatTermState.bufs < 2 then return end

  _G.FloatTermState.active_idx = _G.FloatTermState.active_idx - 1
  if _G.FloatTermState.active_idx < 1 then
    _G.FloatTermState.active_idx = #_G.FloatTermState.bufs
  end

  local prev_buf = _G.FloatTermState.bufs[_G.FloatTermState.active_idx]
  vim.api.nvim_win_set_buf(_G.FloatTermState.win, prev_buf)

  update_sidebar()
  vim.cmd("startinsert")
end

-- 7. Fungsi: Tutup Buffer Saat Ini
function M.close_current()
  if #_G.FloatTermState.bufs == 0 then return end

  local current_idx = _G.FloatTermState.active_idx
  local buf_to_delete = _G.FloatTermState.bufs[current_idx]

  -- Hapus dari list terlebih dahulu
  table.remove(_G.FloatTermState.bufs, current_idx)

  -- Jika tidak ada terminal tersisa
  if #_G.FloatTermState.bufs == 0 then
    close_all_windows()
    -- Hapus buffer setelah window ditutup
    if vim.api.nvim_buf_is_valid(buf_to_delete) then
      vim.api.nvim_buf_delete(buf_to_delete, { force = true })
    end
    return
  end

  -- Jika masih ada terminal lain
  -- Sesuaikan index agar tidak out of bound
  if _G.FloatTermState.active_idx > #_G.FloatTermState.bufs then
    _G.FloatTermState.active_idx = #_G.FloatTermState.bufs
  end

  local next_buf = _G.FloatTermState.bufs[_G.FloatTermState.active_idx]

  -- PENTING: Pindahkan window ke buffer lain DULU
  if vim.api.nvim_win_is_valid(_G.FloatTermState.win) then
    vim.api.nvim_win_set_buf(_G.FloatTermState.win, next_buf)
    update_sidebar()
  end

  -- BARU hapus buffer lama (aman karena window sudah pindah)
  if vim.api.nvim_buf_is_valid(buf_to_delete) then
    vim.api.nvim_buf_delete(buf_to_delete, { force = true })
  end
end

-- ============================================================
-- KEYMAPPINGS
-- ============================================================

-- 1. Tombol Global untuk Membuka/Menutup (Space + t + t)
vim.keymap.set("n", "<leader>tt", M.toggle, { desc = "[T]oggle [T]erminal" })

-- 2. Tombol Khusus saat di dalam Terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("CustomTermKeys", { clear = true }),
  callback = function()
    local opts = { buffer = 0, noremap = true, silent = true }

    -- Keluar dari Mode Terminal ke Normal Mode: Tekan ESC dua kali
    vim.keymap.set("t", "<ESC><ESC>", [[<C-\><C-n>]], opts)

    -- Tab Baru: ALT + n
    vim.keymap.set("t", "<A-n>", function() M.new_term() end, opts)

    -- Pindah Tab: ALT + Tab
    vim.keymap.set("t", "<A-Tab>", function() M.next() end, opts)

    -- Pindah Tab Mundur: ALT + Shift + Tab
    vim.keymap.set("t", "<A-S-Tab>", function() M.prev() end, opts)

    -- Tutup Tab Ini: ALT + x
    vim.keymap.set("t", "<A-x>", function() M.close_current() end, opts)

    -- Toggle Close (Sembunyikan): ALT + q
    vim.keymap.set("t", "<A-q>", function() M.toggle() end, opts)
  end,
})

-- ============================================================
-- USER COMMANDS (:FloatTerm, :FloatTermNew, etc.)
-- ============================================================
vim.api.nvim_create_user_command("FloatTerm", M.toggle, {})
vim.api.nvim_create_user_command("FloatTermNew", M.new_term, {})
vim.api.nvim_create_user_command("FloatTermNext", M.next, {})
vim.api.nvim_create_user_command("FloatTermPrev", M.prev, {})
vim.api.nvim_create_user_command("FloatTermClose", M.close_current, {})

return M
