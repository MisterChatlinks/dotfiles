return {
  "vague2k/vague.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    -- NOTE: you do not need to call setup if you don't want to.
    require("vague").setup({
  transparent = false, -- don't set background
  -- disable bold/italic globally in `style`
  bold = true,
  italic = true,
  style = {
    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
    boolean = "bold",
    number = "none",
    float = "none",
    error = "bold",
    comments = "italic",
    conditionals = "none",
    functions = "none",
    headings = "bold",
    operators = "none",
    strings = "italic",
    variables = "none",

    -- keywords
    keywords = "none",
    keyword_return = "italic",
    keywords_loop = "none",
    keywords_label = "none",
    keywords_exception = "none",

    -- builtin
    builtin_constants = "bold",
    builtin_functions = "none",
    builtin_types = "bold",
    builtin_variables = "none",
  },
  -- plugin styles where applicable
  -- make an issue/pr if you'd like to see more styling options!
  plugins = {
    cmp = {
      match = "bold",
      match_fuzzy = "bold",
    },
    dashboard = {
      footer = "italic",
    },
    lsp = {
      diagnostic_error = "bold",
      diagnostic_hint = "none",
      diagnostic_info = "italic",
      diagnostic_ok = "none",
      diagnostic_warn = "bold",
    },
    neotest = {
      focused = "bold",
      adapter_name = "bold",
    },
    telescope = {
      match = "bold",
    },
  },

  -- Override highlights or add new highlights
  on_highlights = function(highlights, colors) end,

  -- Override colors
colors = {
  bg          = "#0D0F0E", -- Dark base like Rich Black
  inactiveBg  = "#132019", -- Slightly lighter background, close to Pine
  fg          = "#E4F6F0", -- Anti-Flash White for text
  floatBorder = "#40695C", -- Pine shade for floating window borders
  line        = "#1A2620", -- Dark Green variant for line separators
  comment     = "#60786F", -- Muted green tone (similar to Basil/Forest)
  builtin     = "#7EE5A3", -- Bright green for built-in keywords (Mint/Pistachio mix)
  func        = "#4AB87F", -- Medium green for functions (Mountain Meadow vibe)
  string      = "#00D68F", -- Caribbean Green for strings
  number      = "#2CC29C", -- Mountain Meadow tone for numbers
  property    = "#8FBFB6", -- Softer green for properties (Mint feel)
  constant    = "#50C878", -- Classic emerald tone, blending Bangladesh/Mountain
  parameter   = "#AEE8D5", -- Soft pastel green (inspired by Pistachio)
  visual      = "#1F3B31", -- Darkened green background for visual mode
  error       = "#D8647E", -- Keeping this pinkish-red for clarity (from your old scheme)
  warning     = "#F3BE7C", -- Keeping warm tone for warnings for visibility
  hint        = "#7E98E8", -- Slight cool tone hint (kept for contrast)
  operator    = "#70C1B3", -- Soft teal-green for operators
  keyword     = "#4FB286", -- Bangladesh Green for keywords
  type        = "#00B894", -- Vibrant green for types
  search      = "#2D423A", -- Darkened Pine for search highlight
  plus        = "#7FA563", -- Retain green tone from old config for git additions
  delta       = "#F3BE7C", -- Same as warning for consistency
}
 })
    vim.cmd("colorscheme vague")
  end
}
