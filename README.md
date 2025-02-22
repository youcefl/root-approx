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


$X = 2^{5/7}$




This work is licensed under CC BY 4.0.
 
