---@module "atlas"

return {
  {
    "emrearmagan/atlas.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional but recommended
      "MeanderingProgrammer/render-markdown.nvim", -- optional but recommended
    },
    ---@type AtlasConfig
    opts = {
      providers = {
        -- GitHub uses the `gh` CLI, authenticated via `gh auth login`.
        github = {
          cache_ttl = 300, -- Set to 0 to disable caching.
        },
        gitlab = {
          base_url = "https://gitlab.com",
          -- Personal Access Token with `api` scope.
          token = vim.env.GITLAB_TOKEN,
          cache_ttl = 300,
        },
        bitbucket = {
          user = vim.env.BITBUCKET_USER,
          token = vim.env.BITBUCKET_TOKEN,
          cache_ttl = 300,
        },
        jira = {
          base_url = vim.env.JIRA_BASE_URL,
          email = vim.env.JIRA_EMAIL,
          token = vim.env.JIRA_TOKEN,
          auth_method = "basic", -- "basic" or "bearer"
          api_type = "cloud", -- "cloud" or "server"
          cache_ttl = 300,
        },
      },
      pulls = {
        default_merge_method = "merge", -- "merge" or "squash"
        diff = {
          -- Any command accepting explicit <base>...<head> Git revisions.
          -- Alternatives: "DiffviewOpen", "CodeDiff".
          open_cmd = "AtlasDiff",
        },
      },
      issues = {
        max_results = 100,
        with_relationships = true,
      },
    },
    keys = {
      { "<leader>at", "<cmd>Atlas<CR>", desc = "Atlas: Commands" },
      { "<leader>atp", "<cmd>Atlas pulls<CR>", desc = "Atlas: Pull Requests" },
      { "<leader>ati", "<cmd>Atlas issues<CR>", desc = "Atlas: Issues" },
      { "<leader>atr", "<cmd>Atlas review<CR>", desc = "Atlas: Review PR" },
      { "<leader>ats", "<cmd>Atlas search<CR>", desc = "Atlas: Search" },
    },
  },
}