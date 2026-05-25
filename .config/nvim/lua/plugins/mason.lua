return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    -- This adds your registries to the existing list
    opts.registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
    }
  end,
}
