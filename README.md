# Approximations of n-th root of integers ($2 \leq n \leq 5$)

I present a way to find fractions that are as close as one wants to a real number of the form $\sqrt[n]{a}$ where $a$ and $n$ are integers with $a$ greater than 1 and $2 \leq n \leq 5$.
The main idea stems from the following observation: since $\lvert\sqrt{2} - 1\rvert < 1$ the sequence $u_m = (\sqrt{2} - 1)^m$ goes to zero as $m \to \infty$, since $u_m$ is
of the form $a_m - b_m\sqrt{2}$, we derive a sequence of rational numbers $r_m = a_m/b_m$ which converges to $\sqrt{2}$. Of course this is already known and one can find the sequences $(a_m)$ and $(b_m)$ on the [OEIS (Online Encyclopedia of Integer Sequences)](https://oeis.org/), $(a_m)$ is [A001333](https://oeis.org/A001333), $(b_m)$ is [A000129)]((https://oeis.org/A000129)).
Another known example is the approximation of  $\sqrt{3}$ (see [A026150](https://oeis.org/A026150) and [A002605](https://oeis.org/A002605)).
Below we will see that this can be generalized to cube, 4-th and 5-th roots with a slight adptation.


L'idée de base part de la constatation suivante: u_m = (sqrt(2) - 1)^m -> 0 lorsque m -> {infini}, ce nombre étant de la forme a_m - b_m*sqrt(2)
on en déduit une suite de rationnels r_m=a_m/b_m qui converge vers sqrt(2). Ce qui peut se généraliser de la façon suivante : 
(sqrt(a) - isqrt(a))^m -> 0, où isqrt(a) est la racine carrée entière de a, donne une suite de rationnels qui converge vers sqrt(a).
A titre d'exemple considérons le cas de sqrt(3), nous avons (sqrt(3)-1)² = 4-2sqrt(3), (sqrt(3)-1)^3 = -10+6sqrt(3), (sqrt(3)-1)^4 = 28-16sqrt(3),
(sqrt(3)-1)^5 = -76+44sqrt(3), (sqrt(3)-3)^6 = 208-120sqrt(3), ce qui donne les fractions 2 (0.2679), 5/3 (0.065), 7/4 (0.0179), 19/11 (0.004778), 26/15 (0.00128),
chacune d'elle étant suivie de l'écart approximatif avec sqrt(3).
Ce procédé est généralisée aux racines cubiques, quatrièmes et cinquièmes par une méthode décrite dans l'article. Nous retrouvons ainsi des approximations connues de le racine cubique
de 2 comme 63/50 ou 635/504 et d'autres qui ne semblent pas connues comme 790/627 ou 97/77, un sous-produit de cette méthode consiste en des approximations de racine n-ièmes
par des expressions contenant des racines d'ordre au plus n-1.



 This work is licensed under CC BY 4.0.
 
