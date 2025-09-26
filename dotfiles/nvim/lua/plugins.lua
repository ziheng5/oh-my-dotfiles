local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- pylsp configuration
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.pylsp.setup({})
		end,
	},

	-- LSP manager
	{ "mason-org/mason.nvim", opts = {} },
    	{
        	"mason-org/mason-lspconfig.nvim",
        	dependencies = {
            	"mason-org/mason.nvim",
            	"neovim/nvim-lspconfig",
        	},
        	opts = {
            		ensure_installed = { "pylsp" },
        	},
    	},

	-- monokai theme
    	"tanvirth/monokai.nvim",

	-- catppuccin theme
    	{
 	    "catppuccin/nvim",
  	    lazy = true,
  	    name = "catppuccin",
  	    opts = {
    	    	integrations = {
      			aerial = true,
      			alpha = true,
      			cmp = true,
      			dashboard = true,
      			flash = true,
      			fzf = true,
      			grug_far = true,
      			gitsigns = true,
      			headlines = true,
      			illuminate = true,
      			indent_blankline = { enabled = true },
      			leap = true,
      			lsp_trouble = true,
      			mason = true,
      			markdown = true,
      			mini = true,
      			native_lsp = {
        			enabled = true,
        			underlines = {
          				errors = { "undercurl" },
          				hints = { "undercurl" },
          				warnings = { "undercurl" },
          				information = { "undercurl" },
        			},
      			},
      			navic = { enabled = true, custom_bg = "lualine" },
      			neotest = true,
      			neotree = true,
      			noice = true,
      			notify = true,
      			semantic_tokens = true,
      			snacks = true,
      			telescope = true,
      			treesitter = true,
      			treesitter_context = true,
      			which_key = true,
    		},
  	    },
  	    specs = {
    			{
      		    		"akinsho/bufferline.nvim",
      		    		optional = true,
      		    		opts = function(_, opts)
        			if (vim.g.colors_name or ""):find("catppuccin") then
          			opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
        			end
      				end,
    			},
  		    },
	},
	
	-- blink.cmp plugin
	{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

})
