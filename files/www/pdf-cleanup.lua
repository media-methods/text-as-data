-- Used only for the PDF version (see _quarto-pdf.yml):
-- 1) removes emojis (PDF fonts usually cannot display them)
-- 2) removes the "Quiz" headings (quizzes are only shown on the website)

local function is_emoji(cp)
  return (cp >= 0x1F000 and cp <= 0x1FAFF) or (cp >= 0x2600 and cp <= 0x27BF)
      or cp == 0xFE0F or cp == 0x200D or (cp >= 0x2B00 and cp <= 0x2BFF)
      or (cp >= 0x25A0 and cp <= 0x25FF)
end

local function strip(s)
  local out = {}
  for _, cp in utf8.codes(s) do
    if not is_emoji(cp) then out[#out + 1] = utf8.char(cp) end
  end
  return table.concat(out)
end

function Str(el)
  local s = strip(el.text)
  if s == "" then return {} end
  el.text = s
  return el
end

function Header(el)
  if pandoc.utils.stringify(el):match("^%s*Quiz%s*$") then
    return {}
  end
  return el
end
