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
(sqrt(3)-1)^3 = -10 + 6 sqrt(3) | 5/3 | 6.53841...×10^-2
(sqrt(3)-1)^4 = 28 - 16 sqrt(3) | 7/4 | 1.79492...×10^-2
(sqrt(3)-1)^5 = -76 + 44 sqrt(3) | 19/11 | 4.77808...×10^-3
(sqrt(3)-1)^6 = 208 - 120 sqrt(3) | 26/15 | 1.28253...×10^-3
(sqrt(3)-1)^7 = -568 + 328 sqrt(3)  | 71/41 | 3.43490...×10^-4
(sqrt(3)-1)^8 = 1552 - 896 sqrt(3) | 97/56 | 9.20496...×10^-5
(sqrt(3)-1)^9 = -4240 + 2448 sqrt(3) | 265/153 | 2.46638...×10^-5
(sqrt(3)-1)^10 = 11584 - 6688 sqrt(3) | 362/209 | 6.60870...×10^-6
(sqrt(3)-1)^16 = 4817152 - 2781184 sqrt(3) | 18817/10864 | 2.44585...×10^-9
(sqrt(3)-1)^32 = 46409906716672 - 26794772135936 sqrt(3) | 708158977/408855776 | 1.72691...×10^-18

Cette suite est également connue, les numérateurs constituent la suite A002531 de l'OEIS et les dénominateurs la suite A002530.


 This work is licensed under CC BY 4.0.
 
