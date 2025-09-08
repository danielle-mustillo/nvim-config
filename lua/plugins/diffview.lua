return {
  -- add diffview
  { "sindrets/diffview.nvim" },
  {
    "jemag/telescope-diff.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
  },
}
