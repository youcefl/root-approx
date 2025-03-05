# Approximations of n-th root of integers ($2 \leq n \leq 5$) using algebraic methods

I present a way to find fractions that are as close as desired to a real number of the form $\sqrt[n]{a}$ where $a$ and $n$ are integers with $a$ greater than 1 and $2 \leq n \leq 5$. The main idea stems from the following observation: since $\lvert\sqrt{2} - 1\rvert < 1$ the sequence $u_m = (\sqrt{2} - 1)^m$ goes to zero as $m \to \infty$, since $u_m$ is of the form $a_m - b_m\sqrt{2}$, we derive a sequence of rational numbers $r_m = a_m/b_m$ which converges to $\sqrt{2}$. Of course this is already known and one can find the sequences $(a_m)$ and $(b_m)$ on the [OEIS (Online Encyclopedia of Integer Sequences)](https://oeis.org/), $(a_m)$ is [A001333](https://oeis.org/A001333), $(b_m)$ is [A000129](https://oeis.org/A000129). Another known example is the approximation of  $\sqrt{3}$ (see [A026150](https://oeis.org/A026150) and [A002605](https://oeis.org/A002605)).  
Below we will see that this can be generalized to cube, 4-th and 5-th roots with a slight adptation. Expressions approximating $\sqrt[3]{2}$ are derived, some are already known such as $63/50$ and $635/504$, some are less current such as $97/77$ and $790/627$, a byproduct of this method is the ability to find expressions approximating n-th root of integers while containing radicals of order at most $n-1$.  

## Approximation of square roots

Let $a$ be an integer $\geq 2$, we suppose that a is not a perfect square, to construct a sequence converging to $\sqrt{a}$, we start by finding $\left\lfloor \sqrt{a} \right\rfloor$ i.e. the integer square root of a, we denote it by r (there are several ways to find the integer square root of a number, one can use Heron's method for example). Since $\lvert\sqrt{a} - r\rvert \lt 1$, the sequence $(\sqrt{a}-r)^m$ converges to 0 as $m \to \infty$, also $(\sqrt{a}-r)^m = u_m - v_m\sqrt{a}$ where $(u_m)$ and $(v_m)$ are integer sequences (can be seen by using the binomial theorem and noticing that $\sqrt{a}^{2k} = a^{k}$ and $\sqrt{a}^{2k+1} = a^{k}\sqrt{a}$), it follows that the sequence $(u_m/v_m)$ converges to $\sqrt{a}$ as $m \to \infty$. The convergence can be sped up by taking the square of the previous iteration result, which is the same as using the sequence $(\sqrt{a}-d)^{2^{n}}$.  
  
Here are a few examples:

|a|n|$(\sqrt{a}-1)^n$| approximant | precision |
|-|-|----------------|-------------|-----------|
|2|2|$3-2\sqrt{2}$| $3/2$ | $8.57864\cdot10^{-2}$|
|2|3|$-7+5\sqrt{2}$| $7/5$ | $1.42136\cdot10^{-2}$|
|2|4|$17-12\sqrt{2}$ | $17/12$ | $2.45310\cdot10^{-3}$|
|2|5|$41+29\sqrt{2}$ | $41/29$ | $4.20459\cdot10^{-4}$|
|2|6|$99-70\sqrt{2}$ | $99/70$ | $7.21519\cdot10^{-5}$|
|2|7|$-239+169\sqrt{2}$ | $239/169$ | $1.23789\cdot10^{-5}$|
|2|8|$577-408\sqrt{2}$ | $577/408$ | $2.12390\cdot10^{-6}$|
|2|9|$-1393+985\sqrt{2}$ | $1393/985$ | $3.64404\cdot10^{-7}$|
|2|10|$3363-2378\sqrt{2}$ | $3363/2378$ | $6.25218\cdot10^{-8}$|
|2|16|$665857 - 470832\sqrt{2}$ | $665857/470832$ | $1.59486\cdot10^{-12}$|
|2|32|$886731088897 - 627013566048\sqrt{2}$ | $886731088897/627013566048$ | $8.99293\cdot10^{-25}$|
|3|2|$4 - 2\sqrt{3}$ | $2$ | $2.67949\cdot10^{-1}$|
|3|3|$-10 + 6\sqrt{3}$ | $5/3$ | $6.53841\cdot10^{-2}$|
|3|4|$28 - 16\sqrt{3}$ | $7/4$ | $1.79492\cdot10^{-2}$|
|3|5|$-76 + 44\sqrt{3}$ | $19/11$ | $4.77808\cdot10^{-3}$|
|3|6|$208 - 120\sqrt{3}$ | $26/15$ | $1.28253\cdot10^{-3}$|
|3|7|$-568 + 328\sqrt{3}$  | $71/41$ | $3.43490\cdot10^{-4}$|
|3|8|$1552 - 896\sqrt{3}$ | $97/56$ | $9.20496\cdot10^{-5}$|
|3|9|$-4240 + 2448\sqrt{3}$ | $265/153$ | $2.46638\cdot10^{-5}$|
|3|10|$11584 - 6688\sqrt{3}$ | $362/209$ | $6.60870\cdot10^{-6}$|
|3|16|$4817152 - 2781184\sqrt{3}$ | $18817/10864$ | $2.44585\cdot10^{-9}$|
|3|32|$46409906716672 - 26794772135936\sqrt{3}$ | $708158977/408855776$ | $1.72691\cdot10^{-18}$|

Note that the sequence of numerators for the approximation of $\sqrt{3}$ is [A002531](https://oeis.org/A002531) and the sequence of denominators is [A002530](https://oeis.org/A002530).

## Approximation of $\sqrt[3]{2}$

If we try to apply the same method for approximating $\sqrt[3]{2} = 2^{\frac{1}{3}}$, we get $(\sqrt[3]{2}-1)^{2} = 1+2^{2/3}-2\cdot2^{1/3}$ from which we can not derive an approximation as we did in the case of square roots because in addition to $2^{1/3}$ there is the term $2^{2/3}$. However if we look at the expression $1+2^{2/3}-2\cdot2^{1/3}$ as being the evaluation at $X=2^{1/3}$ of the polynomial $P(X) = X^{2}-2X+1$, then if $P$ has real roots one of them has to be close to $2^{1/3}$. In this case P has $1$ as unique real root (with multiplicity 2), so the approximation we get is $2^{1/3} \approx 1$, which is not really interesting. Let us see what we get if we move to exponent 3: $(2^{1/3}-1)^{3} = (1+2^{2/3}-2\cdot2^{1/3})(2^{1/3}-1) = 1 + 3\cdot2^{1/3} - 3\cdot2^{2/3}$ which is the value of $P(X) = -3X^{2}+3X+1$ at $X=\sqrt[3]{2}$, now $P$ has the roots $(3 \pm \sqrt{21})/6$, which produces the approximation
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[3]{2}%20\approx%20\frac{3%20+%20\sqrt{21}}{6}"/></p>

with precision $3.84e-3$. This approximant of $\sqrt[3]{2}$ contains a square root on which we can apply the method described in the previous section: we have $(\sqrt{21}-5)^{2} = 46-10\sqrt{21}$ hence $\sqrt{21} \approx 23/5$ from which we deduce the approximation
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[3]{2}%20\approx%20\frac{19}{15}"/></p>

with precision $6.7456e-3$.<br>
With exponent 4: $(2^{1/3}-1)^{4} = (1 + 3\cdot2^{1/3} - 3\cdot2^{2/3})(2^{1/3}-1) = -7 - 2\cdot2^{1/3} + 6\cdot2^{2/3}$, the polynomial is now $P(X) = 6X^{2}-2X-7$, the roots of P are $(1 \pm \sqrt{43})/6$. The positive root yields
<p align="center"><img src="https://latex.codecogs.com/svg.image?2^{\frac{1}{3}}%20\approx%20\frac{1%20+%20\sqrt{43}}{6}"/></p>

the precision being $3.47963e-4$. By approximating $\sqrt{43}$ we get
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[3]{2}%20\approx%2091/72\quad(3.96784e-3)"/></p>
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[3]{2}%20\approx%201141/906\quad(5.39151e-4)"/></p>
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[3]{2}%20\approx%2014329/11376\quad(3.39475e-4)"/></p>

where each approximation is followed by its precision between parenthesis. Below is a table giving the approximations that can be obtained with next few exponents

|n|Polynomial|Approximant|Precision|
|-|----------|-----------|---------|
|$5$|$-8X^{2}-5X+19$|$\frac{\sqrt{633}-5}{16}$|$4.71533e-5$|
|||$\frac{5}{4}$|$9.92105e-3$|
|||$\frac{63}{50}$|$7.89501e-5$|
|||$\frac{790}{627}$|$4.70522e-5$| 
|||$\frac{19813}{15725}$|$4.71536e-5$|
|$6$|$3X^{2}+24X-35$|$\sqrt{\frac{83}{3}}-4$|$9.77054e-6$|
|||$1$|$2.59921e-1$|
|||$\frac{19}{15}$|$6.74562e-3$|
|||$\frac{97}{77}$|$1.80790e-4$|
|||$\frac{1493}{1185}$|$5.43808e-6$|
|||$\frac{7659}{6079}$|$9.88029e-6$|
|||$\frac{117871}{93555}$|$9.76776e-6$|

## Approximation of n-th roots ($2 \leq n \leq 5$)

### General principle
The method described for the approximation of $\sqrt[3]{2}$ in the previous section can be generalized as follows. Let a be a positive integer such that there exists no integer b such that $b^{n} = a$, we wish to approximate $\sqrt[n]{a}$. Suppose we have computed the integer n-th root of a, i.e. $\lfloor \sqrt[n]{a} \rfloor$, we call it d. The minimal polynomial of $\sqrt[n]{a}$ over $\mathbb{Q}$ is $X^{n} - a$, hence the algebraic extension $\mathbb{Q}(\sqrt[n]{a})$ of $\mathbb{Q}$ is of degree n, it is a $\mathbb{Q}$-vector space of dimension n, of which a basis is $(1, \sqrt[n]{a}, (\sqrt[n]{a})^{2}, \dots, (\sqrt[n]{a})^{n-1})$. Hence for each $m \in \mathbb{N}$, $(\sqrt[n]{a}-d)^m$ can be written as $a_0 + a_1\cdot\sqrt[n]{a} + a_2\cdot(\sqrt[n]{a})^2 + \dots + a_{n-1}\cdot(\sqrt[n]{a})^{n-1}$ which is the value taken by the polynomial $P_m(X) = a_0 + a_1X + \dots + a_{n-1}X^{n-1}$ at $\sqrt[n]{a}$, since $(\sqrt[n]{a}-d)^m$ converges to $0$ as $m$ goes to infinity, we see that $\sqrt[n]{a}$ is getting closer and closer to one of the real roots of $P_m$ if such roots exist. Since the degree of $P_m$ is at most $n-1$, it ensues that for $n \leq 5$ finding the roots of $P_m$ is done by solving an algebraic equation of degree less than or equal to 4, which we know can be done in radicals. Thus finding the roots of $P_m$ yields an approximation of $\sqrt[n]{a}$ by an expression containing radicals of order at most n-1, by repeating this whole process for the (possibly) nested radicals one derives a fraction approximating $\sqrt[n]{a}$. Several points can be noted:
 * computing the polynomial $P_m$ is equivalent to reducing $(X - d)^m$ in $\mathbb{Q}[X]/(X^{n}-a)$
 * the whole process can be done with d = $\lceil \sqrt[n]{a} \rceil$ since we only need $\lvert\sqrt[n]{a}-d\rvert \lt 1$. Actually $a$ does not need to be an integer, it can be any rational, also $d$ does not have to be either $\lfloor \sqrt[n]{a} \rfloor$ or $\lceil \sqrt[n]{a} \rceil$, in fact $d$ can be any rational number $q$ such that $\lvert\sqrt[n]{a}-q\rvert \lt 1$.
 * Regarding the polynomials since we are actually working in $\mathbb{Q}[X]/(X^{n}-a)$, $P_m$ will not produce a useful approximation until m >= n.

### Additional examples

Let us treat the case of $\sqrt[5]{2}$, here obviously $d = 1$, the polynomial is $(X-1)^{5}\ mod\ (X^{5}-2) = -5\cdot X^{4} + 10\cdot X^{3} - 10\cdot X^{2} + 5\cdot X + 1$, it has two non-complex roots: 
<p align="center"><img src="https://latex.codecogs.com/svg.image?\frac{1}{10}(5\pm\sqrt{5(6\sqrt{5}-5)})"/></p>

The positive root yields
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[5]{2}\approx\frac{1}{10}(5+\sqrt{5(6\sqrt{5}-5)})\qquad(1)"/></p>

with a precision of 8.35319e-6. If we replace $\sqrt{5}$ by its integer part we get
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[5]{2}\approx\frac{1}{10}(5+\sqrt{35})\quad\textit{(5.70904e-2)}"/></p>

If we replace $\sqrt{35}$ by its approximations 6 and $\frac{65}{11}$ we get
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[5]{2}\approx\frac{11}{10}\quad\textit{(4.86984e-2)}"/></p>
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[5]{2}\approx\frac{12}{11}\quad\textit{(5.77893e-2)}"/></p>

If we proceed with a more precise approximation of $\sqrt{5}$ such as $9/4$ we get
<p align="center"><img src="https://latex.codecogs.com/svg.image?\frac{1}{10}(5+\sqrt{5(6\sqrt{5}-5)})\approx\frac{1}{10}(5+\sqrt{5(\frac{6\cdot9}{4}-5)})=\frac{1}{10}(5+\sqrt{\frac{85}{2}})"/></p>

To get an approximation of $\sqrt{85/2}$, it is enough to compute $(\sqrt{85/2} - 6)^{2} = (157-24\sqrt{85/2})/2$ which gives us $\sqrt{85/2}\approx157/24\quad\textit{(2.24643e-2)}$ from which we derive
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[5]{2}\approx\frac{1}{10}(5+\frac{157}{24})=\frac{277}{240}\quad\textit{(5.46831e-3)}"/></p>

If we repeat this process with approximations of $\sqrt{5}$ that are more and more precise we can get closer and closer to the precision of (1).
The appendices contains a table which reproduces these results and extends them.

### Automated generation of the approximations

I wrote a [PARI/GP](https://pari.math.u-bordeaux.fr/) script which can generate this kind of approximations. It is based on the principles described in this page. To invoke the script, start by installing PARI/GP, run it and then call function
```
$ proximar.gp 3 5
```
which will output approximations of $\sqrt[3]{5}$. Here is what the output looks like:
```

```


## Appendices

### Approximation of $\sqrt[3]{2}$

|n|Polynomial|Approximations|Precision|
|-|----------|-----------|---------|
|3 | $-3X^{2} + 3X + 1$ | (3+sqrt(21))/6 | 3.841566 e-3|
||| 4/3 | 7.341228 e-2|
||| 19/15 | 6.745617 e-3|
||| 91/72 | 3.967839 e-3|
||| 436/345 | 3.847066 e-3|
||| 2089/1653 | 3.841806 e-3|
||| 10009/7920 | 3.841576 e-3|
|4 | 6*X^2 - 2*X - 7 | (1+sqrt(43))/6 | 3.479625 e-4|
||| 4/3 | 7.341228 e-2|
||| 53/42 | 1.983712 e-3|
||| 359/285 | 2.719271 e-4|
||| 4867/3864 | 3.454805 e-4|
||| 32992/26193 | 3.478815 e-4|
||| 447287/355110 | 3.479599 e-4|
|5 | $-8X^{2} - 5X + 19$ | (-5+sqrt(633))/16 | 4.715328 e-5|
||| 5/4 | 9.921050 e-3|
||| 63/50 | 7.895011 e-5|
||| 790/627 | 4.705218 e-5|
||| 19813/15725 | 4.715360 e-5|
||| 496905/394379 | 4.715328 e-5|
||| 12462251/9890925 | 4.715328 e-5|
|6 | $3X^{2} + 24*X - 35$ | (-12+sqrt(249))/3 | 9.770542 e-6|
||| 4/3 | 7.341228 e-2|
||| 121/96 | 4.956168 e-4|
||| 3844/3051 | 6.267856 e-6|
||| 122161/96960 | 9.746265 e-6|
||| 3882244/3081363 | 9.770373 e-6|
||| 123376681/97924896 | 9.770541 e-6|
|7 | $21X^{2} - 59X + 41$ | (59-sqrt(37))/42 | 1.317557 e-5|
||| 53/42 | 1.983712 e-3|
||| 635/504 | 4.149742 e-7|
||| 7673/6090 | 1.326866 e-5|
||| 92711/73584 | 1.317494 e-5|
||| 1120205/889098 | 1.317558 e-5|
||| 13535171/10742760 | 1.317557 e-5|
|8 | $-80X^{2} + 100X + 1$ | (25+sqrt(645))/40 | 2.050651 e-7|
||| 5/4 | 9.921050 e-3|
||| 63/50 | 7.895011 e-5|
||| 635/504 | 4.149742 e-7|
||| 16001/12700 | 2.099476 e-7|
||| 20160/16001 | 2.050267 e-7|
||| 2032001/1612800 | 2.050654 e-7|
|9 | $180X^{2} - 99X - 161$ | (33+sqrt(13969))/120 | 1.527106 e-8|
||| 151/120 | 1.587717 e-3|
||| 35681/28320 | 1.266489 e-6|
||| 8427511/6688920 | 1.630500 e-8|
||| 1990498241/1579859520 | 1.527023 e-8|
||| 470136822871/373147848120 | 1.527106 e-8|
||| 111041862618401/88133985834720 | 1.527106 e-8|
|10 | $-279X^{2} - 62X + 521$ | (-31+4*sqrt(9145))/279 | 1.839639 e-9|
||| 353/279 | 5.311925 e-3|
||| 16873/13392 | 1.025238 e-5|
||| 12933401/10265247 | 2.165850 e-8|
||| 619605265/491781024 | 1.877958 e-9|
||| 474938572049/376958993895 | 1.839713 e-9|
||| 22753059484537/18059115254256 | 1.839639 e-9|

### Approximation of $\sqrt[3]{3}$

|  n   |  Polynomial      | Approximations                                    | Precision
|------|------------------|---------------------------------------------------|-------------------------------------------
|  1   |  $X - 1$         | 1                                                 | 4.42250e-1
|  3   |  $-3X^{2}+3X+2$  | $(1 + \sqrt{11/3})/2$                             | 1.51775e-2
|      |                  | $3/2$ ($\sqrt{11/3} \approx 2$)                   | 5.77504e-2
|      |                  | $4/3$ ($\sqrt{11/3} \approx 5/3$)                 | 1.08916e-1
|      |                  | $22/15$ ($\sqrt{11/3} \approx 29/15$)             | 2.44171e-2
|      |                  | $118/81$ ($\sqrt{11/3} \approx 115/81$)           | 1.45406e-2
|      |                  | $634/435$ ($\sqrt{11/3} \approx 833/435$)         | 1.52217e-2
|  4   | $6X^{2}-X-11$    | $(1 + \sqrt{265})/12$                             | 2.34785e-3
|      |                  | $17/12$ ($\sqrt{265} \approx 16$)                 | 2.55829e-2
|      |                  | $553/384$ ($\sqrt{265} \approx 521/32$)           | 2.14540e-3
|      |                  | $17849/12396$ ($\sqrt{265} \approx 16816/1033$)   | 2.34960e-3
| 5    | $-7X^{2}-10X+29$ | $(2\sqrt{57} - 5)/7$                              | 5.60268e-4
|      |                  | $9/7$ ($\sqrt{57} \approx 7$)                     | 1.56535e-1
|      |                  | $71/49$ ($\sqrt{57} \approx 53/7$)                | 6.73002e-3
|      |                  | $515/357$ ($\sqrt{57} \approx 385/51$)            | 3.27461e-4
|      |                  | $3747/2597$ ($\sqrt{57} \approx 2801/371$)        | 5.69067e-4
| 6    | $-3X^{2}+39X-50$ | $(13 - \sqrt{307/3})/2$                           | 2.46539e-4
|      |                  | $3/2$ ($\sqrt{307/3} \approx 10$)                  | 5.77504e-2
|      |                  | $173/120$ ($\sqrt{307/3} \approx 607/60$)         | 5.82904e-4
|      |                  | $3481/2414$ ($\sqrt{307/3} \approx 12210/1207$)   | 2.44599e-4
|      |                  | $210071/145680$ ($\sqrt{307/3} \approx 736849/72840$) | 2.46550e-4
| 7    | $42X^{2}-89X+41$ | $(89 + \sqrt{1033})/84$                           | 1.02935e-4
|      |                  | $121/84$ ($\sqrt{1033} \approx 32$)                 | 1.77338e-3
|      |                  | $7753/5376$ ($\sqrt{1033} \approx 2057/64$)         | 9.92727e-5
|      |                  | $497281/344820$ ($\sqrt{1033} \approx 131936/4105$) | 1.02943e-4
| 8    | $-131X^{2}+130X+85$ | $(65 + 32\sqrt{15})/131$                          | 5.90358e-6 
|      |                  | $193/131$ ($\sqrt{15} \approx 4$)                   | 3.10329e-2
|      |                  | $1319/917$ ($\sqrt{15} \approx 27/7$)               | 3.86353e-3
|      |                  | $189/131$ ($\sqrt{15} \approx 31/8$)                | 4.98521e-4
|      |                  | $10391/7205$ ($\sqrt{15} \approx 213/55$)           | 5.66487e-5
|      |                  | $5857/4061$ ($\sqrt{15} \approx 1921/496$)        | 6.03176e-6
|      |                  | $644081/446579$ ($\sqrt{15} \approx 13203/3409$)  | 5.88729e-6
|      |                  | $737793/511555$ ($\sqrt{15} \approx 15124/3905$)  | 5.90564e-6
| 9    | $261X^{2}-45X-478$   | $5/58 + \sqrt{55673}/174$                         | 9.14246e-7
|      |                  | $251/174$ ($\sqrt{55673}\approx236$)              | 2.79165e-4
|      |                  | $9829/6815$ ($\sqrt{55673}\approx55449/235$)                         | 1.01509e-5
|      |                  | $6943445/4814319$ ($\sqrt{55673}\approx13056835/55337$)              | 9.36596e-7
|      |                  | $1635012119/1133654805$ ($\sqrt{55673}\approx3074566513/13030515$)   | 9.14201e-7
|      |                  | $385005513805/266948082903$ ($\sqrt{55673}\approx723985496075/3068368769$)   | 9.14246e-7
| 10   | $-306X^{2}-433X+1261$ | $(\sqrt{1730953} - 433)/612$                      | 2.17536e-7
|      |                  | $49/34$ ($\sqrt{1730953}\approx1315$)                                  | 1.07310e-3
|      |                  | $883/612$ ($\sqrt{1730953}\approx1316$)                                | 5.60887e-4
|      |                  | $64483/44710$ ($\sqrt{1730953}\approx1730089/1315$)                    | 4.85608e-7
|      |                  | $331879/230112$ ($\sqrt{1730953}\approx494687/376$)                    | 2.90630e-7
|      |                  | $84816313/58808338$ ($\sqrt{1730953}\approx2275635115/1729657$)        | 2.17469e-7
|      |                  | $873391621/605575836$ ($\sqrt{1730953}\approx1301846420/989503$)       | 2.17546e-7
|      |                  | $111561308251/77352279190$ ($\sqrt{1730953}\approx2993207574673/2275067035$)        | 2.17536e-7
|      |                  | $328352437105/227666829888$ ($\sqrt{1730953}\approx489430439297/372004624$)       | 2.17536e-7
|      |                  | $146739760997281/101743652336866$ ($\sqrt{1730953}\approx3937051035064675/2992460362849$) | 2.17536e-7
|      |                  | $864110946941251/599140976982372$ ($\sqrt{1730953}\approx1288012978041524/978988524481$)  | 2.17536e-7

Between parenthesis are the approximations used for the square root appearing in the root of the polynomial.

### Approximation of $\sqrt{5}$

| Exponent of $\sqrt{5}-2$  |  Approximant  |  Precision
|---------------|--------------------------------|-----------------------
|  1            |  2                             |  2.36068e-1
|  2            |  9/4                           |  1.39320e-2
|  3            |  38/17                         |  7.73860e-4
|  4            |  161/72                        |  4.31336e-5
|  5            |  682/305                       |  2.40373e-6
|  6            |  2889/1292                     |  1.33955e-7
|  7            |  12238/5473                    |  7.46507e-9
|  8            |  51841/23184                   |  4.16014e-10
|  9            |  219602/98209                  |  2.31837e-11
|  10           |  930249/416020                 |  1.29198e-12


--------------------------------------------------------------------------------------------------------------------
Authored by Youcef Lemsafer. Creation date: 2025.02.20.

This work is licensed under CC BY 4.0.
 
