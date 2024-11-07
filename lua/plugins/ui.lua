return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
    end,
  },
  "mong8se/actually.nvim",
  {
    "samjwill/nvim-unception",
    init = function()
      -- Optional settings go here!
      vim.g.unception_open_buffer_in_new_tab = true
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      hijack_netrw_behavior = "disabled", -- netrw left alone, neo-tree does not handle opening dirs (**for remote editing**)
      sources = { "filesystem", "document_symbols" },
    },
  },
  -- Colorscheme
  -- {
  --   "0xstepit/flow.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("flow").setup({})
  --     vim.cmd([[colorscheme flow]])
  --   end,
  -- },
  {
    "kepano/flexoki-neovim",
    lazy = false,
    config = function()
      vim.cmd([[colorscheme flexoki-dark]])
    end,
  },
  {
    "rktjmp/lush.nvim",
    -- if you wish to use your own colorscheme:
    { dir = "/home/lippiece/.config/nvim/lua/plugins/lush.lua", lazy = true },
    config = function()
      local lush = require("lush")
      local hsl = lush.hsl
      local hsluv = lush.hsluv
      local theme = lush(function(injected_functions)
        local sym = injected_functions.sym
        return {
          SpecialKey({ gui = "bold" }), -- SpecialKey     xxx cterm=bold gui=bold
          TermCursor({ bg = "#cecdc3", fg = "#100f0f" }), -- TermCursor     xxx guifg=#100f0f guibg=#cecdc3
          GitSignsAddInline({ TermCursor }), -- GitSignsAddInline xxx links to TermCursor
          GitSignsDeleteInline({ TermCursor }), -- GitSignsDeleteInline xxx links to TermCursor
          GitSignsChangeInline({ TermCursor }), -- GitSignsChangeInline xxx links to TermCursor
          TermCursorNC({ bg = "#575653", fg = "#100f0f" }), -- TermCursorNC   xxx guifg=#100f0f guibg=#575653
          NonText({ fg = "#575653" }), -- NonText        xxx guifg=#575653
          LspCodeLens({ NonText }), -- LspCodeLens    xxx links to NonText
          LspInlayHint({ NonText }), -- LspInlayHint   xxx links to NonText
          TelescopePromptCounter({ NonText }), -- TelescopePromptCounter xxx links to NonText
          TelescopeResultsDiffUntracked({ NonText }), -- TelescopeResultsDiffUntracked xxx links to NonText
          TelescopePreviewHyphen({ NonText }), -- TelescopePreviewHyphen xxx links to NonText
          NoiceLspProgressTitle({ NonText }), -- NoiceLspProgressTitle xxx links to NonText
          NoiceFormatLevelOff({ NonText }), -- NoiceFormatLevelOff xxx links to NonText
          NoiceFormatLevelTrace({ NonText }), -- NoiceFormatLevelTrace xxx links to NonText
          NoiceFormatLevelDebug({ NonText }), -- NoiceFormatLevelDebug xxx links to NonText
          NoiceFormatKind({ NonText }), -- NoiceFormatKind xxx links to NonText
          NoiceFormatEvent({ NonText }), -- NoiceFormatEvent xxx links to NonText
          GitSignsCurrentLineBlame({ NonText }), -- GitSignsCurrentLineBlame xxx links to NonText
          Directory({ fg = "#4385be" }), -- Directory      xxx guifg=#4385be
          TelescopePreviewDate({ Directory }), -- TelescopePreviewDate xxx links to Directory
          TelescopePreviewDirectory({ Directory }), -- TelescopePreviewDirectory xxx links to Directory
          TroubleFilename({ Directory }), -- TroubleFilename xxx links to Directory
          TroubleDirectory({ Directory }), -- TroubleDirectory xxx links to Directory
          ErrorMsg({ gui = "bold", fg = "#f00" }), -- ErrorMsg       xxx cterm=bold gui=bold guifg=#af3029
          NvimInvalidSpacing({ ErrorMsg }), -- NvimInvalidSpacing xxx links to ErrorMsg
          IncSearch({ bg = "#24837b", fg = "#cecdc3" }), -- IncSearch      xxx guifg=#cecdc3 guibg=#24837b
          Search({ bg = "#24837b", fg = "#cecdc3" }), -- Search         xxx guifg=#cecdc3 guibg=#24837b
          MiniSurround({ Search }), -- MiniSurround   xxx links to Search
          TSDefinition({ Search }), -- TSDefinition   xxx links to Search
          NeoTreePreview({ Search }), -- NeoTreePreview xxx links to Search
          TelescopePreviewMatch({ Search }), -- TelescopePreviewMatch xxx links to Search
          CurSearch({ bg = "nvimlightyellow", fg = "nvimdarkgrey1" }), -- CurSearch      xxx ctermfg=0 ctermbg=11 guifg=NvimDarkGrey1 guibg=NvimLightYellow
          ModeMsg({ bg = "#1c1b1a" }), -- ModeMsg        xxx guibg=#1c1b1a
          LineNr({ fg = "#575653" }), -- LineNr         xxx guifg=#575653
          LineNrAbove({ LineNr }), -- LineNrAbove    xxx links to LineNr
          LineNrBelow({ LineNr }), -- LineNrBelow    xxx links to LineNr
          TreesitterContextLineNumber({ LineNr }), -- TreesitterContextLineNumber xxx links to LineNr
          TelescopeResultsLineNr({ LineNr }), -- TelescopeResultsLineNr xxx links to LineNr
          TroubleIndent({ LineNr }), -- TroubleIndent  xxx links to LineNr
          TroublePos({ LineNr }), -- TroublePos     xxx links to LineNr
          CursorLineNr({ gui = "bold", fg = "#cecdc3" }), -- CursorLineNr   xxx cterm=bold gui=bold guifg=#cecdc3
          TroubleIndentFoldClosed({ CursorLineNr }), -- TroubleIndentFoldClosed xxx links to CursorLineNr
          StatusLine({ bg = "#403e3c", fg = "#cecdc3" }), -- StatusLine     xxx guifg=#cecdc3 guibg=#403e3c
          NeoTreeStatusLine({ StatusLine }), -- NeoTreeStatusLine xxx links to StatusLine
          StatusLineNC({ bg = "#282726", fg = "#878580" }), -- StatusLineNC   xxx guifg=#878580 guibg=#282726
          NeoTreeStatusLineNC({ StatusLineNC }), -- NeoTreeStatusLineNC xxx links to StatusLineNC
          WinSeparator({ bg = "#282726", fg = "#282726" }), -- WinSeparator   xxx guifg=#282726 guibg=#282726
          VertSplit({ WinSeparator }), -- VertSplit      xxx links to WinSeparator
          NeoTreeWinSeparator({ WinSeparator }), -- NeoTreeWinSeparator xxx links to WinSeparator
          Title({ gui = "bold", fg = "#4385be" }), -- Title          xxx cterm=bold gui=bold guifg=#4385be
          FloatTitle({ Title }), -- FloatTitle     xxx links to Title
          NoiceCmdlinePrompt({ Title }), -- NoiceCmdlinePrompt xxx links to Title
          NoiceLspProgressClient({ Title }), -- NoiceLspProgressClient xxx links to Title
          NoiceFormatTitle({ Title }), -- NoiceFormatTitle xxx links to Title
          Visual({ bg = "#282726" }), -- Visual         xxx guibg=#282726
          LspReferenceText({ Visual }), -- LspReferenceText xxx links to Visual
          LspSignatureActiveParameter({ Visual }), -- LspSignatureActiveParameter xxx links to Visual
          SnippetTabstop({ Visual }), -- SnippetTabstop xxx links to Visual
          TSDefinitionUsage({ Visual }), -- TSDefinitionUsage xxx links to Visual
          MiniPickPreviewRegion({ Visual }), -- MiniPickPreviewRegion xxx links to Visual
          MiniPickPreviewLine({ Visual }), -- MiniPickPreviewLine xxx links to Visual
          TelescopePreviewLine({ Visual }), -- TelescopePreviewLine xxx links to Visual
          TelescopeSelection({ Visual }), -- TelescopeSelection xxx links to Visual
          TroublePreview({ Visual }), -- TroublePreview xxx links to Visual
          NoiceFormatConfirmDefault({ Visual }), -- NoiceFormatConfirmDefault xxx links to Visual
          WarningMsg({ bg = "#100f0f", fg = "#d14d41" }), -- WarningMsg     xxx guifg=#d14d41 guibg=#100f0f
          WildMenu({ bg = "#24837b" }), -- WildMenu       xxx guibg=#24837b
          Folded({ fg = "#343331" }), -- Folded         xxx guifg=#343331
          FoldColumn({ fg = "#343331" }), -- FoldColumn     xxx guifg=#343331
          CursorLineFold({ FoldColumn }), -- CursorLineFold xxx links to FoldColumn
          DiffAdd({ bg = "#879a39", fg = "#100f0f" }), -- DiffAdd        xxx guifg=#100f0f guibg=#879a39
          TelescopeResultsDiffAdd({ DiffAdd }), -- TelescopeResultsDiffAdd xxx links to DiffAdd
          GitSignsAddLn({ DiffAdd }), -- GitSignsAddLn  xxx links to DiffAdd
          GitSignsAddPreview({ DiffAdd }), -- GitSignsAddPreview xxx links to DiffAdd
          DiffChange({ bg = "#8b7ec8", fg = "#1c1b1a" }), -- DiffChange     xxx guifg=#1c1b1a guibg=#8b7ec8
          TelescopeResultsDiffChange({ DiffChange }), -- TelescopeResultsDiffChange xxx links to DiffChange
          GitSignsChangeLn({ DiffChange }), -- GitSignsChangeLn xxx links to DiffChange
          DiffDelete({ bg = "#d14d41", fg = "#1c1b1a" }), -- DiffDelete     xxx guifg=#1c1b1a guibg=#d14d41
          TelescopeResultsDiffDelete({ DiffDelete }), -- TelescopeResultsDiffDelete xxx links to DiffDelete
          GitSignsDeletePreview({ DiffDelete }), -- GitSignsDeletePreview xxx links to DiffDelete
          GitSignsDeleteVirtLn({ DiffDelete }), -- GitSignsDeleteVirtLn xxx links to DiffDelete
          DiffText({ bg = "#205ea6", fg = "#100f0f" }), -- DiffText       xxx guifg=#100f0f guibg=#205ea6
          SpellBad({ gui = "underline", fg = "#af3029" }), -- SpellBad       xxx cterm=underline gui=underline guifg=#af3029
          SpellCap({ gui = "underline", fg = "#d0a215" }), -- SpellCap       xxx cterm=underline gui=underline guifg=#d0a215
          SpellRare({ gui = "underline", fg = "#8b7ec8" }), -- SpellRare      xxx cterm=underline gui=underline guifg=#8b7ec8
          SpellLocal({ gui = "underline", fg = "#879a39" }), -- SpellLocal     xxx cterm=underline gui=underline guifg=#879a39
          Pmenu({ blend = 50, bg = "#1c1b1a", fg = "#878580" }), -- Pmenu          xxx guifg=#878580 guibg=#1c1b1a blend=50
          PmenuKind({ Pmenu }), -- PmenuKind      xxx links to Pmenu
          PmenuExtra({ Pmenu }), -- PmenuExtra     xxx links to Pmenu
          NoicePopupmenu({ Pmenu }), -- NoicePopupmenu xxx links to Pmenu
          PmenuSel({ bg = "#24837b", fg = "#cecdc3" }), -- PmenuSel       xxx guifg=#cecdc3 guibg=#24837b
          PmenuKindSel({ PmenuSel }), -- PmenuKindSel   xxx links to PmenuSel
          PmenuExtraSel({ PmenuSel }), -- PmenuExtraSel  xxx links to PmenuSel
          NoicePopupmenuSelected({ PmenuSel }), -- NoicePopupmenuSelected xxx links to PmenuSel
          PmenuSbar({ bg = "#282726" }), -- PmenuSbar      xxx guibg=#282726
          NoiceScrollbar({ PmenuSbar }), -- NoiceScrollbar xxx links to PmenuSbar
          PmenuThumb({ bg = "#403e3c" }), -- PmenuThumb     xxx guibg=#403e3c
          NoiceScrollbarThumb({ PmenuThumb }), -- NoiceScrollbarThumb xxx links to PmenuThumb
          TabLine({ bg = "#282726", fg = "#878580" }), -- TabLine        xxx guifg=#878580 guibg=#282726
          TabLineSel({ bg = "#403e3c", fg = "#cecdc3" }), -- TabLineSel     xxx guifg=#cecdc3 guibg=#403e3c
          TroubleCount({ TabLineSel }), -- TroubleCount   xxx links to TabLineSel
          TabLineFill({ bg = "#282726" }), -- TabLineFill    xxx guibg=#282726
          CursorColumn({ bg = "#1c1b1a" }), -- CursorColumn   xxx guibg=#1c1b1a
          CursorLine({ bg = "#1c1b1a" }), -- CursorLine     xxx guibg=#1c1b1a
          TSCurrentScope({ CursorLine }), -- TSCurrentScope xxx links to CursorLine
          NeoTreeCursorLine({ CursorLine }), -- NeoTreeCursorLine xxx links to CursorLine
          NoiceFormatConfirm({ CursorLine }), -- NoiceFormatConfirm xxx links to CursorLine
          NoiceFormatProgressTodo({ CursorLine }), -- NoiceFormatProgressTodo xxx links to CursorLine
          ColorColumn({ bg = "#282726" }), -- ColorColumn    xxx guibg=#282726
          Whitespace({ fg = "#575653" }), -- Whitespace     xxx guifg=#575653
          MsgSeparator({ bg = "#1c1b1a" }), -- MsgSeparator   xxx guibg=#1c1b1a
          NormalFloat({ bg = "#1c1b1a", fg = "#878580" }), -- NormalFloat    xxx guifg=#878580 guibg=#1c1b1a
          TroubleNormal({ NormalFloat }), -- TroubleNormal  xxx links to NormalFloat
          WhichKeyNormal({ NormalFloat }), -- WhichKeyNormal xxx links to NormalFloat
          MiniAnimateNormalFloat({ NormalFloat }), -- MiniAnimateNormalFloat xxx links to NormalFloat
          NeoTreeFloatNormal({ NormalFloat }), -- NeoTreeFloatNormal xxx links to NormalFloat
          TroubleNormalNC({ NormalFloat }), -- TroubleNormalNC xxx links to NormalFloat
          NoicePopup({ NormalFloat }), -- NoicePopup     xxx links to NormalFloat
          NoiceSplit({ NormalFloat }), -- NoiceSplit     xxx links to NormalFloat
          MsgArea({ bg = "#1c1b1a" }), -- MsgArea        xxx guibg=#1c1b1a
          FlashPrompt({ MsgArea }), -- FlashPrompt    xxx links to MsgArea
          NoiceMini({ MsgArea }), -- NoiceMini      xxx links to MsgArea
          NoiceCmdline({ MsgArea }), -- NoiceCmdline   xxx links to MsgArea
          FloatBorder({ bg = "#1c1b1a", fg = "#575653" }), -- FloatBorder    xxx guifg=#575653 guibg=#1c1b1a
          TreesitterContextSeparator({ FloatBorder }), -- TreesitterContextSeparator xxx links to FloatBorder
          NeoTreeFloatBorder({ FloatBorder }), -- NeoTreeFloatBorder xxx links to FloatBorder
          WhichKeyBorder({ FloatBorder }), -- WhichKeyBorder xxx links to FloatBorder
          NoicePopupmenuBorder({ FloatBorder }), -- NoicePopupmenuBorder xxx links to FloatBorder
          NoicePopupBorder({ FloatBorder }), -- NoicePopupBorder xxx links to FloatBorder
          NoiceSplitBorder({ FloatBorder }), -- NoiceSplitBorder xxx links to FloatBorder
          WinBar({ bg = "#403e3c", fg = "#cecdc3" }), -- WinBar         xxx guifg=#cecdc3 guibg=#403e3c
          WinBarNC({ bg = "#282726", fg = "#878580" }), -- WinBarNC       xxx guifg=#878580 guibg=#282726
          Cursor({ bg = "#cecdc3", fg = "#100f0f" }), -- Cursor         xxx guifg=#100f0f guibg=#cecdc3
          FlashCursor({ Cursor }), -- FlashCursor    xxx links to Cursor
          NoiceCursor({ Cursor }), -- NoiceCursor    xxx links to Cursor
          RedrawDebugNormal({ gui = "reverse" }), -- RedrawDebugNormal xxx cterm=reverse gui=reverse
          Underlined({ gui = "underline" }), -- Underlined     xxx cterm=underline gui=underline
          sym("@string.special.url")({ Underlined }), -- @string.special.url xxx links to Underlined
          sym("@markup.link")({ Underlined }), -- @markup.link   xxx links to Underlined
          MiniCompletionActiveParameter({ Underlined }), -- MiniCompletionActiveParameter xxx links to Underlined
          lCursor({ bg = "#cecdc3", fg = "#100f0f" }), -- lCursor        xxx guifg=#100f0f guibg=#cecdc3
          CursorIM({ bg = "#cecdc3", fg = "#100f0f" }), -- CursorIM       xxx guifg=#100f0f guibg=#cecdc3
          Substitute({ bg = "#3aa99f" }), -- Substitute     xxx guibg=#3aa99f
          VisualNOS({ bg = "#343331" }), -- VisualNOS      xxx guibg=#343331
          Normal({ bg = "#100f0f", fg = "#cecdc3" }), -- Normal         xxx guifg=#cecdc3 guibg=#100f0f
          Ignore({ Normal }), -- Ignore         xxx links to Normal
          NvimSpacing({ Normal }), -- NvimSpacing    xxx links to Normal
          NotifyWARNBody({ Normal }), -- NotifyWARNBody xxx links to Normal
          NotifyBackground({ Normal }), -- NotifyBackground xxx links to Normal
          NotifyERRORBody({ Normal }), -- NotifyERRORBody xxx links to Normal
          TroubleText({ Normal }), -- TroubleText    xxx links to Normal
          NotifyTRACEBody({ Normal }), -- NotifyTRACEBody xxx links to Normal
          NeoTreeNormal({ Normal }), -- NeoTreeNormal  xxx links to Normal
          TelescopeNormal({ Normal }), -- TelescopeNormal xxx links to Normal
          NotifyINFOBody({ Normal }), -- NotifyINFOBody xxx links to Normal
          NotifyDEBUGBody({ Normal }), -- NotifyDEBUGBody xxx links to Normal
          NeoTreeStatsHeader({ Normal }), -- NeoTreeStatsHeader xxx links to Normal
          NeoTreeRootName({ Normal }), -- NeoTreeRootName xxx links to Normal
          WhichKeyIconGrey({ Normal }), -- WhichKeyIconGrey xxx links to Normal
          TroubleIconFile({ Normal }), -- TroubleIconFile xxx links to Normal
          NoiceConfirm({ Normal }), -- NoiceConfirm   xxx links to Normal
          NoiceCmdlinePopup({ Normal }), -- NoiceCmdlinePopup xxx links to Normal
          Character({ fg = "#3aa99f" }), -- Character      xxx guifg=#3aa99f
          sym("@character")({ Character }), -- @character     xxx links to Character
          Constant({ fg = "#d0a215" }), -- Constant       xxx guifg=#d0a215
          sym("@constant")({ Constant }), -- @constant      xxx links to Constant
          MiniIconsPurple({ Constant }), -- MiniIconsPurple xxx links to Constant
          WhichKeyIconPurple({ Constant }), -- WhichKeyIconPurple xxx links to Constant
          TelescopePreviewPipe({ Constant }), -- TelescopePreviewPipe xxx links to Constant
          TelescopeResultsConstant({ Constant }), -- TelescopeResultsConstant xxx links to Constant
          TelescopePreviewGroup({ Constant }), -- TelescopePreviewGroup xxx links to Constant
          TelescopePreviewUser({ Constant }), -- TelescopePreviewUser xxx links to Constant
          TelescopePreviewRead({ Constant }), -- TelescopePreviewRead xxx links to Constant
          TelescopePreviewBlock({ Constant }), -- TelescopePreviewBlock xxx links to Constant
          TelescopePreviewCharDev({ Constant }), -- TelescopePreviewCharDev xxx links to Constant
          NoiceLspProgressSpinner({ Constant }), -- NoiceLspProgressSpinner xxx links to Constant
          luaConstant({ Constant }), -- luaConstant    xxx links to Constant
          Number({ fg = "#8b7ec8" }), -- Number         xxx guifg=#8b7ec8
          sym("@number")({ Number }), -- @number        xxx links to Number
          NvimNumber({ Number }), -- NvimNumber     xxx links to Number
          TelescopeResultsNumber({ Number }), -- TelescopeResultsNumber xxx links to Number
          luaNumber({ Number }), -- luaNumber      xxx links to Number
          Boolean({ fg = "#d0a215" }), -- Boolean        xxx guifg=#d0a215
          sym("@boolean")({ Boolean }), -- @boolean       xxx links to Boolean
          Float({ fg = "#8b7ec8" }), -- Float          xxx guifg=#8b7ec8
          Keyword({ fg = "#879a39" }), -- Keyword        xxx guifg=#879a39
          Conditional({ Keyword }), -- Conditional    xxx links to Keyword
          Repeat({ Keyword }), -- Repeat         xxx links to Keyword
          Label({ Keyword }), -- Label          xxx links to Keyword
          Exception({ Keyword }), -- Exception      xxx links to Keyword
          sym("@keyword")({ Keyword }), -- @keyword       xxx links to Keyword
          WhichKeyGroup({ Keyword }), -- WhichKeyGroup  xxx links to Keyword
          TelescopePreviewSticky({ Keyword }), -- TelescopePreviewSticky xxx links to Keyword
          Include({ fg = "#d14d41" }), -- Include        xxx guifg=#d14d41
          PreProc({ fg = "#ce5d97" }), -- PreProc        xxx guifg=#ce5d97
          Define({ fg = "#ce5d97" }), -- Define         xxx guifg=#ce5d97
          Macro({ fg = "#ce5d97" }), -- Macro          xxx guifg=#ce5d97
          sym("@attribute")({ Macro }), -- @attribute     xxx links to Macro
          PreCondit({ fg = "#ce5d97" }), -- PreCondit      xxx guifg=#ce5d97
          StorageClass({ fg = "#da702c" }), -- StorageClass   xxx guifg=#da702c
          Type({ fg = "#879a39" }), -- Type           xxx guifg=#879a39
          sym("@type")({ Type }), -- @type          xxx links to Type
          NvimNumberPrefix({ Type }), -- NvimNumberPrefix xxx links to Type
          NvimOptionSigil({ Type }), -- NvimOptionSigil xxx links to Type
          TelescopeMultiSelection({ Type }), -- TelescopeMultiSelection xxx links to Type
          Structure({ fg = "#da702c" }), -- Structure      xxx guifg=#da702c
          sym("@module")({ Structure }), -- @module        xxx links to Structure
          luaTable({ Structure }), -- luaTable       xxx links to Structure
          Typedef({ fg = "#da702c" }), -- Typedef        xxx guifg=#da702c
          Tag({ fg = "#3aa99f" }), -- Tag            xxx guifg=#3aa99f
          sym("@tag")({ Tag }), -- @tag           xxx links to Tag
          Special({ fg = "#878580" }), -- Special        xxx guifg=#878580
          sym("@variable.builtin")({ Special }), -- @variable.builtin xxx links to Special
          sym("@variable.parameter.builtin")({ Special }), -- @variable.parameter.builtin xxx links to Special
          sym("@module.builtin")({ Special }), -- @module.builtin xxx links to Special
          sym("@type.builtin")({ Special }), -- @type.builtin  xxx links to Special
          sym("@attribute.builtin")({ Special }), -- @attribute.builtin xxx links to Special
          sym("@constructor")({ Special }), -- @constructor   xxx links to Special
          Delimiter({ Special }), -- Delimiter      xxx links to Special
          sym("@punctuation.special")({ Special }), -- @punctuation.special xxx links to Special
          sym("@markup")({ Special }), -- @markup        xxx links to Special
          sym("@tag.builtin")({ Special }), -- @tag.builtin   xxx links to Special
          NoiceCompletionItemKindDefault({ Special }), -- NoiceCompletionItemKindDefault xxx links to Special
          TelescopeMatching({ Special }), -- TelescopeMatching xxx links to Special
          TelescopePreviewLink({ Special }), -- TelescopePreviewLink xxx links to Special
          TroubleIconEvent({ Special }), -- TroubleIconEvent xxx links to Special
          TroubleCode({ Special }), -- TroubleCode    xxx links to Special
          TroubleIconDirectory({ Special }), -- TroubleIconDirectory xxx links to Special
          NoicePopupmenuMatch({ Special }), -- NoicePopupmenuMatch xxx links to Special
          NoiceFormatDate({ Special }), -- NoiceFormatDate xxx links to Special
          NotifyLogTitle({ Special }), -- NotifyLogTitle xxx links to Special
          SpecialChar({ fg = "#ce5d97" }), -- SpecialChar    xxx guifg=#ce5d97
          sym("@string.special")({ SpecialChar }), -- @string.special xxx links to SpecialChar
          NvimRegister({ SpecialChar }), -- NvimRegister   xxx links to SpecialChar
          NvimStringSpecial({ SpecialChar }), -- NvimStringSpecial xxx links to SpecialChar
          NeoTreeBufferNumber({ SpecialChar }), -- NeoTreeBufferNumber xxx links to SpecialChar
          TelescopeResultsVariable({ SpecialChar }), -- TelescopeResultsVariable xxx links to SpecialChar
          luaSpecial({ SpecialChar }), -- luaSpecial     xxx links to SpecialChar
          SpecialComment({ fg = "#cecdc3" }), -- SpecialComment xxx guifg=#cecdc3
          TelescopeResultsSpecialComment({ SpecialComment }), -- TelescopeResultsSpecialComment xxx links to SpecialComment
          Debug({ fg = "#ce5d97" }), -- Debug          xxx guifg=#ce5d97
          DiagnosticError({ fg = "nvimlightred" }), -- DiagnosticError xxx ctermfg=9 guifg=NvimLightRed
          DiagnosticFloatingError({ DiagnosticError }), -- DiagnosticFloatingError xxx links to DiagnosticError
          DiagnosticVirtualTextError({ DiagnosticError }), -- DiagnosticVirtualTextError xxx links to DiagnosticError
          DiagnosticSignError({ DiagnosticError }), -- DiagnosticSignError xxx links to DiagnosticError
          sym("@comment.error")({ DiagnosticError }), -- @comment.error xxx links to DiagnosticError
          MiniIconsRed({ DiagnosticError }), -- MiniIconsRed   xxx links to DiagnosticError
          MiniHipatternsFixme({ DiagnosticError }), -- MiniHipatternsFixme xxx links to DiagnosticError
          WhichKeyIconRed({ DiagnosticError }), -- WhichKeyIconRed xxx links to DiagnosticError
          sym("TinyCodeActionKindrefactor.extract")({ DiagnosticError }), -- TinyCodeActionKindrefactor.extract xxx links to DiagnosticError
          TinyCodeActionKindcodeAction({ DiagnosticError }), -- TinyCodeActionKindcodeAction xxx links to DiagnosticError
          TinyCodeActionKindsource({ DiagnosticError }), -- TinyCodeActionKindsource xxx links to DiagnosticError
          DiagnosticWarn({ fg = "nvimlightyellow" }), -- DiagnosticWarn xxx ctermfg=11 guifg=NvimLightYellow
          DiagnosticFloatingWarn({ DiagnosticWarn }), -- DiagnosticFloatingWarn xxx links to DiagnosticWarn
          DiagnosticVirtualTextWarn({ DiagnosticWarn }), -- DiagnosticVirtualTextWarn xxx links to DiagnosticWarn
          DiagnosticSignWarn({ DiagnosticWarn }), -- DiagnosticSignWarn xxx links to DiagnosticWarn
          sym("@comment.warning")({ DiagnosticWarn }), -- @comment.warning xxx links to DiagnosticWarn
          MiniHipatternsHack({ DiagnosticWarn }), -- MiniHipatternsHack xxx links to DiagnosticWarn
          MiniIconsOrange({ DiagnosticWarn }), -- MiniIconsOrange xxx links to DiagnosticWarn
          MiniIconsYellow({ DiagnosticWarn }), -- MiniIconsYellow xxx links to DiagnosticWarn
          WhichKeyIconYellow({ DiagnosticWarn }), -- WhichKeyIconYellow xxx links to DiagnosticWarn
          WhichKeyIconOrange({ DiagnosticWarn }), -- WhichKeyIconOrange xxx links to DiagnosticWarn
          DiagnosticInfo({ fg = "nvimlightcyan" }), -- DiagnosticInfo xxx ctermfg=14 guifg=NvimLightCyan
          DiagnosticFloatingInfo({ DiagnosticInfo }), -- DiagnosticFloatingInfo xxx links to DiagnosticInfo
          DiagnosticVirtualTextInfo({ DiagnosticInfo }), -- DiagnosticVirtualTextInfo xxx links to DiagnosticInfo
          DiagnosticSignInfo({ DiagnosticInfo }), -- DiagnosticSignInfo xxx links to DiagnosticInfo
          sym("@comment.note")({ DiagnosticInfo }), -- @comment.note  xxx links to DiagnosticInfo
          MiniHipatternsTodo({ DiagnosticInfo }), -- MiniHipatternsTodo xxx links to DiagnosticInfo
          MiniIconsBlue({ DiagnosticInfo }), -- MiniIconsBlue  xxx links to DiagnosticInfo
          WhichKeyIconBlue({ DiagnosticInfo }), -- WhichKeyIconBlue xxx links to DiagnosticInfo
          sym("TinyCodeActionKindrefactor.move")({ DiagnosticInfo }), -- TinyCodeActionKindrefactor.move xxx links to DiagnosticInfo
          TinyCodeActionKindquickfix({ DiagnosticInfo }), -- TinyCodeActionKindquickfix xxx links to DiagnosticInfo
          DiagnosticHint({ fg = "nvimlightblue" }), -- DiagnosticHint xxx ctermfg=12 guifg=NvimLightBlue
          DiagnosticFloatingHint({ DiagnosticHint }), -- DiagnosticFloatingHint xxx links to DiagnosticHint
          DiagnosticVirtualTextHint({ DiagnosticHint }), -- DiagnosticVirtualTextHint xxx links to DiagnosticHint
          DiagnosticSignHint({ DiagnosticHint }), -- DiagnosticSignHint xxx links to DiagnosticHint
          MiniIconsCyan({ DiagnosticHint }), -- MiniIconsCyan  xxx links to DiagnosticHint
          MiniHipatternsNote({ DiagnosticHint }), -- MiniHipatternsNote xxx links to DiagnosticHint
          WhichKeyIconCyan({ DiagnosticHint }), -- WhichKeyIconCyan xxx links to DiagnosticHint
          DiagnosticOk({ fg = "nvimlightgreen" }), -- DiagnosticOk   xxx ctermfg=10 guifg=NvimLightGreen
          DiagnosticFloatingOk({ DiagnosticOk }), -- DiagnosticFloatingOk xxx links to DiagnosticOk
          DiagnosticVirtualTextOk({ DiagnosticOk }), -- DiagnosticVirtualTextOk xxx links to DiagnosticOk
          DiagnosticSignOk({ DiagnosticOk }), -- DiagnosticSignOk xxx links to DiagnosticOk
          MiniIconsGreen({ DiagnosticOk }), -- MiniIconsGreen xxx links to DiagnosticOk
          WhichKeyIconGreen({ DiagnosticOk }), -- WhichKeyIconGreen xxx links to DiagnosticOk
          Comment({ gui = "italic", fg = "#575653" }), -- Comment        xxx cterm=italic gui=italic guifg=#575653
          DiagnosticUnnecessary({ Comment }), -- DiagnosticUnnecessary xxx links to Comment
          sym("@comment")({ Comment }), -- @comment       xxx links to Comment
          WhichKeyValue({ Comment }), -- WhichKeyValue  xxx links to Comment
          CmpGhostText({ Comment }), -- CmpGhostText   xxx links to Comment
          WhichKeySeparator({ Comment }), -- WhichKeySeparator xxx links to Comment
          FlashBackdrop({ Comment }), -- FlashBackdrop  xxx links to Comment
          TelescopeResultsComment({ Comment }), -- TelescopeResultsComment xxx links to Comment
          NeoTreeHiddenByName({ Comment }), -- NeoTreeHiddenByName xxx links to Comment
          NeoTreeIndentMarker({ Comment }), -- NeoTreeIndentMarker xxx links to Comment
          NeoTreeStats({ Comment }), -- NeoTreeStats   xxx links to Comment
          MiniJump2dSpotDim({ Comment }), -- MiniJump2dSpotDim xxx links to Comment
          TroubleSource({ Comment }), -- TroubleSource  xxx links to Comment
          TroubleDiagnosticsCode({ Comment }), -- TroubleDiagnosticsCode xxx links to Comment
          TroubleDiagnosticsItemSource({ Comment }), -- TroubleDiagnosticsItemSource xxx links to Comment
          NotifyLogTime({ Comment }), -- NotifyLogTime  xxx links to Comment
          luaComment({ Comment }), -- luaComment     xxx links to Comment
          sym("@variable")({ fg = "nvimlightgrey2" }), -- @variable      xxx guifg=NvimLightGrey2
          sym("@lsp.type.variable")({ sym("@variable") }), -- @lsp.type.variable xxx links to @variable
          TroubleIconVariable({ sym("@variable") }), -- TroubleIconVariable xxx links to @variable
          String({ fg = "#3aa99f" }), -- String         xxx guifg=#3aa99f
          sym("@string")({ String }), -- @string        xxx links to String
          NvimString({ String }), -- NvimString     xxx links to String
          TelescopePreviewSize({ String }), -- TelescopePreviewSize xxx links to String
          TelescopePreviewExecute({ String }), -- TelescopePreviewExecute xxx links to String
          luaString2({ String }), -- luaString2     xxx links to String
          luaString({ String }), -- luaString      xxx links to String
          Identifier({ fg = "#4385be" }), -- Identifier     xxx guifg=#4385be
          sym("@property")({ Identifier }), -- @property      xxx links to Identifier
          NvimIdentifier({ Identifier }), -- NvimIdentifier xxx links to Identifier
          WhichKeyDesc({ Identifier }), -- WhichKeyDesc   xxx links to Identifier
          TelescopePromptPrefix({ Identifier }), -- TelescopePromptPrefix xxx links to Identifier
          TelescopeMultiIcon({ Identifier }), -- TelescopeMultiIcon xxx links to Identifier
          TelescopeResultsIdentifier({ Identifier }), -- TelescopeResultsIdentifier xxx links to Identifier
          luaFunc({ Identifier }), -- luaFunc        xxx links to Identifier
          Function({ fg = "#da702c" }), -- Function       xxx guifg=#da702c
          sym("@function")({ Function }), -- @function      xxx links to Function
          MiniIconsAzure({ Function }), -- MiniIconsAzure xxx links to Function
          WhichKey({ Function }), -- WhichKey       xxx links to Function
          WhichKeyIconAzure({ Function }), -- WhichKeyIconAzure xxx links to Function
          TelescopeResultsFunction({ Function }), -- TelescopeResultsFunction xxx links to Function
          TelescopeResultsField({ Function }), -- TelescopeResultsField xxx links to Function
          TelescopeResultsClass({ Function }), -- TelescopeResultsClass xxx links to Function
          luaMetaMethod({ Function }), -- luaMetaMethod  xxx links to Function
          luaFunction({ Function }), -- luaFunction    xxx links to Function
          Operator({ fg = "#878580" }), -- Operator       xxx guifg=#878580
          sym("@operator")({ Operator }), -- @operator      xxx links to Operator
          NvimAssignment({ Operator }), -- NvimAssignment xxx links to Operator
          NvimOperator({ Operator }), -- NvimOperator   xxx links to Operator
          TelescopeResultsOperator({ Operator }), -- TelescopeResultsOperator xxx links to Operator
          luaOperator({ Operator }), -- luaOperator    xxx links to Operator
          Todo({ gui = "bold", fg = "#ce5d97" }), -- Todo           xxx cterm=bold gui=bold guifg=#ce5d97
          sym("@comment.todo")({ Todo }), -- @comment.todo  xxx links to Todo
          luaTodo({ Todo }), -- luaTodo        xxx links to Todo
          sym("@markup.strong")({ gui = "bold" }), -- @markup.strong xxx cterm=bold gui=bold
          sym("@markup.italic")({ gui = "italic" }), -- @markup.italic xxx cterm=italic gui=italic
          sym("@markup.strikethrough")({ gui = "strikethrough" }), -- @markup.strikethrough xxx cterm=strikethrough gui=strikethrough
          sym("@markup.underline")({ gui = "underline" }), -- @markup.underline xxx cterm=underline gui=underline
          Added({ fg = "nvimlightgreen" }), -- Added          xxx ctermfg=10 guifg=NvimLightGreen
          GitSignsAdd({ Added }), -- GitSignsAdd    xxx links to Added
          Removed({ fg = "nvimlightred" }), -- Removed        xxx ctermfg=9 guifg=NvimLightRed
          GitSignsDelete({ Removed }), -- GitSignsDelete xxx links to Removed
          Changed({ fg = "nvimlightcyan" }), -- Changed        xxx ctermfg=14 guifg=NvimLightCyan
          GitSignsChange({ Changed }), -- GitSignsChange xxx links to Changed
          DiagnosticDeprecated({ gui = "strikethrough", sp = "nvimlightred" }), -- DiagnosticDeprecated xxx cterm=strikethrough gui=strikethrough guisp=NvimLightRed
          sym("@lsp.mod.deprecated")({ DiagnosticDeprecated }), -- @lsp.mod.deprecated xxx links to DiagnosticDeprecated
          FloatShadow({ blend = 80, bg = "nvimdarkgrey4" }), -- FloatShadow    xxx ctermbg=0 guibg=NvimDarkGrey4 blend=80
          FloatShadowThrough({ blend = 100, bg = "nvimdarkgrey4" }), -- FloatShadowThrough xxx ctermbg=0 guibg=NvimDarkGrey4 blend=100
          MatchParen({ bg = "#343331" }), -- MatchParen     xxx guibg=#343331
          RedrawDebugClear({ bg = "nvimdarkyellow" }), -- RedrawDebugClear xxx ctermfg=0 ctermbg=11 guibg=NvimDarkYellow
          RedrawDebugComposed({ bg = "nvimdarkgreen" }), -- RedrawDebugComposed xxx ctermfg=0 ctermbg=10 guibg=NvimDarkGreen
          RedrawDebugRecompose({ bg = "nvimdarkred" }), -- RedrawDebugRecompose xxx ctermfg=0 ctermbg=9 guibg=NvimDarkRed
          Error({ gui = "bold", bg = "#100f0f", fg = "#d14d41" }), -- Error          xxx cterm=bold gui=bold guifg=#d14d41 guibg=#100f0f
          NvimInvalid({ Error }), -- NvimInvalid    xxx links to Error
          luaParenError({ Error }), -- luaParenError  xxx links to Error
          luaError({ Error }), -- luaError       xxx links to Error
          DiagnosticUnderlineError({ gui = "underline", sp = "nvimlightred" }), -- DiagnosticUnderlineError xxx cterm=underline gui=underline guisp=NvimLightRed
          DiagnosticUnderlineWarn({ gui = "underline", sp = "nvimlightyellow" }), -- DiagnosticUnderlineWarn xxx cterm=underline gui=underline guisp=NvimLightYellow
          DiagnosticUnderlineInfo({ gui = "underline", sp = "nvimlightcyan" }), -- DiagnosticUnderlineInfo xxx cterm=underline gui=underline guisp=NvimLightCyan
          DiagnosticUnderlineHint({ gui = "underline", sp = "nvimlightblue" }), -- DiagnosticUnderlineHint xxx cterm=underline gui=underline guisp=NvimLightBlue
          DiagnosticUnderlineOk({ gui = "underline", sp = "nvimlightgreen" }), -- DiagnosticUnderlineOk xxx cterm=underline gui=underline guisp=NvimLightGreen
          NvimInternalError({ bg = "red", fg = "red" }), -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=Red guibg=Red
          NvimFigureBrace({ NvimInternalError }), -- NvimFigureBrace xxx links to NvimInternalError
          NvimSingleQuotedUnknownEscape({ NvimInternalError }), -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
          NvimInvalidSingleQuotedUnknownEscape({ NvimInternalError }), -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
          NotifyTRACEBorder({ fg = "#4f3552" }), -- NotifyTRACEBorder xxx guifg=#4f3552
          NeoTreeGitStaged({ fg = "#66800b" }), -- NeoTreeGitStaged xxx guifg=#66800b
          MiniStarterItem({ fg = "#cecdc3" }), -- MiniStarterItem xxx guifg=#cecdc3
          NeoTreeGitModified({ fg = "#bc5215" }), -- NeoTreeGitModified xxx guifg=#bc5215
          NeoTreeGitRenamed({ NeoTreeGitModified }), -- NeoTreeGitRenamed xxx links to NeoTreeGitModified
          Bold({ gui = "bold" }), -- Bold           xxx cterm=bold gui=bold
          CmpItemKindDefault({ fg = "#878580" }), -- CmpItemKindDefault xxx guifg=#878580
          CmpItemKind({ CmpItemKindDefault }), -- CmpItemKind    xxx links to CmpItemKindDefault
          IblScope({ fg = "#575653" }), -- IblScope       xxx guifg=#575653
          NotifyINFOTitle({ fg = "#a9ff68" }), -- NotifyINFOTitle xxx guifg=#a9ff68
          NotifyINFOTitle10({ NotifyINFOTitle }), -- NotifyINFOTitle10 xxx links to NotifyINFOTitle
          NotifyTRACETitle({ fg = "#d484ff" }), -- NotifyTRACETitle xxx guifg=#d484ff
          NeoTreeTabSeparatorActive({ fg = "#0a0a0a" }), -- NeoTreeTabSeparatorActive xxx guifg=#0a0a0a
          NeoTreeFileName({ fg = "#cecdc3" }), -- NeoTreeFileName xxx guifg=#cecdc3
          NeoTreeDimText({ fg = "#878580" }), -- NeoTreeDimText xxx guifg=#878580
          NeoTreeExpander({ NeoTreeDimText }), -- NeoTreeExpander xxx links to NeoTreeDimText
          NotifyDEBUGIcon({ fg = "#8b8b8b" }), -- NotifyDEBUGIcon xxx guifg=#8b8b8b
          MiniIndentscopeSymbol({ fg = "#403e3c" }), -- MiniIndentscopeSymbol xxx guifg=#403e3c
          MiniIndentscopeSymbolOff({ MiniIndentscopeSymbol }), -- MiniIndentscopeSymbolOff xxx links to MiniIndentscopeSymbol
          Italic({ gui = "italic" }), -- Italic         xxx cterm=italic gui=italic
          BufferLineIndicatorSelected({ bg = "#100f0f", fg = "#403e3c" }), -- BufferLineIndicatorSelected xxx guifg=#403e3c guibg=#100f0f
          MiniStarterInactive({ fg = "#282726" }), -- MiniStarterInactive xxx guifg=#282726
          MiniStarterHeader({ fg = "#cecdc3" }), -- MiniStarterHeader xxx guifg=#cecdc3
          MiniStarterFooter({ fg = "#cecdc3" }), -- MiniStarterFooter xxx guifg=#cecdc3
          MiniStarterSection({ fg = "#575653" }), -- MiniStarterSection xxx guifg=#575653
          NotifyDEBUGBorder({ fg = "#8b8b8b" }), -- NotifyDEBUGBorder xxx guifg=#8b8b8b
          NotifyDEBUGTitle({ fg = "#8b8b8b" }), -- NotifyDEBUGTitle xxx guifg=#8b8b8b
          NotifyWARNIcon({ fg = "#f79000" }), -- NotifyWARNIcon xxx guifg=#f79000
          NotifyWARNIcon23({ NotifyWARNIcon }), -- NotifyWARNIcon23 xxx links to NotifyWARNIcon
          NotifyERRORTitle({ fg = "#f70067" }), -- NotifyERRORTitle xxx guifg=#f70067
          NotifyERRORTitle16({ NotifyERRORTitle }), -- NotifyERRORTitle16 xxx links to NotifyERRORTitle
          NotifyERRORTitle24({ NotifyERRORTitle }), -- NotifyERRORTitle24 xxx links to NotifyERRORTitle
          NeoTreeTabSeparatorInactive({ bg = "#141414", fg = "#101010" }), -- NeoTreeTabSeparatorInactive xxx guifg=#101010 guibg=#141414
          NeoTreeGitUntracked({ fg = "#d0a215" }), -- NeoTreeGitUntracked xxx guifg=#d0a215
          MiniStarterItemPrefix({ fg = "#3aa99f" }), -- MiniStarterItemPrefix xxx guifg=#3aa99f
          MiniStarterItemBullet({ fg = "#cecdc3" }), -- MiniStarterItemBullet xxx guifg=#cecdc3
          NeoTreeTabInactive({ bg = "#141414", fg = "#777777" }), -- NeoTreeTabInactive xxx guifg=#777777 guibg=#141414
          NotifyWARNBorder({ fg = "#79491d" }), -- NotifyWARNBorder xxx guifg=#79491d
          NotifyWARNBorder23({ NotifyWARNBorder }), -- NotifyWARNBorder23 xxx links to NotifyWARNBorder
          NotifyWARNTitle({ fg = "#f79000" }), -- NotifyWARNTitle xxx guifg=#f79000
          NotifyWARNTitle23({ NotifyWARNTitle }), -- NotifyWARNTitle23 xxx links to NotifyWARNTitle
          NeoTreeTabActive({ gui = "bold" }), -- NeoTreeTabActive xxx gui=bold
          NotifyERRORBorder({ fg = "#8a1f1f" }), -- NotifyERRORBorder xxx guifg=#8a1f1f
          NotifyERRORBorder16({ NotifyERRORBorder }), -- NotifyERRORBorder16 xxx links to NotifyERRORBorder
          NotifyERRORBorder24({ NotifyERRORBorder }), -- NotifyERRORBorder24 xxx links to NotifyERRORBorder
          NotifyERRORIcon({ fg = "#f70067" }), -- NotifyERRORIcon xxx guifg=#f70067
          NotifyERRORIcon16({ NotifyERRORIcon }), -- NotifyERRORIcon16 xxx links to NotifyERRORIcon
          NotifyERRORIcon24({ NotifyERRORIcon }), -- NotifyERRORIcon24 xxx links to NotifyERRORIcon
          NotifyINFOBorder({ fg = "#4f6752" }), -- NotifyINFOBorder xxx guifg=#4f6752
          NotifyINFOBorder10({ NotifyINFOBorder }), -- NotifyINFOBorder10 xxx links to NotifyINFOBorder
          MiniStarterQuery({ fg = "#cecdc3" }), -- MiniStarterQuery xxx guifg=#cecdc3
          MiniAnimateCursor({ gui = "reverse,nocombine" }), -- MiniAnimateCursor xxx cterm=reverse,nocombine gui=reverse,nocombine
          NotifyTRACEIcon({ fg = "#d484ff" }), -- NotifyTRACEIcon xxx guifg=#d484ff
          FlashLabel({ bg = "#d0a215", fg = "#100f0f" }), -- FlashLabel     xxx guifg=#100f0f guibg=#d0a215
          IblIndent({ fg = "#575653" }), -- IblIndent      xxx guifg=#575653
          NotifyINFOIcon({ fg = "#a9ff68" }), -- NotifyINFOIcon xxx guifg=#a9ff68
          NotifyINFOIcon10({ NotifyINFOIcon }), -- NotifyINFOIcon10 xxx links to NotifyINFOIcon
          MiniStarterCurrent({ bg = "#1c1b1a" }), -- MiniStarterCurrent xxx guibg=#1c1b1a
          Hlargs({ fg = "#ef9062" }), -- Hlargs         xxx guifg=#ef9062
          MiniStatuslineModeInsert({ bg = "#24837b", fg = "#100f0f" }), -- MiniStatuslineModeInsert xxx guifg=#100f0f guibg=#24837b
          MiniStatuslineModeNormal({ bg = "#ad8301", fg = "#100f0f" }), -- MiniStatuslineModeNormal xxx guifg=#100f0f guibg=#ad8301
          MiniTablineHidden({ bg = "#282726", fg = "#878580" }), -- MiniTablineHidden xxx guifg=#878580 guibg=#282726
          MiniTrailspace({ bg = "#d14d41", fg = "#d14d41" }), -- MiniTrailspace xxx guifg=#d14d41 guibg=#d14d41
          MiniJump2dSpotUnique({ bg = "#3aa99f", fg = "#100f0f" }), -- MiniJump2dSpotUnique xxx guifg=#100f0f guibg=#3aa99f
          FlashPromptIcon({ fg = "#d0a215" }), -- FlashPromptIcon xxx guifg=#d0a215
          FlashCurrent({ bg = "#cecdc3", fg = "#100f0f" }), -- FlashCurrent   xxx guifg=#100f0f guibg=#cecdc3
          FlashMatch({ bg = "#575653", fg = "#100f0f" }), -- FlashMatch     xxx guifg=#100f0f guibg=#575653
          MatchWord({ bg = "#343331" }), -- MatchWord      xxx guibg=#343331
          MiniCursorword({ MatchWord }), -- MiniCursorword xxx links to MatchWord
          WinSeparatorNC({ bg = "#403e3c", fg = "#403e3c" }), -- WinSeparatorNC xxx guifg=#403e3c guibg=#403e3c
          StatusLineTermNC({ bg = "#403e3c", fg = "#878580" }), -- StatusLineTermNC xxx guifg=#878580 guibg=#403e3c
          StatusLineTerm({ bg = "#403e3c", fg = "#878580" }), -- StatusLineTerm xxx guifg=#878580 guibg=#403e3c
          NeoTreeGitDeleted({ fg = "#d14d41" }), -- NeoTreeGitDeleted xxx guifg=#d14d41
          NeoTreeGitConflict({ gui = "bold,italic", fg = "#ff8700" }), -- NeoTreeGitConflict xxx gui=bold,italic guifg=#ff8700
          NeoTreeGitAdded({ fg = "#879a39" }), -- NeoTreeGitAdded xxx guifg=#879a39
          NeoTreeTitleBar({ bg = "#575653", fg = "#100f0f" }), -- NeoTreeTitleBar xxx guifg=#100f0f guibg=#575653
          NeoTreeFilterTerm({ fg = "#3aa99f" }), -- NeoTreeFilterTerm xxx guifg=#3aa99f
          NeoTreeFileNameOpened({ fg = "#24837b" }), -- NeoTreeFileNameOpened xxx guifg=#24837b
          NeoTreeFileIcon({ fg = "#3aa99f" }), -- NeoTreeFileIcon xxx guifg=#3aa99f
          NeoTreeDotfile({ fg = "#626262" }), -- NeoTreeDotfile xxx guifg=#626262
          NeoTreeDirectoryName({ fg = "#4385be" }), -- NeoTreeDirectoryName xxx guifg=#4385be
          NeoTreeDirectoryIcon({ fg = "#4385be" }), -- NeoTreeDirectoryIcon xxx guifg=#4385be
          NeoTreeGitIgnored({ fg = "#575653" }), -- NeoTreeGitIgnored xxx guifg=#575653
          NeoTreeGitUnstaged({ fg = "#da702c" }), -- NeoTreeGitUnstaged xxx guifg=#da702c
          NeoTreeFloatTitle({ bg = "#1c1b1a", fg = "#cecdc3" }), -- NeoTreeFloatTitle xxx guifg=#cecdc3 guibg=#1c1b1a
          NeoTreeWindowsHidden({ fg = "#ce5d97" }), -- NeoTreeWindowsHidden xxx guifg=#ce5d97
          NeoTreeSymbolicLinkTarget({ fg = "#ce5d97" }), -- NeoTreeSymbolicLinkTarget xxx guifg=#ce5d97
          MiniTablineVisible({ bg = "#343331", fg = "#878580" }), -- MiniTablineVisible xxx guifg=#878580 guibg=#343331
          MiniTablineModifiedCurrent({ bg = "#403e3c", fg = "#da702c" }), -- MiniTablineModifiedCurrent xxx guifg=#da702c guibg=#403e3c
          MiniTablineModifiedVisible({ bg = "#343331", fg = "#da702c" }), -- MiniTablineModifiedVisible xxx guifg=#da702c guibg=#343331
          MiniTablineModifiedHidden({ bg = "#282726", fg = "#bc5215" }), -- MiniTablineModifiedHidden xxx guifg=#bc5215 guibg=#282726
          MiniPickHeader({ bg = "#100f0f", fg = "#cecdc3" }), -- MiniPickHeader xxx guifg=#cecdc3 guibg=#100f0f
          MiniPickMatchCurrent({ bg = "#100f0f", fg = "#879a39" }), -- MiniPickMatchCurrent xxx guifg=#879a39 guibg=#100f0f
          MiniStatuslineModeVisual({ bg = "#66800b", fg = "#100f0f" }), -- MiniStatuslineModeVisual xxx guifg=#100f0f guibg=#66800b
          MiniStatuslineModeReplace({ bg = "#af3029", fg = "#100f0f" }), -- MiniStatuslineModeReplace xxx guifg=#100f0f guibg=#af3029
          MiniStatuslineModeCommand({ bg = "#205ea6", fg = "#100f0f" }), -- MiniStatuslineModeCommand xxx guifg=#100f0f guibg=#205ea6
          MiniStatuslineModeOther({ bg = "#a02f6f", fg = "#100f0f" }), -- MiniStatuslineModeOther xxx guifg=#100f0f guibg=#a02f6f
          MiniStatuslineDevinfo({ bg = "#343331", fg = "#cecdc3" }), -- MiniStatuslineDevinfo xxx guifg=#cecdc3 guibg=#343331
          MiniOperatorsExchangeFrom({ bg = "#d14d41", fg = "#cecdc3" }), -- MiniOperatorsExchangeFrom xxx guifg=#cecdc3 guibg=#d14d41
          MiniStatuslineFileinfo({ bg = "#343331", fg = "#cecdc3" }), -- MiniStatuslineFileinfo xxx guifg=#cecdc3 guibg=#343331
          MiniJump({ bg = "#3aa99f", fg = "#100f0f" }), -- MiniJump       xxx guifg=#100f0f guibg=#3aa99f
          MiniJump2dSpot({ bg = "#3aa99f", fg = "#100f0f" }), -- MiniJump2dSpot xxx guifg=#100f0f guibg=#3aa99f
          MiniJump2dSpotAhead({ bg = "#24837b", fg = "#100f0f" }), -- MiniJump2dSpotAhead xxx guifg=#100f0f guibg=#24837b
          MiniTablineCurrent({ bg = "#403e3c", fg = "#3aa99f" }), -- MiniTablineCurrent xxx guifg=#3aa99f guibg=#403e3c
          MiniTablineFill({ bg = "#1c1b1a" }), -- MiniTablineFill xxx guibg=#1c1b1a
          MiniTablineTabpagesection({ bg = "#24837b", fg = "#cecdc3" }), -- MiniTablineTabpagesection xxx guifg=#cecdc3 guibg=#24837b
          MiniStatuslineFilename({ bg = "#282726", fg = "#878580" }), -- MiniStatuslineFilename xxx guifg=#878580 guibg=#282726
          MiniPickBorder({ bg = "#100f0f", fg = "#403e3c" }), -- MiniPickBorder xxx guifg=#403e3c guibg=#100f0f
          MiniMapSymbolView({ bg = "#1c1b1a", fg = "#878580" }), -- MiniMapSymbolView xxx guifg=#878580 guibg=#1c1b1a
          MiniMapSymbolLine({ bg = "#1c1b1a", fg = "#878580" }), -- MiniMapSymbolLine xxx guifg=#878580 guibg=#1c1b1a
          MiniMapSymbolCount({ bg = "#100f0f", fg = "#cecdc3" }), -- MiniMapSymbolCount xxx guifg=#cecdc3 guibg=#100f0f
          MiniMapNormal({ bg = "#1c1b1a", fg = "#575653" }), -- MiniMapNormal  xxx guifg=#575653 guibg=#1c1b1a
          MiniPickPrompt({ bg = "#100f0f", fg = "#cecdc3" }), -- MiniPickPrompt xxx guifg=#cecdc3 guibg=#100f0f
          MiniPickMatchRanges({ bg = "#100f0f", fg = "#879a39" }), -- MiniPickMatchRanges xxx guifg=#879a39 guibg=#100f0f
          MiniPickMatchMarked({ bg = "#100f0f", fg = "#4385be" }), -- MiniPickMatchMarked xxx guifg=#4385be guibg=#100f0f
          MiniPickIconFile({ bg = "#100f0f", fg = "#3aa99f" }), -- MiniPickIconFile xxx guifg=#3aa99f guibg=#100f0f
          MiniPickIconDirectory({ bg = "#100f0f", fg = "#4385be" }), -- MiniPickIconDirectory xxx guifg=#4385be guibg=#100f0f
          MiniPickBorderText({ bg = "#100f0f", fg = "#878580" }), -- MiniPickBorderText xxx guifg=#878580 guibg=#100f0f
          MiniPickBorderBusy({ bg = "#100f0f", fg = "#282726" }), -- MiniPickBorderBusy xxx guifg=#282726 guibg=#100f0f
          NeoTreeMessage({ gui = "italic", fg = "#494845" }), -- NeoTreeMessage xxx gui=italic guifg=#494845
          NeoTreeFadeText1({ fg = "#626262" }), -- NeoTreeFadeText1 xxx guifg=#626262
          NeoTreeFadeText2({ fg = "#444444" }), -- NeoTreeFadeText2 xxx guifg=#444444
          NeoTreeModified({ fg = "#d7d787" }), -- NeoTreeModified xxx guifg=#d7d787
          NeoTreeFileStats({ fg = "#5c5b57" }), -- NeoTreeFileStats xxx guifg=#5c5b57
          NeoTreeFileStatsHeader({ fg = "#6f6e69" }), -- NeoTreeFileStatsHeader xxx guifg=#6f6e69
          lualine_a_insert({ gui = "bold", bg = "#3fb9ae", fg = "#111010" }), -- lualine_a_insert xxx gui=bold guifg=#111010 guibg=#3fb9ae
          lualine_c_insert({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_insert xxx guifg=#e2e1d6 guibg=#464442
          lualine_b_insert({ bg = "#111010", fg = "#3fb9ae" }), -- lualine_b_insert xxx guifg=#3fb9ae guibg=#111010
          lualine_a_inactive({ gui = "bold", bg = "#279087", fg = "#111010" }), -- lualine_a_inactive xxx gui=bold guifg=#111010 guibg=#279087
          lualine_c_inactive({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_inactive xxx guifg=#e2e1d6 guibg=#464442
          lualine_b_inactive({ bg = "#111010", fg = "#279087" }), -- lualine_b_inactive xxx guifg=#279087 guibg=#111010
          lualine_a_command({ gui = "bold", bg = "#4992d1", fg = "#111010" }), -- lualine_a_command xxx gui=bold guifg=#111010 guibg=#4992d1
          lualine_c_command({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_command xxx guifg=#e2e1d6 guibg=#464442
          lualine_b_command({ bg = "#111010", fg = "#4992d1" }), -- lualine_b_command xxx guifg=#4992d1 guibg=#111010
          lualine_a_replace({ gui = "bold", bg = "#988adc", fg = "#111010" }), -- lualine_a_replace xxx gui=bold guifg=#111010 guibg=#988adc
          lualine_c_replace({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_replace xxx guifg=#e2e1d6 guibg=#464442
          lualine_b_replace({ bg = "#111010", fg = "#988adc" }), -- lualine_b_replace xxx guifg=#988adc guibg=#111010
          lualine_a_normal({ gui = "bold", bg = "#279087", fg = "#111010" }), -- lualine_a_normal xxx gui=bold guifg=#111010 guibg=#279087
          lualine_c_normal({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_normal xxx guifg=#e2e1d6 guibg=#464442
          lualine_b_normal({ bg = "#111010", fg = "#279087" }), -- lualine_b_normal xxx guifg=#279087 guibg=#111010
          lualine_a_terminal({ gui = "bold", bg = "#4992d1", fg = "#111010" }), -- lualine_a_terminal xxx gui=bold guifg=#111010 guibg=#4992d1
          lualine_c_terminal({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_terminal xxx guifg=#e2e1d6 guibg=#464442
          lualine_b_terminal({ bg = "#111010", fg = "#4992d1" }), -- lualine_b_terminal xxx guifg=#4992d1 guibg=#111010
          lualine_a_visual({ gui = "bold", bg = "#94928c", fg = "#111010" }), -- lualine_a_visual xxx gui=bold guifg=#111010 guibg=#94928c
          lualine_c_visual({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_visual xxx guifg=#e2e1d6 guibg=#464442
          lualine_b_visual({ bg = "#111010", fg = "#94928c" }), -- lualine_b_visual xxx guifg=#94928c guibg=#111010
          lualine_c_5_normal({ bg = "#464442", fg = "#878580" }), -- lualine_c_5_normal xxx guifg=#878580 guibg=#464442
          lualine_c_5_insert({ bg = "#464442", fg = "#878580" }), -- lualine_c_5_insert xxx guifg=#878580 guibg=#464442
          lualine_c_5_visual({ bg = "#464442", fg = "#878580" }), -- lualine_c_5_visual xxx guifg=#878580 guibg=#464442
          lualine_c_5_replace({ bg = "#464442", fg = "#878580" }), -- lualine_c_5_replace xxx guifg=#878580 guibg=#464442
          lualine_c_5_command({ bg = "#464442", fg = "#878580" }), -- lualine_c_5_command xxx guifg=#878580 guibg=#464442
          lualine_c_5_terminal({ bg = "#464442", fg = "#878580" }), -- lualine_c_5_terminal xxx guifg=#878580 guibg=#464442
          lualine_c_5_inactive({ bg = "#464442", fg = "#878580" }), -- lualine_c_5_inactive xxx guifg=#878580 guibg=#464442
          lualine_c_diagnostics_error_normal({ bg = "#464442", fg = "#ffc0b9" }), -- lualine_c_diagnostics_error_normal xxx guifg=#ffc0b9 guibg=#464442
          lualine_c_diagnostics_error_insert({ bg = "#464442", fg = "#ffc0b9" }), -- lualine_c_diagnostics_error_insert xxx guifg=#ffc0b9 guibg=#464442
          lualine_c_diagnostics_error_visual({ bg = "#464442", fg = "#ffc0b9" }), -- lualine_c_diagnostics_error_visual xxx guifg=#ffc0b9 guibg=#464442
          lualine_c_diagnostics_error_replace({ bg = "#464442", fg = "#ffc0b9" }), -- lualine_c_diagnostics_error_replace xxx guifg=#ffc0b9 guibg=#464442
          lualine_c_diagnostics_error_command({ bg = "#464442", fg = "#ffc0b9" }), -- lualine_c_diagnostics_error_command xxx guifg=#ffc0b9 guibg=#464442
          lualine_c_diagnostics_error_terminal({ bg = "#464442", fg = "#ffc0b9" }), -- lualine_c_diagnostics_error_terminal xxx guifg=#ffc0b9 guibg=#464442
          lualine_c_diagnostics_error_inactive({ bg = "#464442", fg = "#ffc0b9" }), -- lualine_c_diagnostics_error_inactive xxx guifg=#ffc0b9 guibg=#464442
          lualine_c_diagnostics_warn_normal({ bg = "#464442", fg = "#fce094" }), -- lualine_c_diagnostics_warn_normal xxx guifg=#fce094 guibg=#464442
          lualine_c_diagnostics_warn_insert({ bg = "#464442", fg = "#fce094" }), -- lualine_c_diagnostics_warn_insert xxx guifg=#fce094 guibg=#464442
          lualine_c_diagnostics_warn_visual({ bg = "#464442", fg = "#fce094" }), -- lualine_c_diagnostics_warn_visual xxx guifg=#fce094 guibg=#464442
          lualine_c_diagnostics_warn_replace({ bg = "#464442", fg = "#fce094" }), -- lualine_c_diagnostics_warn_replace xxx guifg=#fce094 guibg=#464442
          lualine_c_diagnostics_warn_command({ bg = "#464442", fg = "#fce094" }), -- lualine_c_diagnostics_warn_command xxx guifg=#fce094 guibg=#464442
          lualine_c_diagnostics_warn_terminal({ bg = "#464442", fg = "#fce094" }), -- lualine_c_diagnostics_warn_terminal xxx guifg=#fce094 guibg=#464442
          lualine_c_diagnostics_warn_inactive({ bg = "#464442", fg = "#fce094" }), -- lualine_c_diagnostics_warn_inactive xxx guifg=#fce094 guibg=#464442
          lualine_c_diagnostics_info_normal({ bg = "#464442", fg = "#8cf8f7" }), -- lualine_c_diagnostics_info_normal xxx guifg=#8cf8f7 guibg=#464442
          lualine_c_diagnostics_info_insert({ bg = "#464442", fg = "#8cf8f7" }), -- lualine_c_diagnostics_info_insert xxx guifg=#8cf8f7 guibg=#464442
          lualine_c_diagnostics_info_visual({ bg = "#464442", fg = "#8cf8f7" }), -- lualine_c_diagnostics_info_visual xxx guifg=#8cf8f7 guibg=#464442
          lualine_c_diagnostics_info_replace({ bg = "#464442", fg = "#8cf8f7" }), -- lualine_c_diagnostics_info_replace xxx guifg=#8cf8f7 guibg=#464442
          lualine_c_diagnostics_info_command({ bg = "#464442", fg = "#8cf8f7" }), -- lualine_c_diagnostics_info_command xxx guifg=#8cf8f7 guibg=#464442
          lualine_c_diagnostics_info_terminal({ bg = "#464442", fg = "#8cf8f7" }), -- lualine_c_diagnostics_info_terminal xxx guifg=#8cf8f7 guibg=#464442
          lualine_c_diagnostics_info_inactive({ bg = "#464442", fg = "#8cf8f7" }), -- lualine_c_diagnostics_info_inactive xxx guifg=#8cf8f7 guibg=#464442
          lualine_c_diagnostics_hint_normal({ bg = "#464442", fg = "#a6dbff" }), -- lualine_c_diagnostics_hint_normal xxx guifg=#a6dbff guibg=#464442
          lualine_c_diagnostics_hint_insert({ bg = "#464442", fg = "#a6dbff" }), -- lualine_c_diagnostics_hint_insert xxx guifg=#a6dbff guibg=#464442
          lualine_c_diagnostics_hint_visual({ bg = "#464442", fg = "#a6dbff" }), -- lualine_c_diagnostics_hint_visual xxx guifg=#a6dbff guibg=#464442
          lualine_c_diagnostics_hint_replace({ bg = "#464442", fg = "#a6dbff" }), -- lualine_c_diagnostics_hint_replace xxx guifg=#a6dbff guibg=#464442
          lualine_c_diagnostics_hint_command({ bg = "#464442", fg = "#a6dbff" }), -- lualine_c_diagnostics_hint_command xxx guifg=#a6dbff guibg=#464442
          lualine_c_diagnostics_hint_terminal({ bg = "#464442", fg = "#a6dbff" }), -- lualine_c_diagnostics_hint_terminal xxx guifg=#a6dbff guibg=#464442
          lualine_c_diagnostics_hint_inactive({ bg = "#464442", fg = "#a6dbff" }), -- lualine_c_diagnostics_hint_inactive xxx guifg=#a6dbff guibg=#464442
          lualine_x_10_normal({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_x_10_normal xxx guifg=#e2e1d6 guibg=#464442
          lualine_x_10_insert({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_x_10_insert xxx guifg=#e2e1d6 guibg=#464442
          lualine_x_10_visual({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_x_10_visual xxx guifg=#e2e1d6 guibg=#464442
          lualine_x_10_replace({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_x_10_replace xxx guifg=#e2e1d6 guibg=#464442
          lualine_x_10_command({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_x_10_command xxx guifg=#e2e1d6 guibg=#464442
          lualine_x_10_terminal({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_x_10_terminal xxx guifg=#e2e1d6 guibg=#464442
          lualine_x_10_inactive({ bg = "#464442", fg = "#e2e1d6" }), -- lualine_x_10_inactive xxx guifg=#e2e1d6 guibg=#464442
          lualine_x_11_normal({ bg = "#464442", fg = "#878580" }), -- lualine_x_11_normal xxx guifg=#878580 guibg=#464442
          lualine_x_11_insert({ bg = "#464442", fg = "#878580" }), -- lualine_x_11_insert xxx guifg=#878580 guibg=#464442
          lualine_x_11_visual({ bg = "#464442", fg = "#878580" }), -- lualine_x_11_visual xxx guifg=#878580 guibg=#464442
          lualine_x_11_replace({ bg = "#464442", fg = "#878580" }), -- lualine_x_11_replace xxx guifg=#878580 guibg=#464442
          lualine_x_11_command({ bg = "#464442", fg = "#878580" }), -- lualine_x_11_command xxx guifg=#878580 guibg=#464442
          lualine_x_11_terminal({ bg = "#464442", fg = "#878580" }), -- lualine_x_11_terminal xxx guifg=#878580 guibg=#464442
          lualine_x_11_inactive({ bg = "#464442", fg = "#878580" }), -- lualine_x_11_inactive xxx guifg=#878580 guibg=#464442
          lualine_x_12_normal({ bg = "#464442", fg = "#878580" }), -- lualine_x_12_normal xxx guifg=#878580 guibg=#464442
          lualine_x_12_insert({ bg = "#464442", fg = "#878580" }), -- lualine_x_12_insert xxx guifg=#878580 guibg=#464442
          lualine_x_12_visual({ bg = "#464442", fg = "#878580" }), -- lualine_x_12_visual xxx guifg=#878580 guibg=#464442
          lualine_x_12_replace({ bg = "#464442", fg = "#878580" }), -- lualine_x_12_replace xxx guifg=#878580 guibg=#464442
          lualine_x_12_command({ bg = "#464442", fg = "#878580" }), -- lualine_x_12_command xxx guifg=#878580 guibg=#464442
          lualine_x_12_terminal({ bg = "#464442", fg = "#878580" }), -- lualine_x_12_terminal xxx guifg=#878580 guibg=#464442
          lualine_x_12_inactive({ bg = "#464442", fg = "#878580" }), -- lualine_x_12_inactive xxx guifg=#878580 guibg=#464442
          lualine_x_13_normal({ bg = "#464442", fg = "#d0a215" }), -- lualine_x_13_normal xxx guifg=#d0a215 guibg=#464442
          lualine_x_13_insert({ bg = "#464442", fg = "#d0a215" }), -- lualine_x_13_insert xxx guifg=#d0a215 guibg=#464442
          lualine_x_13_visual({ bg = "#464442", fg = "#d0a215" }), -- lualine_x_13_visual xxx guifg=#d0a215 guibg=#464442
          lualine_x_13_replace({ bg = "#464442", fg = "#d0a215" }), -- lualine_x_13_replace xxx guifg=#d0a215 guibg=#464442
          lualine_x_13_command({ bg = "#464442", fg = "#d0a215" }), -- lualine_x_13_command xxx guifg=#d0a215 guibg=#464442
          lualine_x_13_terminal({ bg = "#464442", fg = "#d0a215" }), -- lualine_x_13_terminal xxx guifg=#d0a215 guibg=#464442
          lualine_x_13_inactive({ bg = "#464442", fg = "#d0a215" }), -- lualine_x_13_inactive xxx guifg=#d0a215 guibg=#464442
          lualine_x_14_normal({ bg = "#464442", fg = "#ce5d97" }), -- lualine_x_14_normal xxx guifg=#ce5d97 guibg=#464442
          lualine_x_14_insert({ bg = "#464442", fg = "#ce5d97" }), -- lualine_x_14_insert xxx guifg=#ce5d97 guibg=#464442
          lualine_x_14_visual({ bg = "#464442", fg = "#ce5d97" }), -- lualine_x_14_visual xxx guifg=#ce5d97 guibg=#464442
          lualine_x_14_replace({ bg = "#464442", fg = "#ce5d97" }), -- lualine_x_14_replace xxx guifg=#ce5d97 guibg=#464442
          lualine_x_14_command({ bg = "#464442", fg = "#ce5d97" }), -- lualine_x_14_command xxx guifg=#ce5d97 guibg=#464442
          lualine_x_14_terminal({ bg = "#464442", fg = "#ce5d97" }), -- lualine_x_14_terminal xxx guifg=#ce5d97 guibg=#464442
          lualine_x_14_inactive({ bg = "#464442", fg = "#ce5d97" }), -- lualine_x_14_inactive xxx guifg=#ce5d97 guibg=#464442
          lualine_x_15_normal({ bg = "#464442", fg = "#878580" }), -- lualine_x_15_normal xxx guifg=#878580 guibg=#464442
          lualine_x_15_insert({ bg = "#464442", fg = "#878580" }), -- lualine_x_15_insert xxx guifg=#878580 guibg=#464442
          lualine_x_15_visual({ bg = "#464442", fg = "#878580" }), -- lualine_x_15_visual xxx guifg=#878580 guibg=#464442
          lualine_x_15_replace({ bg = "#464442", fg = "#878580" }), -- lualine_x_15_replace xxx guifg=#878580 guibg=#464442
          lualine_x_15_command({ bg = "#464442", fg = "#878580" }), -- lualine_x_15_command xxx guifg=#878580 guibg=#464442
          lualine_x_15_terminal({ bg = "#464442", fg = "#878580" }), -- lualine_x_15_terminal xxx guifg=#878580 guibg=#464442
          lualine_x_15_inactive({ bg = "#464442", fg = "#878580" }), -- lualine_x_15_inactive xxx guifg=#878580 guibg=#464442
          lualine_x_diff_added_normal({ bg = "#464442", fg = "#100f0f" }), -- lualine_x_diff_added_normal xxx guifg=#100f0f guibg=#464442
          lualine_x_diff_added_insert({ bg = "#464442", fg = "#100f0f" }), -- lualine_x_diff_added_insert xxx guifg=#100f0f guibg=#464442
          lualine_x_diff_added_visual({ bg = "#464442", fg = "#100f0f" }), -- lualine_x_diff_added_visual xxx guifg=#100f0f guibg=#464442
          lualine_x_diff_added_replace({ bg = "#464442", fg = "#100f0f" }), -- lualine_x_diff_added_replace xxx guifg=#100f0f guibg=#464442
          lualine_x_diff_added_command({ bg = "#464442", fg = "#100f0f" }), -- lualine_x_diff_added_command xxx guifg=#100f0f guibg=#464442
          lualine_x_diff_added_terminal({ bg = "#464442", fg = "#100f0f" }), -- lualine_x_diff_added_terminal xxx guifg=#100f0f guibg=#464442
          lualine_x_diff_added_inactive({ bg = "#464442", fg = "#100f0f" }), -- lualine_x_diff_added_inactive xxx guifg=#100f0f guibg=#464442
          lualine_x_diff_modified_normal({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_modified_normal xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_modified_insert({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_modified_insert xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_modified_visual({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_modified_visual xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_modified_replace({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_modified_replace xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_modified_command({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_modified_command xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_modified_terminal({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_modified_terminal xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_modified_inactive({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_modified_inactive xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_removed_normal({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_removed_normal xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_removed_insert({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_removed_insert xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_removed_visual({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_removed_visual xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_removed_replace({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_removed_replace xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_removed_command({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_removed_command xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_removed_terminal({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_removed_terminal xxx guifg=#1c1b1a guibg=#464442
          lualine_x_diff_removed_inactive({ bg = "#464442", fg = "#1c1b1a" }), -- lualine_x_diff_removed_inactive xxx guifg=#1c1b1a guibg=#464442
          lualine_c_8_LV_Bold_normal({ gui = "bold", bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_8_LV_Bold_normal xxx gui=bold guifg=#e2e1d6 guibg=#464442
          lualine_c_8_LV_Bold_insert({ gui = "bold", bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_8_LV_Bold_insert xxx gui=bold guifg=#e2e1d6 guibg=#464442
          lualine_c_8_LV_Bold_visual({ gui = "bold", bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_8_LV_Bold_visual xxx gui=bold guifg=#e2e1d6 guibg=#464442
          lualine_c_8_LV_Bold_replace({ gui = "bold", bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_8_LV_Bold_replace xxx gui=bold guifg=#e2e1d6 guibg=#464442
          lualine_c_8_LV_Bold_command({ gui = "bold", bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_8_LV_Bold_command xxx gui=bold guifg=#e2e1d6 guibg=#464442
          lualine_c_8_LV_Bold_terminal({ gui = "bold", bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_8_LV_Bold_terminal xxx gui=bold guifg=#e2e1d6 guibg=#464442
          lualine_c_8_LV_Bold_inactive({ gui = "bold", bg = "#464442", fg = "#e2e1d6" }), -- lualine_c_8_LV_Bold_inactive xxx gui=bold guifg=#e2e1d6 guibg=#464442
          lualine_transitional_lualine_a_normal_to_lualine_b_normal({ bg = "#111010", fg = "#279087" }), -- lualine_transitional_lualine_a_normal_to_lualine_b_normal xxx guifg=#279087 guibg=#111010
          lualine_transitional_lualine_b_normal_to_lualine_c_8_LV_Bold_normal({ bg = "#464442", fg = "#111010" }), -- lualine_transitional_lualine_b_normal_to_lualine_c_8_LV_Bold_normal xxx guifg=#111010 guibg=#464442
          lualine_transitional_lualine_b_normal_to_lualine_c_normal({ bg = "#464442", fg = "#111010" }), -- lualine_transitional_lualine_b_normal_to_lualine_c_normal xxx guifg=#111010 guibg=#464442
          BufferLineInfoSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#8cf8f7", sp = "#8cf8f7" }), -- BufferLineInfoSelected xxx cterm=bold,italic gui=bold,italic guifg=#8cf8f7 guibg=#100f0f guisp=#8cf8f7
          BufferLineInfoVisible({ bg = "#0e0d0d", fg = "#575653" }), -- BufferLineInfoVisible xxx guifg=#575653 guibg=#0e0d0d
          BufferLineHintDiagnosticSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#7ca4bf", sp = "#7ca4bf" }), -- BufferLineHintDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#7ca4bf guibg=#100f0f guisp=#7ca4bf
          BufferLineHintDiagnosticVisible({ bg = "#0e0d0d", fg = "#41403e" }), -- BufferLineHintDiagnosticVisible xxx guifg=#41403e guibg=#0e0d0d
          BufferLineHintDiagnostic({ bg = "#0c0b0b", fg = "#41403e", sp = "#7ca4bf" }), -- BufferLineHintDiagnostic xxx guifg=#41403e guibg=#0c0b0b guisp=#7ca4bf
          BufferLineHintSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#a6dbff", sp = "#a6dbff" }), -- BufferLineHintSelected xxx cterm=bold,italic gui=bold,italic guifg=#a6dbff guibg=#100f0f guisp=#a6dbff
          BufferLineHintVisible({ bg = "#0e0d0d", fg = "#575653" }), -- BufferLineHintVisible xxx guifg=#575653 guibg=#0e0d0d
          BufferLineDiagnosticSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#9a9992" }), -- BufferLineDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#9a9992 guibg=#100f0f
          BufferLineDiagnosticVisible({ bg = "#0e0d0d", fg = "#41403e" }), -- BufferLineDiagnosticVisible xxx guifg=#41403e guibg=#0e0d0d
          BufferLineNumbersVisible({ bg = "#0e0d0d", fg = "#575653" }), -- BufferLineNumbersVisible xxx guifg=#575653 guibg=#0e0d0d
          BufferLineNumbersSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#cecdc3" }), -- BufferLineNumbersSelected xxx cterm=bold,italic gui=bold,italic guifg=#cecdc3 guibg=#100f0f
          BufferLineNumbers({ bg = "#0c0b0b", fg = "#575653" }), -- BufferLineNumbers xxx guifg=#575653 guibg=#0c0b0b
          BufferLineBufferSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#cecdc3" }), -- BufferLineBufferSelected xxx cterm=bold,italic gui=bold,italic guifg=#cecdc3 guibg=#100f0f
          BufferLineBufferVisible({ bg = "#0e0d0d", fg = "#575653" }), -- BufferLineBufferVisible xxx guifg=#575653 guibg=#0e0d0d
          BufferLineCloseButtonSelected({ bg = "#100f0f", fg = "#cecdc3" }), -- BufferLineCloseButtonSelected xxx guifg=#cecdc3 guibg=#100f0f
          BufferLineCloseButtonVisible({ bg = "#0e0d0d", fg = "#575653" }), -- BufferLineCloseButtonVisible xxx guifg=#575653 guibg=#0e0d0d
          BufferLineWarning({ bg = "#0c0b0b", fg = "#575653", sp = "#fce094" }), -- BufferLineWarning xxx guifg=#575653 guibg=#0c0b0b guisp=#fce094
          BufferLineInfoDiagnostic({ bg = "#0c0b0b", fg = "#41403e", sp = "#69bab9" }), -- BufferLineInfoDiagnostic xxx guifg=#41403e guibg=#0c0b0b guisp=#69bab9
          BufferLinePick({ gui = "bold,italic", bg = "#0c0b0b", fg = "#ffc0b9" }), -- BufferLinePick xxx cterm=bold,italic gui=bold,italic guifg=#ffc0b9 guibg=#0c0b0b
          BufferLineInfoDiagnosticVisible({ bg = "#0e0d0d", fg = "#41403e" }), -- BufferLineInfoDiagnosticVisible xxx guifg=#41403e guibg=#0e0d0d
          BufferLineFill({ bg = "#080808", fg = "#575653" }), -- BufferLineFill xxx guifg=#575653 guibg=#080808
          BufferLineIndicatorVisible({ bg = "#0e0d0d", fg = "#0e0d0d" }), -- BufferLineIndicatorVisible xxx guifg=#0e0d0d guibg=#0e0d0d
          BufferLinePickVisible({ gui = "bold,italic", bg = "#0e0d0d", fg = "#ffc0b9" }), -- BufferLinePickVisible xxx cterm=bold,italic gui=bold,italic guifg=#ffc0b9 guibg=#0e0d0d
          BufferLineOffsetSeparator({ bg = "#080808", fg = "#282726" }), -- BufferLineOffsetSeparator xxx guifg=#282726 guibg=#080808
          BufferLinePickSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#ffc0b9" }), -- BufferLinePickSelected xxx cterm=bold,italic gui=bold,italic guifg=#ffc0b9 guibg=#100f0f
          BufferLineHint({ bg = "#0c0b0b", fg = "#575653", sp = "#a6dbff" }), -- BufferLineHint xxx guifg=#575653 guibg=#0c0b0b guisp=#a6dbff
          BufferLineSeparator({ bg = "#0c0b0b", fg = "#080808" }), -- BufferLineSeparator xxx guifg=#080808 guibg=#0c0b0b
          BufferLineInfo({ bg = "#0c0b0b", fg = "#575653", sp = "#8cf8f7" }), -- BufferLineInfo xxx guifg=#575653 guibg=#0c0b0b guisp=#8cf8f7
          BufferLineTab({ bg = "#0c0b0b", fg = "#575653" }), -- BufferLineTab  xxx guifg=#575653 guibg=#0c0b0b
          BufferLineDiagnostic({ bg = "#0c0b0b", fg = "#41403e" }), -- BufferLineDiagnostic xxx guifg=#41403e guibg=#0c0b0b
          BufferLineBuffer({ bg = "#0c0b0b", fg = "#575653" }), -- BufferLineBuffer xxx guifg=#575653 guibg=#0c0b0b
          BufferLineCloseButton({ bg = "#0c0b0b", fg = "#575653" }), -- BufferLineCloseButton xxx guifg=#575653 guibg=#0c0b0b
          BufferLineTabClose({ bg = "#0c0b0b", fg = "#575653" }), -- BufferLineTabClose xxx guifg=#575653 guibg=#0c0b0b
          BufferLineTabSelected({ bg = "#100f0f", fg = "#403e3c" }), -- BufferLineTabSelected xxx guifg=#403e3c guibg=#100f0f
          BufferLineGroupLabel({ bg = "#575653", fg = "#080808" }), -- BufferLineGroupLabel xxx guifg=#080808 guibg=#575653
          BufferLineTruncMarker({ bg = "#080808", fg = "#575653" }), -- BufferLineTruncMarker xxx guifg=#575653 guibg=#080808
          BufferLineGroupSeparator({ bg = "#080808", fg = "#575653" }), -- BufferLineGroupSeparator xxx guifg=#575653 guibg=#080808
          BufferLineBackground({ bg = "#0c0b0b", fg = "#575653" }), -- BufferLineBackground xxx guifg=#575653 guibg=#0c0b0b
          BufferLineTabSeparatorSelected({ bg = "#100f0f", fg = "#080808" }), -- BufferLineTabSeparatorSelected xxx guifg=#080808 guibg=#100f0f
          BufferLineTabSeparator({ bg = "#0c0b0b", fg = "#080808" }), -- BufferLineTabSeparator xxx guifg=#080808 guibg=#0c0b0b
          BufferLineSeparatorVisible({ bg = "#0e0d0d", fg = "#080808" }), -- BufferLineSeparatorVisible xxx guifg=#080808 guibg=#0e0d0d
          BufferLineSeparatorSelected({ bg = "#100f0f", fg = "#080808" }), -- BufferLineSeparatorSelected xxx guifg=#080808 guibg=#100f0f
          BufferLineDuplicate({ gui = "italic", bg = "#0c0b0b", fg = "#52514e" }), -- BufferLineDuplicate xxx cterm=italic gui=italic guifg=#52514e guibg=#0c0b0b
          BufferLineDuplicateVisible({ gui = "italic", bg = "#0e0d0d", fg = "#52514e" }), -- BufferLineDuplicateVisible xxx cterm=italic gui=italic guifg=#52514e guibg=#0e0d0d
          BufferLineDuplicateSelected({ gui = "italic", bg = "#100f0f", fg = "#52514e" }), -- BufferLineDuplicateSelected xxx cterm=italic gui=italic guifg=#52514e guibg=#100f0f
          BufferLineModifiedSelected({ bg = "#100f0f", fg = "#3aa99f" }), -- BufferLineModifiedSelected xxx guifg=#3aa99f guibg=#100f0f
          BufferLineModifiedVisible({ bg = "#0e0d0d", fg = "#3aa99f" }), -- BufferLineModifiedVisible xxx guifg=#3aa99f guibg=#0e0d0d
          BufferLineErrorDiagnosticSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#bf908a", sp = "#bf908a" }), -- BufferLineErrorDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#bf908a guibg=#100f0f guisp=#bf908a
          BufferLineErrorDiagnosticVisible({ bg = "#0e0d0d", fg = "#41403e" }), -- BufferLineErrorDiagnosticVisible xxx guifg=#41403e guibg=#0e0d0d
          BufferLineErrorDiagnostic({ bg = "#0c0b0b", fg = "#41403e", sp = "#bf908a" }), -- BufferLineErrorDiagnostic xxx guifg=#41403e guibg=#0c0b0b guisp=#bf908a
          BufferLineErrorSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#ffc0b9", sp = "#ffc0b9" }), -- BufferLineErrorSelected xxx cterm=bold,italic gui=bold,italic guifg=#ffc0b9 guibg=#100f0f guisp=#ffc0b9
          BufferLineErrorVisible({ bg = "#0e0d0d", fg = "#575653" }), -- BufferLineErrorVisible xxx guifg=#575653 guibg=#0e0d0d
          BufferLineWarningDiagnosticSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#bda86f", sp = "#bda86f" }), -- BufferLineWarningDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#bda86f guibg=#100f0f guisp=#bda86f
          BufferLineWarningDiagnosticVisible({ bg = "#0e0d0d", fg = "#41403e" }), -- BufferLineWarningDiagnosticVisible xxx guifg=#41403e guibg=#0e0d0d
          BufferLineWarningDiagnostic({ bg = "#0c0b0b", fg = "#41403e", sp = "#bda86f" }), -- BufferLineWarningDiagnostic xxx guifg=#41403e guibg=#0c0b0b guisp=#bda86f
          BufferLineWarningSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#fce094", sp = "#fce094" }), -- BufferLineWarningSelected xxx cterm=bold,italic gui=bold,italic guifg=#fce094 guibg=#100f0f guisp=#fce094
          BufferLineWarningVisible({ bg = "#0e0d0d", fg = "#575653" }), -- BufferLineWarningVisible xxx guifg=#575653 guibg=#0e0d0d
          BufferLineInfoDiagnosticSelected({ gui = "bold,italic", bg = "#100f0f", fg = "#69bab9", sp = "#69bab9" }), -- BufferLineInfoDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#69bab9 guibg=#100f0f guisp=#69bab9
          BufferLineError({ bg = "#0c0b0b", fg = "#575653", sp = "#ffc0b9" }), -- BufferLineError xxx guifg=#575653 guibg=#0c0b0b guisp=#ffc0b9
          BufferLineModified({ bg = "#0c0b0b", fg = "#3aa99f" }), -- BufferLineModified xxx guifg=#3aa99f guibg=#0c0b0b
          NoiceFormatProgressDone({ bg = "#24837b", fg = "#cecdc3" }), -- NoiceFormatProgressDone xxx guifg=#cecdc3 guibg=#24837b
          NoiceHiddenCursor({ blend = 100, gui = "nocombine" }), -- NoiceHiddenCursor xxx cterm=nocombine gui=nocombine blend=100
          BufferLineDevIconDefault({ bg = "#0c0b0b" }), -- BufferLineDevIconDefault xxx guibg=#0c0b0b
          BufferLineMiniIconsGreyInactive({ bg = "#0e0d0d" }), -- BufferLineMiniIconsGreyInactive xxx guibg=#0e0d0d
          lualine_transitional_lualine_a_normal_to_lualine_c_normal({ bg = "#464442", fg = "#279087" }), -- lualine_transitional_lualine_a_normal_to_lualine_c_normal xxx guifg=#279087 guibg=#464442
          lualine_transitional_lualine_b_normal_to_lualine_x_10_normal({ bg = "#464442", fg = "#111010" }), -- lualine_transitional_lualine_b_normal_to_lualine_x_10_normal xxx guifg=#111010 guibg=#464442
          lualine_transitional_lualine_a_command_to_lualine_b_command({ bg = "#111010", fg = "#4992d1" }), -- lualine_transitional_lualine_a_command_to_lualine_b_command xxx guifg=#4992d1 guibg=#111010
          lualine_transitional_lualine_b_command_to_lualine_c_command({ bg = "#464442", fg = "#111010" }), -- lualine_transitional_lualine_b_command_to_lualine_c_command xxx guifg=#111010 guibg=#464442
          lualine_transitional_lualine_b_command_to_lualine_x_10_command({ bg = "#464442", fg = "#111010" }), -- lualine_transitional_lualine_b_command_to_lualine_x_10_command xxx guifg=#111010 guibg=#464442
          NoiceAttr232({ gui = "bold", fg = "#af3029" }), -- NoiceAttr232   xxx cterm=bold gui=bold guifg=#af3029
          CmpItemAbbrDefault({ fg = "#878580" }), -- CmpItemAbbrDefault xxx guifg=#878580
          CmpItemAbbr({ CmpItemAbbrDefault }), -- CmpItemAbbr    xxx links to CmpItemAbbrDefault
          CmpItemAbbrDeprecatedDefault({ fg = "#575653" }), -- CmpItemAbbrDeprecatedDefault xxx guifg=#575653
          CmpItemAbbrDeprecated({ CmpItemAbbrDeprecatedDefault }), -- CmpItemAbbrDeprecated xxx links to CmpItemAbbrDeprecatedDefault
          CmpItemAbbrMatchDefault({ fg = "#878580" }), -- CmpItemAbbrMatchDefault xxx guifg=#878580
          CmpItemAbbrMatch({ CmpItemAbbrMatchDefault }), -- CmpItemAbbrMatch xxx links to CmpItemAbbrMatchDefault
          CmpItemAbbrMatchFuzzyDefault({ fg = "#878580" }), -- CmpItemAbbrMatchFuzzyDefault xxx guifg=#878580
          CmpItemAbbrMatchFuzzy({ CmpItemAbbrMatchFuzzyDefault }), -- CmpItemAbbrMatchFuzzy xxx links to CmpItemAbbrMatchFuzzyDefault
          CmpItemMenuDefault({ fg = "#878580" }), -- CmpItemMenuDefault xxx guifg=#878580
          CmpItemMenu({ CmpItemMenuDefault }), -- CmpItemMenu    xxx links to CmpItemMenuDefault
          lualine_c_filetype_MiniIconsYellow_normal({ bg = "#464442", fg = "#fce094" }), -- lualine_c_filetype_MiniIconsYellow_normal xxx guifg=#fce094 guibg=#464442
          lualine_c_filetype_MiniIconsYellow_insert({ bg = "#464442", fg = "#fce094" }), -- lualine_c_filetype_MiniIconsYellow_insert xxx guifg=#fce094 guibg=#464442
          lualine_c_filetype_MiniIconsYellow_visual({ bg = "#464442", fg = "#fce094" }), -- lualine_c_filetype_MiniIconsYellow_visual xxx guifg=#fce094 guibg=#464442
          lualine_c_filetype_MiniIconsYellow_replace({ bg = "#464442", fg = "#fce094" }), -- lualine_c_filetype_MiniIconsYellow_replace xxx guifg=#fce094 guibg=#464442
          lualine_c_filetype_MiniIconsYellow_command({ bg = "#464442", fg = "#fce094" }), -- lualine_c_filetype_MiniIconsYellow_command xxx guifg=#fce094 guibg=#464442
          lualine_c_filetype_MiniIconsYellow_terminal({ bg = "#464442", fg = "#fce094" }), -- lualine_c_filetype_MiniIconsYellow_terminal xxx guifg=#fce094 guibg=#464442
          lualine_c_filetype_MiniIconsYellow_inactive({ bg = "#464442", fg = "#fce094" }), -- lualine_c_filetype_MiniIconsYellow_inactive xxx guifg=#fce094 guibg=#464442
          lualine_transitional_lualine_a_insert_to_lualine_b_insert({ bg = "#111010", fg = "#3fb9ae" }), -- lualine_transitional_lualine_a_insert_to_lualine_b_insert xxx guifg=#3fb9ae guibg=#111010
          lualine_transitional_lualine_b_insert_to_lualine_c_filetype_MiniIconsYellow_insert({
            bg = "#464442",
            fg = "#111010",
          }), -- lualine_transitional_lualine_b_insert_to_lualine_c_filetype_MiniIconsYellow_insert xxx guifg=#111010 guibg=#464442
          lualine_transitional_lualine_b_insert_to_lualine_x_10_insert({ bg = "#464442", fg = "#111010" }), -- lualine_transitional_lualine_b_insert_to_lualine_x_10_insert xxx guifg=#111010 guibg=#464442
          IblWhitespace({ fg = "#575653" }), -- IblWhitespace  xxx guifg=#575653
          sym("@ibl.indent.char.1")({ gui = "nocombine", fg = "#575653" }), -- @ibl.indent.char.1 xxx cterm=nocombine gui=nocombine guifg=#575653
          sym("@ibl.whitespace.char.1")({ gui = "nocombine", fg = "#575653" }), -- @ibl.whitespace.char.1 xxx cterm=nocombine gui=nocombine guifg=#575653
          sym("@ibl.scope.char.1")({ gui = "nocombine", fg = "#575653" }), -- @ibl.scope.char.1 xxx cterm=nocombine gui=nocombine guifg=#575653
          sym("@ibl.scope.underline.1")({ gui = "underline", sp = "#575653" }), -- @ibl.scope.underline.1 xxx cterm=underline gui=underline guisp=#575653
          GitSignsStagedAdd({ fg = "#597b60" }), -- GitSignsStagedAdd xxx guifg=#597b60
          GitSignsStagedChange({ fg = "#467c7b" }), -- GitSignsStagedChange xxx guifg=#467c7b
          GitSignsStagedDelete({ fg = "#7f605c" }), -- GitSignsStagedDelete xxx guifg=#7f605c
          GitSignsStagedChangedelete({ fg = "#467c7b" }), -- GitSignsStagedChangedelete xxx guifg=#467c7b
          GitSignsStagedTopdelete({ fg = "#7f605c" }), -- GitSignsStagedTopdelete xxx guifg=#7f605c
          GitSignsStagedAddNr({ fg = "#597b60" }), -- GitSignsStagedAddNr xxx guifg=#597b60
          GitSignsStagedChangeNr({ fg = "#467c7b" }), -- GitSignsStagedChangeNr xxx guifg=#467c7b
          GitSignsStagedDeleteNr({ fg = "#7f605c" }), -- GitSignsStagedDeleteNr xxx guifg=#7f605c
          GitSignsStagedChangedeleteNr({ fg = "#467c7b" }), -- GitSignsStagedChangedeleteNr xxx guifg=#467c7b
          GitSignsStagedTopdeleteNr({ fg = "#7f605c" }), -- GitSignsStagedTopdeleteNr xxx guifg=#7f605c
          GitSignsStagedAddLn({ bg = "#879a39", fg = "#080707" }), -- GitSignsStagedAddLn xxx guifg=#080707 guibg=#879a39
          GitSignsStagedChangeLn({ bg = "#8b7ec8", fg = "#0e0d0d" }), -- GitSignsStagedChangeLn xxx guifg=#0e0d0d guibg=#8b7ec8
          GitSignsStagedChangedeleteLn({ bg = "#8b7ec8", fg = "#0e0d0d" }), -- GitSignsStagedChangedeleteLn xxx guifg=#0e0d0d guibg=#8b7ec8
          GitSignsStagedAddCul({ fg = "#597b60" }), -- GitSignsStagedAddCul xxx guifg=#597b60
          GitSignsStagedChangeCul({ fg = "#467c7b" }), -- GitSignsStagedChangeCul xxx guifg=#467c7b
          GitSignsStagedDeleteCul({ fg = "#7f605c" }), -- GitSignsStagedDeleteCul xxx guifg=#7f605c
          GitSignsStagedChangedeleteCul({ fg = "#467c7b" }), -- GitSignsStagedChangedeleteCul xxx guifg=#467c7b
          GitSignsStagedTopdeleteCul({ fg = "#7f605c" }), -- GitSignsStagedTopdeleteCul xxx guifg=#7f605c
          TodoBgTODO({ gui = "bold", bg = "#8cf8f7", fg = "#100f0f" }), -- TodoBgTODO     xxx gui=bold guifg=#100f0f guibg=#8cf8f7
          TodoFgTODO({ fg = "#8cf8f7" }), -- TodoFgTODO     xxx guifg=#8cf8f7
          TodoSignTODO({ fg = "#8cf8f7" }), -- TodoSignTODO   xxx guifg=#8cf8f7
          TodoBgNOTE({ gui = "bold", bg = "#a6dbff", fg = "#100f0f" }), -- TodoBgNOTE     xxx gui=bold guifg=#100f0f guibg=#a6dbff
          TodoFgNOTE({ fg = "#a6dbff" }), -- TodoFgNOTE     xxx guifg=#a6dbff
          TodoSignNOTE({ fg = "#a6dbff" }), -- TodoSignNOTE   xxx guifg=#a6dbff
          TodoBgPERF({ gui = "bold", bg = "#4385be", fg = "#100f0f" }), -- TodoBgPERF     xxx gui=bold guifg=#100f0f guibg=#4385be
          TodoFgPERF({ fg = "#4385be" }), -- TodoFgPERF     xxx guifg=#4385be
          TodoSignPERF({ fg = "#4385be" }), -- TodoSignPERF   xxx guifg=#4385be
          TodoBgFIX({ gui = "bold", bg = "#ffc0b9", fg = "#100f0f" }), -- TodoBgFIX      xxx gui=bold guifg=#100f0f guibg=#ffc0b9
          TodoFgFIX({ fg = "#ffc0b9" }), -- TodoFgFIX      xxx guifg=#ffc0b9
          TodoSignFIX({ fg = "#ffc0b9" }), -- TodoSignFIX    xxx guifg=#ffc0b9
          TodoBgTEST({ gui = "bold", bg = "#4385be", fg = "#100f0f" }), -- TodoBgTEST     xxx gui=bold guifg=#100f0f guibg=#4385be
          TodoFgTEST({ fg = "#4385be" }), -- TodoFgTEST     xxx guifg=#4385be
          TodoSignTEST({ fg = "#4385be" }), -- TodoSignTEST   xxx guifg=#4385be
          TodoBgWARN({ gui = "bold", bg = "#fce094", fg = "#100f0f" }), -- TodoBgWARN     xxx gui=bold guifg=#100f0f guibg=#fce094
          TodoFgWARN({ fg = "#fce094" }), -- TodoFgWARN     xxx guifg=#fce094
          TodoSignWARN({ fg = "#fce094" }), -- TodoSignWARN   xxx guifg=#fce094
          TodoBgHACK({ gui = "bold", bg = "#fce094", fg = "#100f0f" }), -- TodoBgHACK     xxx gui=bold guifg=#100f0f guibg=#fce094
          TodoFgHACK({ fg = "#fce094" }), -- TodoFgHACK     xxx guifg=#fce094
          TodoSignHACK({ fg = "#fce094" }), -- TodoSignHACK   xxx guifg=#fce094
          BufferLineMiniIconsAzureSelected({ bg = "#100f0f", fg = "#da702c" }), -- BufferLineMiniIconsAzureSelected xxx guifg=#da702c guibg=#100f0f
          lualine_c_filetype_MiniIconsAzure_normal({ bg = "#464442", fg = "#da702c" }), -- lualine_c_filetype_MiniIconsAzure_normal xxx guifg=#da702c guibg=#464442
          lualine_c_filetype_MiniIconsAzure_insert({ bg = "#464442", fg = "#da702c" }), -- lualine_c_filetype_MiniIconsAzure_insert xxx guifg=#da702c guibg=#464442
          lualine_c_filetype_MiniIconsAzure_visual({ bg = "#464442", fg = "#da702c" }), -- lualine_c_filetype_MiniIconsAzure_visual xxx guifg=#da702c guibg=#464442
          lualine_c_filetype_MiniIconsAzure_replace({ bg = "#464442", fg = "#da702c" }), -- lualine_c_filetype_MiniIconsAzure_replace xxx guifg=#da702c guibg=#464442
          lualine_c_filetype_MiniIconsAzure_command({ bg = "#464442", fg = "#da702c" }), -- lualine_c_filetype_MiniIconsAzure_command xxx guifg=#da702c guibg=#464442
          lualine_c_filetype_MiniIconsAzure_terminal({ bg = "#464442", fg = "#da702c" }), -- lualine_c_filetype_MiniIconsAzure_terminal xxx guifg=#da702c guibg=#464442
          lualine_c_filetype_MiniIconsAzure_inactive({ bg = "#464442", fg = "#da702c" }), -- lualine_c_filetype_MiniIconsAzure_inactive xxx guifg=#da702c guibg=#464442
          lualine_transitional_lualine_b_normal_to_lualine_c_filetype_MiniIconsAzure_normal({
            bg = "#464442",
            fg = "#111010",
          }), -- lualine_transitional_lualine_b_normal_to_lualine_c_filetype_MiniIconsAzure_normal xxx guifg=#111010 guibg=#464442
          lualine_transitional_lualine_b_normal_to_lualine_x_12_normal({ bg = "#464442", fg = "#111010" }), -- lualine_transitional_lualine_b_normal_to_lualine_x_12_normal xxx guifg=#111010 guibg=#464442
          lualine_transitional_lualine_b_command_to_lualine_c_filetype_MiniIconsAzure_command({
            bg = "#464442",
            fg = "#111010",
          }), -- lualine_transitional_lualine_b_command_to_lualine_c_filetype_MiniIconsAzure_command xxx guifg=#111010 guibg=#464442
          lualine_transitional_lualine_b_command_to_lualine_x_12_command({ bg = "#464442", fg = "#111010" }), -- lualine_transitional_lualine_b_command_to_lualine_x_12_command xxx guifg=#111010 guibg=#464442
        }
      end)
      return theme
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = {
            skip = true,
          },
        },
      },
    },
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        livePreview = true, -- Apply theme while picking. Default to true.
      })
    end,
  },
}
