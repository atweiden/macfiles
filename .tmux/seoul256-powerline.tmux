set -g status "on"
set -g status-style bg=colour233,none
set -g status-justify "left"
set -g status-left-length "100"
set -g status-left-style none
set -g status-left "#[fg=colour233,bg=colour109] #S #[fg=colour109,bg=colour233,nobold,nounderscore,noitalics]"
set -g status-right-length "100"
set -g status-right-style none
set -g status-right "#[fg=colour239,bg=colour233,nobold,nounderscore,noitalics]#[fg=colour253,bg=colour239] %Y-%m-%d  %H:%M #[fg=colour109,bg=colour239,nobold,nounderscore,noitalics]#[fg=colour239,bg=colour109]#(battery) "
set -g pane-border-style fg=colour239
set -g pane-active-border-style fg=colour109
set -g message-style bg=colour109,fg=colour233
set -g message-command-style fg=colour233,bg=colour109
setw -g window-status-style fg=colour109,none,bg=colour233
setw -g window-status-activity-style bg=colour233,none,fg=colour109
setw -g window-status-format "#[fg=colour109,bg=colour233] #I #[fg=colour109,bg=colour233] #W "
setw -g window-status-current-format "#[fg=colour233,bg=colour109,nobold,nounderscore,noitalics]#[fg=colour252,bg=colour109] #I #[fg=colour233,bg=colour109,nobold,nounderscore,noitalics]#[fg=colour233,bg=colour109] #W #[fg=colour109,bg=colour233,nobold,nounderscore,noitalics]"
setw -g window-status-separator ""

# seoul256 copy mode colors
setw -g mode-style fg="#000000",bg="#87d7d7"
