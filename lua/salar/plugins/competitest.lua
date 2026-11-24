return {
  "xeluxee/competitest.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  keys = {
    { "<leader>cr", "<cmd>CompetiTest run<cr>", desc = "Run Testcases" },
    { "<leader>ca", "<cmd>CompetiTest add_testcase<cr>", desc = "Add Testcase" },
    { "<leader>ce", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit Testcase" },
    { "<leader>cp", "<cmd>CompetiTest receive problem<cr>", desc = "Receive Problem" },
    { "<leader>cc", "<cmd>CompetiTest receive contest<cr>", desc = "Receive Contest" },
  },
  config = function()
    require("competitest").setup({
      local_config_file_name = ".competitest.lua",
      floating_border = "rounded",
      save_current_file = true,
      compile_directory = ".",
      compile_command = {
        cpp = {
          exec = "g++",
          args = {
            "-std=c++20",
            "-O2",
            "-Wall",
            "-Wextra",
            "-Wshadow",
            "-DLOCAL",
            "-fsanitize=address,undefined",
            "-fno-sanitize-recover=all",
            "$(FNAME)",
            "-o",
            "$(FNOEXT)",
          },
        },
      },
      run_command = {
        cpp = { exec = "./$(FNOEXT)" },
      },
      testcases_use_single_file = true,
      template_file = {
        cpp = vim.fn.expand("~/.config/nvim/templates/cf.cpp"),
      },
      evaluate_template_modifiers = true,
    })
  end,
}
