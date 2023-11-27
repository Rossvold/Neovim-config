--This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('ThePrimeagen/vim-be-good')
    use('evanleck/vim-svelte')
    use('pangloss/vim-javascript')
    use('HerringtonDarkholme/yats.vim')
    use{
        'prettier/vim-prettier',
        run = 'pnpm install',
        ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'svelte', 'html'}
}
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            -- snippets
            {'rafamadriz/friendly-snippets'},
        }
    }
    use('github/copilot.vim')
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    use('nvim-tree/nvim-web-devicons')
    use {
        'nvim-lualine/lualine.nvim',
    }
    use('lewis6991/gitsigns.nvim')
    use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
end)
