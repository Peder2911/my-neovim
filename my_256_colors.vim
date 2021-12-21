" Scheme setup {{{
set background=dark
hi! clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "my_256_colors"

"}}}

" Vim UI {{{
hi Normal              ctermfg=7
hi Cursor              ctermfg=7     ctermbg=1
hi CursorLine          ctermbg=0     cterm=NONE
hi MatchParen          ctermfg=7     ctermbg=NONE  cterm=underline
hi Pmenu               ctermfg=0     ctermbg=7
hi PmenuThumb          ctermbg=0
hi PmenuSBar           ctermbg=0
hi PmenuSel            ctermfg=0     ctermbg=4
hi ColorColumn         ctermbg=0
hi SpellBad            ctermfg=1     ctermbg=NONE  cterm=underline
hi SpellCap            ctermfg=10    ctermbg=NONE  cterm=underline
hi SpellRare           ctermfg=11    ctermbg=NONE  cterm=underline
hi SpellLocal          ctermfg=13    ctermbg=NONE  cterm=underline
hi NonText             ctermfg=8
hi LineNr              ctermfg=8     ctermbg=NONE
hi CursorLineNr        ctermfg=11    ctermbg=0
hi Visual              ctermfg=0     ctermbg=12
hi IncSearch           ctermfg=0     ctermbg=6     cterm=NONE
hi Search              ctermfg=0     ctermbg=6 
hi StatusLine          ctermfg=0     ctermbg=2     cterm=NONE
hi StatusLineNC        ctermfg=2     ctermbg=10    cterm=NONE
hi VertSplit           ctermfg=0     ctermbg=10    cterm=NONE
hi TabLine             ctermfg=8     ctermbg=0     cterm=NONE
hi TabLineSel          ctermfg=7     ctermbg=0
hi Folded              ctermfg=6     ctermbg=0     cterm=bold
hi Conceal             ctermfg=6     ctermbg=NONE
hi Directory           ctermfg=12
hi Title               ctermfg=3     cterm=bold
hi ErrorMsg            ctermfg=10    ctermbg=1
hi DiffAdd             ctermfg=0     ctermbg=2
hi DiffChange          ctermfg=0     ctermbg=3
hi DiffDelete          ctermfg=0     ctermbg=1
hi DiffText            ctermfg=0     ctermbg=11    cterm=bold
hi User1               ctermfg=1     ctermbg=0
hi User2               ctermfg=4     ctermbg=0
hi User3               ctermfg=2     ctermbg=0
hi User4               ctermfg=3     ctermbg=0
hi User5               ctermfg=5     ctermbg=0
hi User6               ctermfg=6     ctermbg=0
hi User7               ctermfg=7     ctermbg=0
hi User8               ctermfg=8     ctermbg=0
hi User9               ctermfg=10    ctermbg=5
hi! link CursorColumn  CursorLine
hi! link SignColumn    LineNr
hi! link WildMenu      Visual
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link MoreMsg       Title
hi! link Question      MoreMsg
hi! link ModeMsg       MoreMsg
hi! link TabLineFill   StatusLineNC
hi! link SpecialKey    NonText

"}}}
" Generic syntax {{{
hi Delimiter       ctermfg=7
hi Comment         ctermfg=8
hi Underlined      ctermfg=4   cterm=underline
hi Type            ctermfg=4
hi String          ctermfg=6
hi Keyword         ctermfg=2
hi Todo            ctermfg=10  ctermbg=NONE     cterm=bold,underline
hi Function        ctermfg=4
hi Identifier      ctermfg=7   cterm=NONE
hi Statement       ctermfg=2   cterm=bold
hi Constant        ctermfg=13
hi Number          ctermfg=12
hi Boolean         ctermfg=4
hi Special         ctermfg=13
hi Ignore          ctermfg=0
hi PreProc         ctermfg=7   " cterm=bold
hi! link Operator  Delimiter
hi! link Error     ErrorMsg

"}}}
" HTML {{{
hi htmlTagName              ctermfg=2 cterm=bold
hi htmlTag                  ctermfg=2
hi htmlArg                  ctermfg=2
hi htmlH1                   cterm=bold
hi htmlBold                 cterm=bold
hi htmlItalic               cterm=underline
hi htmlUnderline            cterm=underline
hi htmlBoldItalic           cterm=bold,underline
hi htmlBoldUnderline        cterm=bold,underline
hi htmlUnderlineItalic      cterm=underline
hi htmlBoldUnderlineItalic  cterm=bold,underline
hi! link htmlLink           Underlined
hi! link htmlEndTag         htmlTag

"}}}
" XML {{{
hi xmlTagName       ctermfg=4
hi xmlTag           ctermfg=12
hi! link xmlString  xmlTagName
hi! link xmlAttrib  xmlTag
hi! link xmlEndTag  xmlTag
hi! link xmlEqual   xmlTag

"}}}
" JavaScript {{{
hi! link javaScript        Normal
hi! link javaScriptBraces  Delimiter

"}}}
" PHP {{{
hi phpSpecialFunction    ctermfg=5
hi phpIdentifier         ctermfg=11
hi phpParent             ctermfg=8
hi! link phpVarSelector  phpIdentifier
hi! link phpHereDoc      String
hi! link phpDefine       Statement

"}}}
" Markdown {{{
hi! link markdownHeadingRule        NonText
hi! link markdownHeadingDelimiter   markdownHeadingRule
hi! link markdownLinkDelimiter      Delimiter
hi! link markdownURLDelimiter       Delimiter
hi! link markdownCodeDelimiter      NonText
hi! link markdownLinkTextDelimiter  markdownLinkDelimiter
hi! link markdownUrl                markdownLinkText
hi! link markdownAutomaticLink      markdownLinkText
hi! link markdownCodeBlock          String
hi markdownCode                     cterm=bold
hi markdownBold                     cterm=bold
hi markdownItalic                   cterm=underline

"}}}
" Ruby {{{
hi! link rubyDefine                 Statement
hi! link rubyLocalVariableOrMethod  Identifier
hi! link rubyConstant               Constant
hi! link rubyInstanceVariable       Number
hi! link rubyStringDelimiter        rubyString

"}}}
" Git {{{
hi gitCommitBranch               ctermfg=3
hi gitCommitSelectedType         ctermfg=10
hi gitCommitSelectedFile         ctermfg=2
hi gitCommitUnmergedType         ctermfg=9
hi gitCommitUnmergedFile         ctermfg=1
hi! link gitCommitFile           Directory
hi! link gitCommitUntrackedFile  gitCommitUnmergedFile
hi! link gitCommitDiscardedType  gitCommitUnmergedType
hi! link gitCommitDiscardedFile  gitCommitUnmergedFile

"}}}
" Vim {{{
hi! link vimSetSep    Delimiter
hi! link vimContinue  Delimiter
hi! link vimHiAttrib  Constant

"}}}
" LESS {{{
hi lessVariable             ctermfg=11
hi! link lessVariableValue  Normal

"}}}
" NERDTree {{{
hi! link NERDTreeHelp      Comment
hi! link NERDTreeExecFile  String

"}}}
" Vimwiki {{{
hi! link VimwikiHeaderChar  markdownHeadingDelimiter
hi! link VimwikiList        markdownListMarker
hi! link VimwikiCode        markdownCode
hi! link VimwikiCodeChar    markdownCodeDelimiter

"}}}
" Help {{{
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined

"}}}
" CtrlP {{{
hi! link CtrlPMatch    String
hi! link CtrlPLinePre  Comment

"}}}
" Mustache {{{
hi mustacheSection           ctermfg=14  cterm=bold
hi mustacheMarker            ctermfg=6
hi mustacheVariable          ctermfg=14
hi mustacheVariableUnescape  ctermfg=9
hi mustachePartial           ctermfg=13

"}}}
" Shell {{{
hi shDerefSimple     ctermfg=11
hi! link shDerefVar  shDerefSimple

"}}}
" Syntastic {{{
hi SyntasticWarningSign       ctermfg=3  ctermbg=NONE
hi SyntasticErrorSign         ctermfg=1  ctermbg=NONE
hi SyntasticStyleWarningSign  ctermfg=2  ctermbg=NONE
hi SyntasticStyleErrorSign    ctermfg=4  ctermbg=NONE

"}}}
" Netrw {{{
hi netrwExe       ctermfg=9
hi netrwClassify  ctermfg=8  cterm=bold

"}}}
" Ledger {{{
hi ledgerAccount  ctermfg=11
hi! link ledgerMetadata  Comment
hi! link ledgerTransactionStatus  Statement

"}}}
" Diff {{{
hi diffAdded  ctermfg=2
hi diffRemoved  ctermfg=1
hi! link diffFile  PreProc
hi! link diffLine  Title

"}}}
" Plug {{{
hi plugSha  ctermfg=3

"}}}
" Blade {{{
hi! link bladeStructure  PreProc
hi! link bladeParen      phpParent
hi! link bladeEchoDelim  PreProc

"}}}
" Coc Stuff {{{
hi default CocUnderline cterm=underline gui=underline
"  The highlight for underlined text.

hi default CocBold term=bold cterm=bold gui=bold
"  The highlight for bold text.

hi default CocItalic term=italic cterm=italic gui=italic
"  The highlight for italic text.

hi default link CocMarkdownCode     markdownCode
"  The highlight for markdown code in floating window/popup.

hi default link CocMarkdownHeader   markdownH1
"  The highlight for markdown header in floating window/popup.

hi default CocMarkdownLink ctermfg=Blue guifg=#15aabf guibg=NONE
"  The highlight for markdown link text in floating window/popup.

hi CocErrorSign  ctermfg=0 ctermbg=1
"  The highlight used for error signs.

hi CocWarningSign  ctermfg=0 ctermbg=3
"  The highlight used for warning signs.

hi CocInfoSign  ctermfg=0 ctermbg=4
"  The highlight used for information signs.

hi CocHintSign  ctermfg=0 ctermbg=2
"  The highlight used for hint signs.

hi default link CocErrorVirtualText  CocErrorSign
"  The highlight used for error signs.

hi default link CocWarningVirtualText CocWarningSign
"  The highlight used for warning signs.

hi default link CocInfoVirtualText CocInfoSign
"  The highlight used for information signs.

hi default link CocHintVirtualText CocHintSign
"  The highlight used for hint signs.

hi default link CocErrorHighlight   CocUnderline
"  The highlight used for error text.

hi default link CocWarningHighlight   CocUnderline
"  The highlight used for warning text.

hi default link CocInfoHighlight   CocUnderline
"  The highlight used for information text.

hi default link CocHintHighlight   CocUnderline
"  The highlight used for hint text.

hi default link CocHighlightText CursorColumn
"  The highlight used for document highlight feature. Normally used for
"  highlighting same symbols in the buffer at the current cursor position.

hi default link CocHighlightRead  CocHighlightText
"  Highlight for `Read` kind of document symbol.

hi default link CocHighlightWrite  CocHighlightText
"  Highlight for `Write` kind of document symbol.

"  undefined
"  Line highlight of sign for a line that contains error diagnostic.

"  undefined
"  Line highlight of sign for a line that contains warning diagnostic.

"  undefined
"  Line highlight of sign for a line that contains info diagnostic.
  
"  undefined
"  Highlight for a line with diagnostic hint.

hi CocCodeLens ctermfg=Blue    guifg=#999999
"  Highlight group of virtual text for codeLens.

hi default link CocErrorFloat CocErrorSign
"  The highlight used for floating windows/popups with errors.

hi default link CocWarningFloat CocWarningSign
"  Highlight group of warnings in floating windows/popups.

hi default link CocInfoFloat CocInfoSign
"  Highlight group of infos in floating windows/popups.

hi default link CocHintFloat CocHintSign
"  Highlight group of hints in floating windows/popups.

hi default link CocCursorRange Search
"  The highlight used for cursor ranges.

hi default link CocHoverRange Search
"  The highlight used for current hover range.

hi default CocMenuSel ctermbg=7 ctermbg=0 
"  The highlight used for current menu item in menu dialog,
"  group of cursorline inside popup.

hi default link CocListMode ModeMsg
"  The highlight used for mode in statusline of CocList.

hi default link CocListPath Comment
"  The highlight used for current cwd in statusline of CocList.

"}}}
