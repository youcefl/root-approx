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
The method described for the approximation of $\sqrt[3]{2}$ in the previous section can be generalized as follows. Let a be a positive integer such that there exists no integer b such that $b^{n} = a$, we wish to approximate $\sqrt[n]{a}$. Suppose we have computed the integer n-th root of a, i.e. $\lfloor \sqrt[n]{a} \rfloor$, we call it d. The minimal polynomial of $\sqrt[n]{a}$ over $\mathbb{Q}$ is $X^{n} - a$, hence the algebraic extension $\mathbb{Q}(\sqrt[n]{a})$ of $\mathbb{Q}$ is of degree n, it is a $\mathbb{Q}$-vector space of dimension n, of which a basis is $(1, \sqrt[n]{a}, (\sqrt[n]{a})^{2}, \dots, (\sqrt[n]{a})^{n-1})$. Hence for each $m \in \mathbb{N}$, $(\sqrt[n]{a}-d)^m$ can be written as $a_0 + a_1\cdot\sqrt[n]{a} + a_2\cdot(\sqrt[n]{a})^2 + \dots + a_{n-1}\cdot(\sqrt[n]{a})^(n-1)$ which is the value taken by the polynomial $P_m(X) = a_0 + a_1X + \dots + a_{n-1}X^{n-1}$ at $\sqrt[n]{a}$, since $(\sqrt[n]{a}-d)^m$ converges to 0 as goes to infinity, we see that $\sqrt[n]{a}$ is getting closer and closer to one of the real roots of $P_m$ if such roots exist. Since the degree of $P_m$ is at most $n-1$, it ensues that for $n \leq 5$ finding the roots of $P_m$ is done by solving an algebraic equation of degree less than or equal to 4, which we know can be done in radicals. Thus finding the roots of $P_m$ yields an approximation of $\sqrt[n]{a}$ by an expression containing radicals of order at most n-1, by repeating this whole process for the (possibly) nested radicals one derives a fraction approximating $\sqrt[n]{a}$. Several points can be noted:
 * computing the polynomial $P_m$ is equivalent to reducing $(X - d)^m$ in $\mathbb{Q}[X]/(X^{n}-a)$
 * the whole process can be done with d = $\lceil \sqrt[n]{a} \rceil$ since we only need $\lvert\sqrt[n]{a}-d\rvert \lt 1$. Actually $a$ does not need to be an integer, it can be any rational, also $d$ does not have to be either $\lfloor \sqrt[n]{a} \rfloor$ or $\lceil \sqrt[n]{a} \rceil$, in fact d can be any rational number d such that $\lvert\sqrt[n]{a}-d\rvert \lt 1$.
 * Regarding the polynomials since we are actually working in $\mathbb{Q}[X]/(X^{n}-a)$, $P_m$ will not produce a useful approximation until m >= n.

### Additional examples

Let us treat the case of $\sqrt[5]{2}$, here obviously $d = 1$, the polynomial is $(X-1)^{5}\ mod\ (X^{5}-2) = -5\cdot X^{4} + 10\cdot X^{3} - 10\cdot X^{2} + 5\cdot X + 1$, it has two non-complex roots: 
<p align="center"><img src="https://latex.codecogs.com/svg.image?\frac{1}{10}(5\pm\sqrt{5(6\sqrt{5}-5)})"/></p>

The positive root yields
<p align="center"><img src="https://latex.codecogs.com/svg.image?\sqrt[5]{2}\approx\frac{1}{10}(5+\sqrt{5(6\sqrt{5}-5)})"/></p>

with a precision of 8.35319e-6.



Authored by Youcef Lemsafer. This work is licensed under CC BY 4.0.
 
