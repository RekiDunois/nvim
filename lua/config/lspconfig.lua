local lspconfig = require('lspconfig')

vim.diagnostic.config({signs = false})

lspconfig.tsserver.setup {
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true
            }
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true
            }
        }
    },
    root_dir = function(...)
        return require("lspconfig.util").root_pattern(".git")(...)
    end,
    single_file_support = false
}
lspconfig.lua_ls.setup {
    single_file_support = true,
    settings = {
        Lua = {
            workspace = {checkThirdParty = false},
            completion = {workspaceWord = true, callSnippet = "Both"},
            misc = {
                parameters = {
                    -- "--log-level=trace",
                }
            },

            hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable"
            },
            doc = {privateName = {"^_"}},
            type = {castNumberToInteger = true},
            diagnostics = {
                disable = {"incomplete-signature-doc", "trailing-space"},
                -- enable = false,
                groupSeverity = {strong = "Warning", strict = "Warning"},
                groupFileStatus = {
                    ["ambiguity"] = "Opened",
                    ["await"] = "Opened",
                    ["codestyle"] = "None",
                    ["duplicate"] = "Opened",
                    ["global"] = "Opened",
                    ["luadoc"] = "Opened",
                    ["redefined"] = "Opened",
                    ["strict"] = "Opened",
                    ["strong"] = "Opened",
                    ["type-check"] = "Opened",
                    ["unbalanced"] = "Opened",
                    ["unused"] = "Opened"
                },
                unusedLocalExclude = {"_*"}
            },
            format = {
                enable = false,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                    continuation_indent_size = "2"
                }
            }
        }
    }
}
