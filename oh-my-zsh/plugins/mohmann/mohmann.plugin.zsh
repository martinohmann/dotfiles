s() { cd ~/Studium/current_sem/$1; }
_s() { _files -W ~/Studium/current_sem -/; }
compdef _s s 

web() { cd ~/Workspaces/Web/$1; }
_web() { _files -W ~/Workspaces/Web -/; } 
compdef _web web
