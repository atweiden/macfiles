(fn mkdir-p [dir force]
  (let [input "\"%s\" does not exist. Create? [y/N] " ]
    (when (and (and (and (not (string.match dir "^%w+:"))
                         (not (vim.fn.isdirectory dir)))
                    (= vim.bo.buftype ""))
               (or force
                   (let [char (string.char (vim.fn.getchar))]
                     (or (= char :y) (= char :Y)))))
      (vim.fn.mkdir (vim.fn.iconv dir vim.o.encoding vim.o.termencoding) :p))))
