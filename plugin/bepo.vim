" vim-bepo - Plugin vim pour disposition de clavier bépo
" Maintainer:   Micha Moskovic
" with modifications from zeroNounours

if exists('g:loaded_bepo') || &compatible
  finish
else
  let g:loaded_bepo = 1
endif

"s:tomap is for text-objects
function! s:tomap(key, target) abort
  if maparg(a:key, 'o') ==# ''
    execute "onoremap" a:key a:target
  endif
  if maparg(a:key, 'x') ==# ''
    execute "xnoremap" a:key a:target
  endif
endfunction

"s:amap is for the rest
function! s:amap(key, target) abort
  if maparg(a:key, 'n') ==# ''
    execute "nnoremap" a:key a:target
  endif
  call s:tomap(a:key, a:target)
endfunction

" Remapping des touches de directions
call s:amap(   't',  'h'     )    "on utilise {jklm} pour les directions
call s:amap(   's',  'j'     )    "on utilise {jklm} pour les directions
call s:amap(   'r',  'k'     )    "on utilise {jklm} pour les directions
call s:amap(   'n',  'l'     )    "on utilise {jklm} pour les directions
call s:amap(   'T',  'K'     )    "{K} devient [T]: help
call s:amap(   'S',  'L'     )    "{L} devient [H]: bas de l’écran
call s:amap(   'R',  'H'     )    "{H} devient [R]: haut de l’écran
call s:amap(   'N',  'J'     )    "{J} devient [N]: join with Next
call s:amap(  'gs', 'gj'     )    "on préserve les variantes avec 'g'
call s:amap(  'gr', 'gk'     )    "on préserve les variantes avec 'g'
call s:amap(  'zs', 'zj'     )    "on préserve les variantes avec 'z'
call s:amap(  'zr', 'zk'     )    "on préserve les variantes avec 'z'
call s:amap(   'j',  't'     )    "{t} devient [j] « jusqu’à »
call s:amap(   'J',  'T'     )    "idem pour {T} et [J]
call s:amap(   'h',  'r'     )    "{h} devient [r]
call s:amap(   'H',  'R'     )    "{H} devient [R]
call s:amap(   'k',  's'     )    "{k} devient [s]
call s:amap(   'K',  'S'     )    "{h} devient [S]
" Pour remapper {n}:
"   {n} devient [m] et {N} devient [M]
"   {m} devient [ç] et {M} devient [L] (pour rester proche de {H} et {L})
call s:amap(   'm',  'n'     )    "{n} devient [m]
call s:amap(   'M',  'N'     )    "{N} devient [M]
call s:amap(  'gm', 'gn'     )    "on préserve les variantes avec 'g'
call s:amap(  'gM', 'gN'     )    "on préserve les variantes avec 'g'
call s:amap(   'L',  'M'     )    "{M} devient [L]
call s:amap(   'ç',  'm'     )    "{m} devient [ç]

" Remapping additionel pour faciliter les actions
call s:amap(   'gb', 'gT'    )    "le couple [gb]/[gé] agit sur les tabs
call s:amap(   'gé', 'gt'    )    "le couple [gb]/[gé] agit sur les tabs
call s:amap(   'gB', ':execute "silent! tabfirst"<CR>'   )    "[gB] va au premier tab
call s:amap(   'gÉ', ':execute "silent! tablast"<CR> '   )    "[gÉ] au dernier
call s:amap(   'gT', '<C-]>' )    "[gT] est libéré et peut agir sur les tags
call s:amap(   '«',  '<'     )    "[<] est moins accessible que [«]
call s:amap(   '»',  '>'     )    "idem pour [»] et [>]
call s:amap(   ';',  ','     )    "idem pour [,] et [;]
call s:amap(   ',',  ';'     )    "qui sont permutés
call s:amap(  'g,',  'g;'    )    "idem pour [g,] et [g;]
call s:amap(  'g;',  'g,'    )    "qui sont permutés
call s:amap(   'é',  'w'     )    "[w] est peu accessible, on utilise [é]
call s:amap(   'É',  'W'     )    "idem pour [W] et [É]
call s:tomap( 'aé',  'aw'    )    "idem pour [aw] et [aé]
call s:tomap( 'aÉ',  'aW'    )    "idem pour [aW] et [aÉ]
call s:tomap( 'ié',  'iw'    )    "idem pour [iw] et [ié]
call s:tomap( 'iÉ',  'iW'    )    "idem pour [iW] et [iÉ]
call s:amap(  'wt', '<C-w>h' )    "on map [w]+direction
call s:amap(  'ws', '<C-w>j' )    "on map [w]+direction
call s:amap(  'wr', '<C-w>k' )    "on map [w]+direction
call s:amap(  'wn', '<C-w>l' )    "on map [w]+direction
call s:amap(  'wT', '<C-w>H' )    "idem pour les majuscules
call s:amap(  'wS', '<C-w>J' )    "idem pour les majuscules
call s:amap(  'wR', '<C-w>K' )    "idem pour les majuscules
call s:amap(  'wN', '<C-w>L' )    "idem pour les majuscules
call s:amap(  'wh', '<C-w>s' )    "crée un split _h_orizontal
call s:amap(  'wé', '<C-w>t' )    "va en haut à gauche
call s:amap(  'wÉ', '<C-w>T' )    "déplace sur un nouveau tab
call s:amap(   'w',  '<C-w>' )    "[w] est libre pour faire <C-w>
call s:amap(   'W',  '<C-w><C-w>') "et [w] pour faire <C-w><C-w>
