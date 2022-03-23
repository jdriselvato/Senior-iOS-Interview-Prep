How Hacker News ranking algorithm works notes

Original article: https://medium.com/hacking-and-gonzo/how-hacker-news-ranking-algorithm-works-1d9b0cf2c08d

Written in Arc a dialect language of Lisp by Paul Graham. The same Paul Graham who co-founded Y-combinator. 

I didn't even know there was such things as dialects in programming languages.

"A dialect of a programming language is a (relatively small) variation or extension of the language that does not change its intrinsic nature."

---

### side tangent

I wanted to see what it would be like to write a few lines of lisp

```
brew install sbcl
```

or 

```
brew install clisp
```


Simple fib(n)

``` lisp

(defun fib (n &optional (a 0) (b 1) (acc ()))
  (if (zerop n)
      (nreverse acc)
      (fib (1- n) b (+ a b) (cons a acc))))

(write-line "num:")
(finish-output)
(let ((x (read)))
 (format t "~D! is ~D" x (fib x)))

```

and I have no interest in ever writting lisp ever again lol. I get the syntax but I don't like the syntax.

```

Terminal $ sbcl --script fib.lisp 
num:
10
10! is (0 1 1 2 3 5 8 13 21 34)

```

---

Hacker News' ranking algo formula:

```
Score = (P-1) / (T+2)^G

where,
P = points of an item (and -1 is to negate submitters vote)
T = time since submission (in hours)
G = Gravity, defaults to 1.8 in news.arc
```


## The effects of gravity (G) and time (T)

- score descrease as T increases
	- older items get lower scores
- score decreases faster for older items if gravity is increased

## swift implimentation

```
import Foundation

func calcScore(votes: Double, hours: Double, gravity: Double = 1.8) -> Double {
    return (votes-1) / pow(hours+2, gravity)
}

let c = calcScore(votes: 1000, hours: 0.3)
print(c)
```

+2 because 1^x = 1

score = \frac{(p-1)}{(t+2)^g}


<img src="https://render.githubusercontent.com/render/math?math=score = \frac{(p-1)}{(t+2)^g}">


---

Trying to get the latex formula to work on github, made me ask the qestion:

github vs gitlab

https://www.quora.com/What-are-all-the-differences-between-Git-and-GitHub-and-Gitlab
