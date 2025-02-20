local vim = vim
local g = vim.g

local M = {}

function M.get_color(hlgroup, attr)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(hlgroup)), attr, 'gui')
  -- return vim.api.nvim_get_hl_by_name(hlgroup, true)[attr]
end

vim.opt.background = "dark"

function M.gruvbox()
    g.gruvbox_material_background = 'medium'
    g.gruvbox_material_palette = 'original'
    g.gruvbox_material_enable_bold = 1
    g.gruvbox_material_enable_italic = 1
    g.gruvbox_material_sign_column_background = 'none'
    g.gruvbox_material_diagnostic_virtual_text = 'colored'
    vim.cmd('colorscheme gruvbox-material') -- this has to be specified last
end

function M.tokyonight()
    g.tokyonight_style = "night"
    g.tokyonight_sidebars = {} -- { "qf", "vista", "terminal", "packer", "NvimTree" , 'Trouble', 'tagbar' }
    vim.cmd('colorscheme tokyonight') -- this has to be specified last
    -- vim.cmd('hi VertSplit guifg=' .. require'colors'.get_color('Visual', 'bg')) -- .. ' guibg=' .. get_color('StatusLine', 'bg'))
end

function M.catppuccin()
    require'catppuccin'.setup{
        transparent_background = false,
        term_colors = false,
        styles = {
            comments = "italic",
            functions = "italic",
            keywords = "italic",
            strings = "NONE",
            variables = "NONE",
        },
        integrations = {
            cmp = true,
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "italic",
                    hints = "italic",
                    warnings = "italic",
                    information = "italic",
                },
                underlines = {
                    errors = "undercurl",
                    hints = "undercurl",
                    warnings = "undercurl",
                    information = "undercurl",
                },
            },
            lsp_trouble = true,
            lsp_saga = false,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = {
                enabled = true,
                show_root = false,
            },
            which_key = false,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
            },
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = true,
            markdown = true,
            lightspeed = false,
            ts_rainbow = false,
            hop = true,
        },
    }
    vim.cmd('colorscheme catppuccin')
end

function M.kanagawa()
    require("kanagawa").setup({
        dimInactive = false,
        globalStatus = true,
        overrides = {
            TroubleText = { fg = 'fg', bg = 'none' },
        },
        theme = 'default',
        -- theme = 'light'
    })
    vim.cmd("colorscheme kanagawa")
end

-- tokyonight()
-- gruvbox()
-- kanagawa()

return M
