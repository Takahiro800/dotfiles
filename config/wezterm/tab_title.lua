local wezterm = require("wezterm")
local module = {}

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local function dir_name(s)
	return s:match("([^/]+)$")
end

local function tab_title(tab_info)
	local title = tab_info.tab_title

	if title and #title > 0 then
		return title
	end

	return tab_info.active_pane.title
end

function module.apply_to_config(config)
	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local title = tab_title(tab)

		local nerd_icons = {
			nvim = wezterm.nerdfonts.custom_neovim,
			vim = wezterm.nerdfonts.custom_vim,
			zsh = wezterm.nerdfonts.dev_terminal,
			docker = wezterm.nerdfonts.dev_docker,
		}
		local zoomed = ""
		if tab.active_pane.is_zoomed then
			zoomed = "[Z] "
		end

		local pane = tab.active_pane
		local process_name = basename(pane.foreground_process_name)
		local icon = nerd_icons[process_name]
		local index = tab.tab_index + 1
		local path = pane.current_working_dir.path
		local cwd = dir_name(path)

		title = index .. ": " .. cwd .. "  | " .. process_name

		if icon ~= nil then
			title = icon .. "  " .. zoomed .. title
		end

		if tab.is_active then
			return {
				{ Background = { Color = "blue" } },
				{ Text = " " .. title .. " " },
			}
		end
		return title
	end)
end

return module
