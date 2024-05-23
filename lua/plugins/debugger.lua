return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dap-go").setup()
		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>jc", function()
			dap.continue()
		end, { desc = "continue debugging" })
		vim.keymap.set("n", "<Leader>jo", function()
			dap.step_over()
		end, { desc = "step over" })
		vim.keymap.set("n", "<Leader>ji", function()
			dap.step_into()
		end, { desc = "step into " })
		vim.keymap.set("n", "<Leader>jO", function()
			dap.step_out()
		end, { desc = "step out" })
		vim.keymap.set("n", "<Leader>jb", function()
			dap.toggle_breakpoint()
		end, { desc = "toggle breakpoint" })
	end,
}
