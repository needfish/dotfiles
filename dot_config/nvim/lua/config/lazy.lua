-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
  -- Colorscheme (ayu)
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    priority = 1000,
    opts = {
      mirage = false, -- false = dark variant, true = mirage variant
      terminal = true,
      overrides = {},
    },
  },

  -- Fuzzy finder, file explorer & QoL (snacks.nvim)
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = [[

 ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
 ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
 ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽
 ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
 ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
 ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕
 ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
 ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
 ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿
 ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
 ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
 ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠
 ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
 ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣

          ]],
        },
      },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      session = { enabled = true },
      dim = { enabled = true },
      zen = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    picker = {
      sources = {
        explorer = {
          layout = {
            preset = "telescope",
          },
        },
      },
    },
    keys = {
      { "<leader>ff", function() Snacks.picker.files() end,                                 desc = "Find files" },
      { "<leader>fg", function() Snacks.picker.grep() end,                                  desc = "Live grep" },
      { "<leader>fb", function() Snacks.picker.buffers() end,                               desc = "Find buffers" },
      { "<leader>fh", function() Snacks.picker.help() end,                                  desc = "Help tags" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end,                           desc = "Workspace diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics({ filter = { bufnr = 0 } }) end, desc = "Buffer diagnostics" },
      { "<leader>e",  function() Snacks.picker.files() end,                                 desc = "Find files" },
      { "<leader>z",  function() Snacks.zen() end,                                          desc = "Toggle zen mode" },
      { "<leader>n",  function() Snacks.dim() end,                                          desc = "Toggle dim" },
    },
  },

  -- Treesitter (better syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSInstallSync all",
    lazy = false,
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "javascript", "typescript", "rust", "bash", "json", "yaml", "astro" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- LSP support (Neovim 0.11+ native API)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
        },
        event = "InsertEnter",
        config = function()
          local cmp = require("cmp")
          cmp.setup({
            snippet = {
              expand = function(args)
                require("luasnip").lsp_expand(args.body)
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-e>"] = cmp.mapping.abort(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }),
              ["<C-n>"] = cmp.mapping.select_next_item(),
              ["<C-p>"] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "luasnip" },
            }, {
              { name = "buffer" },
              { name = "path" },
            }),
          })
        end,
      },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "rust_analyzer", "astro" },
        automatic_enable = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local map = vim.keymap.set
          local opts = { buffer = bufnr, silent = true }
          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "[d", vim.diagnostic.goto_prev, opts)
          map("n", "]d", vim.diagnostic.goto_next, opts)
          map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature help" })
          -- Inlay hints (type annotations inline)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          map("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
              { bufnr = bufnr }
            )
          end, { desc = "Toggle inlay hints" })
        end,
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
          },
        },
      })

      -- Inlay hints for TypeScript / JavaScript
      vim.lsp.config("ts_ls", {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      -- Inlay hints for Rust
      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              typeHints = { enable = true },
              parameterHints = { enable = true },
              closureReturnTypeHints = { enable = "always" },
              lifetimeElisionHints = { enable = "always" },
              reborrowHints = { enable = "always" },
            },
          },
        },
      })

      -- Note: automatic_enable above calls vim.lsp.enable() for each installed server

      vim.diagnostic.config({
        virtual_text = false, -- tiny-inline-diagnostic handles this
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },

  -- Better text objects (arguments, functions, blocks, etc.)
  {
    "nvim-mini/mini.ai",
    event = "VeryLazy",
    opts = {},
  },

  -- Highlight TODO, FIXME, HACK, etc.
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end,     desc = "Next todo comment" },
      { "[t",         function() require("todo-comments").jump_prev() end,     desc = "Prev todo comment" },
      { "<leader>st", function() require("snacks").picker.todo_comments() end, desc = "Search todo comments" },
    },
  },

  -- Linter (runs external linters like ruff, eslint, shellcheck)
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Map filetypes to linters
      lint.linters_by_ft = {
        python = { "ruff" },
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        sh = { "shellcheck" },
        lua = { "selene" },
      }

      -- Auto-lint on save
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("lint", { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })

      -- Keymap to manually lint
      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Lint buffer" })
    end,
  },

  -- Auto-format on save
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_organize_imports" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        rust = { "rustfmt", lsp_format = "fallback" },
        sh = { "shfmt" },
      },
    },
  },

  -- Keymap discoverability
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>", desc = "WhichKey prefix" },
    },
  },

  -- Code outline sidebar
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle" },
    opts = {
      backends = { "treesitter", "lsp", "markdown" },
      open_automatic = true,
      show_guides = true,
      layout = {
        max_width = { 40, 0.2 },
        default_direction = "prefer_left",
      },
      highlight_on_hover = true,
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Struct",
      },
    },
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Code outline" },
      {
        "<leader>as",
        function() require("aerial.snacks").pick_symbol() end,
        desc = "Search symbols (Snacks)"
      },
      { "[e",        "<cmd>AerialPrev<CR>",    desc = "Previous symbol" },
      { "]e",        "<cmd>AerialNext<CR>",    desc = "Next symbol" },
    },
  },

  -- Git decorations in the gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr, silent = true }
        map("n", "<leader>hs", require("gitsigns").stage_hunk, opts)
        map("n", "<leader>hr", require("gitsigns").reset_hunk, opts)
        map("n", "<leader>hp", require("gitsigns").preview_hunk, opts)
        map("n", "<leader>hb", require("gitsigns").blame_line, opts)
        map("n", "<leader>hd", require("gitsigns").diffthis, opts)
      end,
    },
  },

  -- Comment toggling
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- Auto-close brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Inline diagnostics (replaces virtual_text)
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "classic",
      })
    end,
  },

  -- Tab bar at top
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "ayu",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },

}, {
  install = {
    colorscheme = { "ayu" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
