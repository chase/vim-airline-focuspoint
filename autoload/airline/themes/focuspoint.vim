let g:airline#themes#focuspoint#palette = {}

" First let's define some arrays. The s: is just a VimL thing for scoping the
" variables to the current script. Without this, these variables would be
" declared globally. Now let's declare some colors for normal mode and add it
" to the dictionary.  The array is in the format:
" [ guifg, guibg, ctermfg, ctermbg, opts ]. See "help attr-list" for valid
" values for the "opt" value.
let s:N1   = [ '#94FFAB' , '#3E804C' , 121  , 35 ]
let s:N2   = [ '#FFC66D' , '#293739' , 221 , 234 ]
let s:N3   = [ '#66797d' , '#202527' , 85  , 233 ]

let g:airline#themes#focuspoint#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Here we define overrides for when the buffer is modified.  This will be
" applied after g:airline#themes#focuspoint#palette.normal, hence why only certain keys are
" declared.
let g:airline#themes#focuspoint#palette.normal_modified = {
      \ 'airline_c': [ s:N1[0] , s:N3[1] , s:N1[2] , s:N3[3] , '' ] ,
      \ }

let s:I1 = [ '#F8F8F2' , '#4F9AB8' , 15  , 74  ]
let g:airline#themes#focuspoint#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
let g:airline#themes#focuspoint#palette.insert_modified = g:airline#themes#focuspoint#palette.normal_modified
let g:airline#themes#focuspoint#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0] , '#7E60B2' , s:I1[2] , 105 , ''] ,
      \ }

let g:airline#themes#focuspoint#palette.replace = copy(g:airline#themes#focuspoint#palette.insert)
let g:airline#themes#focuspoint#palette.replace.airline_a = [ '#EE9F9F' , '#BF3D3D' , 217 , 160 , '' ]
let g:airline#themes#focuspoint#palette.replace_modified = g:airline#themes#focuspoint#palette.normal_modified


let s:V1 = [ '#ffd28c', '#BD8F2E' , 222 , 172 ]
let g:airline#themes#focuspoint#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)
let g:airline#themes#focuspoint#palette.visual_modified = g:airline#themes#focuspoint#palette.normal_modified


let s:IA1 = [ '#4D5B5E' , s:N3[1] , 239 , 233 , '' ]
let s:IA2 = [ s:IA1[0] , '#232B2D' , 239 , 234 , '' ]
let s:IA3 = [ s:IA1[0] , '#263133' , 239 , 235 , '' ]
let g:airline#themes#focuspoint#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#focuspoint#palette.inactive_modified = {
      \ 'airline_c': [ '#5c976e' , '' , 71 , '' , '' ] ,
      \ }


" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#focuspoint#palette.accents = {
      \ 'red': [ '#D66565' , '' , 167 , ''  ]
      \ }


" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if get(g:, 'loaded_ctrlp', 0)
  let g:airline#themes#focuspoint#palette.ctrlp = copy(g:airline#themes#focuspoint#palette.normal)
endif

finish
