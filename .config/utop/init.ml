(* Configure UTop history file to follow XDG Base Directory Specifications. *)
let open Unix in
let concat = Filename.concat in
let xdg_state_home = try getenv "XDG_STATE_HOME" with
  | Not_found -> concat (concat (getenv "HOME") ".local") "state" in
let utop_state_home = concat xdg_state_home "utop" in
let utop_history_file_name = concat utop_state_home "history" in
try mkdir utop_state_home 0o755 with Unix_error (EEXIST, _, _) -> ();
UTop.history_file_name := Some utop_history_file_name;;

(* Use vi mode. *)
#edit_mode_vi;;

(* vim: set filetype=ocaml foldmethod=marker foldlevel=0 nowrap: *)
