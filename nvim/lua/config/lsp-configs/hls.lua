-- Since we have two parts of the code which need to know about semantic
-- tokens, we keep them in sync with this variable
local semantic_tokens = true

return {
  semantic_tokens = semantic_tokens,
  settings = {
    haskell = {
      plugin = {
        semanticTokens = {
          globalOn = semantic_tokens,
        },
      },
    },
  },
}
