(defun fib (n &optional (a 0) (b 1) (acc ()))
  (if (zerop n)
      (nreverse acc)
      (fib (1- n) b (+ a b) (cons a acc))))

(write-line "num:")
(finish-output)
(let ((x (read)))
 (format t "~D! is ~D" x (fib x)))
