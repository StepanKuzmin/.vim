" Use Fira Code
set macligatures
set guifont=Fira\ Code:h12

if has("gui_macvim")
  " Disable print on cmd+p
  macmenu File.Print key=<nop>

  " disable os x search dialog
  macmenu &Edit.Find.Find\.\.\. key=<nop>
  map <D-f> :Ack<Space>
  imap <D-f> <Esc>:Ack<Space>
endif
