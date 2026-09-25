-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
  -- Colorschemes
  -- Ayu (current active)
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

  -- GitHub colorschemes (github_light = pure white background)
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})
    end,
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
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      session = { enabled = false },
      dim = { enabled = true },
      zen = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
      words = { enabled = false },
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
      { "<leader>z",  function() Snacks.zen() end,                                          desc = "Toggle zen mode" },
      { "<leader>n",  function() Snacks.dim() end,                                          desc = "Toggle dim" },
      { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
      { "<leader>mv", function() Snacks.rename.rename_file() end,                                desc = "Rename file" },
    },
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
        },
        event = "InsertEnter",
        config = function()
          local cmp = require("cmp")
          cmp.setup({
            mapping = cmp.mapping.preset.insert({
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
              { name = "nvim_lsp" },
            }, {
              { name = "buffer" },
              { name = "path" },
            }),
          })
        end,
      },
    },
    config = function()
      -- Build capabilities first (must register vim.lsp.config before enable)
      -- Start with full protocol capabilities (includes semanticTokens)
      -- then overlay the completion-specific capabilities from cmp-nvim-lsp.
      -- This is necessary because cmp_nvim_lsp.default_capabilities() only returns
      -- textDocument.completion, which would omit semanticTokens and other features.
      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      -- Plain-text completions only (no snippet engine installed)
      capabilities.textDocument.completion.completionItem.snippetSupport = false

      -- Register global config BEFORE enabling servers, so semantic tokens etc. are available
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

      -- Now enable servers (they'll pick up the config registered above)
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "basedpyright", "rust_analyzer", "astro", "terraformls" },
        automatic_enable = true,
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

      -- basedpyright: limit workspace scope to avoid scanning the entire filesystem
      vim.lsp.config("basedpyright", {
        settings = {
          python = {
            analysis = {
              -- Only analyze files under these paths (relative to workspace root)
              include = {},
              -- Exclude system-level and generated directories from analysis
              exclude = { "**/node_modules", "**/.venv", "**/venv" },
              -- If the workspace root is the home directory, set a more useful root
              autoSearchPaths = false,
              useLibraryCodeForTypes = false,
              diagnosticMode = "openFilesOnly",
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

      -- Terraform LSP (terraform-ls)
      vim.lsp.config("terraformls", {
        settings = {
          terraform = {
            codelens = {
              references = { enable = true },
            },
            validate = {
              enable = true,
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
        "<leader>fm",
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
        astro = { "prettier" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier", "injected" },
        rust = { "rustfmt", lsp_format = "fallback" },
        terraform = { "terraform_fmt" },
        sh = { "shfmt" },
      },
    },
  },

  -- Syntax tree / parsers
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = { ensure_installed = { "yaml", "markdown", "markdown_inline", "hcl", "terraform" } },
  },

  -- Bracket matching: highlighted pairs + odd-bracket detection
  {
    "andymass/vim-matchup",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.matchup_matchparen_enabled = 1
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Code outline sidebar
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      backends = { "lsp", "treesitter", "markdown" },
      open_automatic = true,
      show_guides = true,
      layout = {
        max_width = { 40, 0.2 },
        default_direction = "prefer_right",
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
      current_line_blame = true,
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

  -- Inline diagnostics
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



  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "auto",
        disabled_filetypes = {
          winbar = { "dashboard", "lazy", "alpha" },
        },
      },
      sections = {
        lualine_c = { { "filename", path = 1 }, "branch", "diagnostics" },
        lualine_x = { "diff", "filetype", "location" },
      },
    },
  },

  -- Git: visual diff UI
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles" },
    keys = {
      { "<leader>d", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
    },
  },

  -- AI assistant (pi.dev)
  {
    "pablopunk/pi.nvim",
    cmd = { "PiAsk", "PiAskSelection", "PiCancel", "PiLog" },
    opts = {
      provider = "opencode-go",
      model = "deepseek-v4-flash",
    },
    keys = {
      { "<leader>ai", ":PiAsk<CR>",                desc = "Ask pi",         mode = "n" },
      { "<leader>ai", ":PiAskSelection<CR>",        desc = "Ask pi (selection)", mode = "v" },
      { "<leader>al", ":PiLog<CR>",                 desc = "Pi session log", mode = "n" },
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
