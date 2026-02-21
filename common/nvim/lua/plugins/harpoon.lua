return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		--- @type Harpoon
		local harpoon = require("harpoon")
		harpoon:setup()

		local function generate_harpoon_picker()
			local file_paths = {}
			for _, item in ipairs(harpoon:list().items) do
				if item ~= nil then
					table.insert(file_paths, {
						text = item.value,
						file = item.value,
					})
				end
			end
			return file_paths
		end

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			Snacks.picker({
				finder = generate_harpoon_picker,
				layout = "dropdown",
				win = {
					input = {
						keys = {
							["<C-x>"] = { "harpoon_delete", mode = { "n", "x", "i" } },
						},
					},
					list = {
						keys = {
							["<C-x>"] = { "harpoon_delete", mode = { "n", "x", "i" } },
						},
					},
				},
				actions = {
					harpoon_delete = function(picker, item)
						local to_remove = item or picker:selected()
						table.remove(harpoon:list().items, to_remove.idx)
						picker:find({
							refresh = true, -- refresh picker after removing values
						})
					end,
				},
			})
		end)
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)
	end,
}
