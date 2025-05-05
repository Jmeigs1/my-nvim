local config = {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      inlay_hints = { enabled = false },
      servers = {
        ocamllsp = {
          cmd = { "ocamllsp", "--fallback-read-dot-merlin" },
          filetypes = {
            "ocaml",
            "ocaml.menhir",
            "ocaml.interface",
            "ocaml.ocamllex",
            "reason",
            "dune",
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "*.opam",
              "esy.json",
              "package.json",
              ".git",
              "dune-project",
              "dune-workspace",
              "*.ml"
            )(fname)
          end,
        },
      },
    })
  end,
}

-- return config
return {}
