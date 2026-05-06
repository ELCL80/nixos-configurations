function color_nord() 
    vim.cmd[[colorscheme nord]]
	vim.g.nord_contrast = true
	vim.g.nord_borders = true
	vim.g.nord_disable_background = true
	vim.g.nord_italic = true
	vim.g.nord_uniform_diff_background = true
	vim.g.nord_bold = true	

	require('nord').set()
    globalcolors = 'nord'
    globalbg = false
end

function colour_nord() 
    vim.cmd[[colorscheme nord]]
	vim.g.nord_contrast = true
	vim.g.nord_borders = true
	vim.g.nord_disable_background = false
	vim.g.nord_italic = true
	vim.g.nord_uniform_diff_background = true
	vim.g.nord_bold = true
	
	require('nord').set()
    globalcolors = 'nord'
    globalcolors = 'ayu'
    globalbg = true
end

function color_onedark()
    require('onedark').setup {
      style = 'darker',
      transparent = true
    }
    require('onedark').load()
    globalcolors = 'onedark'
    globalbg = false
end

function colour_onedark()
    require('onedark').setup {
      style = 'darker',
      transparent = false
    }
    require('onedark').load()
    globalcolors = 'onedark'
    globalcolors = 'ayu'
    globalbg = true
end

function color_ayu()
    require('ayu').setup({
        mirage = true,
        overrides = {
            Normal = { bg = "None" },
            NormalFloat = { bg = "none" },
            ColorColumn = { bg = "None" },
            SignColumn = { bg = "None" },
            Folded = { bg = "None" },
            FoldColumn = { bg = "None" },
            CursorLine = { bg = "None" },
            CursorColumn = { bg = "None" },
            VertSplit = { bg = "None" },
        }
    })
    require('ayu').colorscheme()
    globalcolors = 'ayu'
    globalbg = false
end


function colour_ayu()
    require('ayu').setup({
        mirage = false,
        overrides = {}
    })
    require('ayu').colorscheme()
    globalcolors = 'ayu'
    globalbg = true
end

function color_tokyonight()
    vim.cmd[[colorscheme tokyonight]]
    globalcolors = 'tokyonight'
end

