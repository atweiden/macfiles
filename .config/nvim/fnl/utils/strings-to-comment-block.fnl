(fn strings-to-comment-block [strings n]
  (let [comment-lines (accumulate [comment-lines [] _ v (ipairs strings)]
                        (let [line (.. (string.rep " " n) v)
                              line (string.format vim.bo.commentstring line)]
                          (table.insert comment-lines line) comment-lines))]
    (table.concat comment-lines "\n")))
