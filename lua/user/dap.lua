local dap = require("dap")
dap.adapters.ansible = {
  type = "executable",
  command = "python", -- or "/path/to/virtualenv/bin/python",
  args = { "-m", "ansibug", "dap" },
}

local ansibug_configurations = {
  {
    type = "ansible",
    request = "launch",
    name = "Debug playbook",
    playbook = "${file}"
  },
}

dap.configurations["ansible"] = ansibug_configurations
