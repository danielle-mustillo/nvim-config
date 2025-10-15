-- https://www.reddit.com/r/neovim/comments/1d1nrvv/kubectlnvim_navigate_your_cluster_in_a_buffer/
--
return {
    "Ramilito/kubectl.nvim",
    version = "2.*",
    dependencies = "saghen/blink.download",
    cmd = { "Kubectl", "Kubectx", "Kubens" },
    --opts = {},
    config = function ()
      require("kubectl").setup()
    end,
    keys = {
      { "<leader>k", '<cmd>lua require("kubectl").toggle({ tab = false })<cr>', desc = "Start kubernetes" },
      --{ "<C-k>", "<Plug>(kubectl.kill)", ft = "k8s_*" },
      { "7", "<Plug>(kubectl.view_nodes)", ft = "k8s_*" },
      { "8", "<Plug>(kubectl.view_overview)", ft = "k8s_*" },
      { "<C-t>", "<Plug>(kubectl.view_top)", ft = "k8s_*" },
    },
}
