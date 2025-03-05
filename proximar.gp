/*
 * Author: Youcef Lemsafer
 * Creation date: 2025.02.23
 */


/*
 */
is_rational(x) = {
    return((type(x) == "t_FRAC") || (type(x) == "t_INT"));
}


/*
 */
removeCommonFactors(x,y,s) = {
   my(commonDivForN = gcd(gcd(abs(numerator(x)), abs(numerator(y))), abs(numerator(s))));
   my(commonDivForD= gcd(gcd(abs(denominator(x)), abs(denominator(y))), abs(denominator(s))));
   return([x*commonDivForD/commonDivForN, y*commonDivForD/commonDivForN, s*commonDivForD/commonDivForN]);
}


/* Returns an array of two rationals A such that x^(1/n) = A[1] * (A[2])^(1/n)
*  where A[2] has nth-power-free numerator and denominator. */
simplifyNthRoot(n, x) = {
    my(res = [1, 1]);
    my(factorz = factor(x, 2^18));
    for(i = 1, matsize(factorz)[1],
        my(expSign = [-1, 1][(factorz[i, 2] > 0) + 1]);
        res[1] = res[1] * factorz[i, 1] ^ ((abs(factorz[i, 2]) \ n) * expSign);
        res[2] = res[2] * factorz[i, 1] ^ ((abs(factorz[i, 2]) % n) * expSign);
    );
    return(res);
}


/* Returns an array of two rationals such that sqrt(x) = A[1] * sqrt(A[2])
*  where A[2] has square-free numerator and denominator. */
simplifySqrt(x) = {
    return (simplifyNthRoot(2, x));
}


/* Finds the real root that is the closest to given approx
 * returns an empty array if there is no real root
 * otherwise returns an array containing the root found, followed by
 * its string representation, followed by an array [p, q, r, s] such that
 * the found root is (p + q * sqrt(r)) / s.
 */
findDegree2PolyRoot(P, approx) = {
    my(discrim = polcoef(P, 1)^2 - 4 * polcoef(P, 0) * polcoef(P, 2));
    if(discrim < 0,
        return([]);
    );
    my(candPlus = (-polcoef(P, 1) + sqrt(discrim))/(2 * polcoef(P, 2)));
    my(candMinus = (-polcoef(P, 1) - sqrt(discrim))/(2 * polcoef(P, 2)));
    my(operator);
    my(foundRoot);
    if(abs(candPlus - approx) < abs(candMinus - approx),
        operator = ["+", "-"][(polcoef(P, 2) < 0) + 1];
        foundRoot = candPlus,
        operator = ["-", "+"][(polcoef(P, 2) < 0) + 1];
        foundRoot = candMinus;
    );
    my(simplifiedSqrt = simplifySqrt(discrim));
    my(rootInfo = removeCommonFactors(-polcoef(P, 1), 2 * polcoef(P, 2), simplifiedSqrt[1]));
    my(k = sign(polcoef(P, 2)));
    my(foundRootAsStr = Str("(", k * rootInfo[1], operator,
            [Str(rootInfo[3], "*"), ""][(rootInfo[3] == 1) + 1],
                "sqrt(", simplifiedSqrt[2], "))/", k * rootInfo[2]));
    
    return([foundRoot, foundRootAsStr, [
        k * rootInfo[1], ([1, -1][(operator == "-") + 1]) * rootInfo[3], simplifiedSqrt[2], k * rootInfo[2]]]);
}


/* Finds the real root of given polynomial of degree 3.
 * Returns an empty array if there is more than one real root, otherwise
 * returns an array of four elements u, where u[1] is the root found,
 * u[2] its string representation, and u[3] is an array of 4 elements
 * [a, b, c, d] such that the root is
 * ((a + b * sqrt(c))/2)^(1/3) - ((-a + b * sqrt(c))/2)^(1/3) + d.
 */
findDegree3PolyRoot(P) = {
    my(t = polcoef(P, 2)/(3 * polcoef(P, 3)));
    my(K = subst(P, X, X - t));
    my(K = K / polcoef(K, 3));
    my(p = polcoef(K, 1));
    my(q = polcoef(K, 0));
    my(delta = 4 * (p ^ 3) + 27 * (q ^ 2));
    if((delta < 0) || ((delta == 0) && (p != 0)),
        return ([]);
      , my(simplifiedSqrt = simplifySqrt(delta / 27));
        my(r = simplifiedSqrt[1]);
        my(s = simplifiedSqrt[2]);
        my(approximant = -t + ((-q + r * sqrt(s))/2)^(1/3) - ((q + r * sqrt(s))/2)^(1/3));
        my(sqrtMult = [Str(r, "*"), ""][(r == 1) + 1]);
        my(approximantAsStr = Str(-t, " + ((", -q, " + ", sqrtMult, "sqrt(", s, "))/2)^(1/3) - ",
                                      "((",  q, " + ", sqrtMult, "sqrt(", s, "))/2)^(1/3)"));
        return ([approximant, approximantAsStr, [-q, r, s, -t]]);
    );
}


/*
 */
stringizeCubeRootTerm(termSign, k, s) = {
    if((s == 0) || (k == 0),
        return(""));
    if(s < 0,
        termSign = -termSign);
    if(k < 0,
        termSign = -termSign);
    res = [" + ", " - "][(termSign < 0) + 1];
    my(isCubeRootOfOne = abs(s) == 1);
    if(abs(k) != 1,
        res = Str(res, abs(k), ["*(", ""][isCubeRootOfOne + 1])
      , res = Str(res, ["(", ""][isCubeRootOfOne + 1])
    );
    if(!isCubeRootOfOne,
        res = Str(res, abs(s), ")^(1/3)"));
    
    return(res);
}


/**/
push(~L, v) = {
  	listput(L,v);
}


/**/
pop(~L) = {
  	listpop(L);
}


/*
 */
handleDegree3Poly(polyn, valueBeingApproximated, processApprox) = {
    /* Find degree 3 polynomial root */
    /* It is of the form t + (q+r1*sqrt(s1))^(1/3)- (-q+r2*sqrt(s2))^(1/3) */
    my(foundRootInfo = findDegree3PolyRoot(polyn));
    if(#foundRootInfo == 0,
        print("Failed to find needed root for ", polyn);
        return;
    );
    my(polynRoot = foundRootInfo[1]);
    processApprox([polynRoot, foundRootInfo[2], abs(valueBeingApproximated - polynRoot)]);
    /* Approximate the nested square root to derive new approximations */
    my(q = foundRootInfo[3][1], r = foundRootInfo[3][2],
       s = foundRootInfo[3][3], t = foundRootInfo[3][4]);
    do_approximate_nthroot(2, s, u -> [
        my(s1 = (q + r * u[1]) / 2, s2 = (-q + r * u[1]) / 2);
        my(ss1 = simplifyNthRoot(3, s1), ss2 = simplifyNthRoot(3, s2));
        my(z = t + sign(s1)*(abs(s1))^(1/3) - sign(s2)*(abs(s2))^(1/3));
        my(zStr);
        if(is_rational(z),
            zStr = Str(z), 
            zStr = Str(t, stringizeCubeRootTerm(1, ss1[1], ss1[2]), stringizeCubeRootTerm(-1, ss2[1], ss2[2]))
        );
        processApprox([z, zStr, abs(valueBeingApproximated - z)]);
        global(proximar_lsappr = List());
        push(~proximar_lsappr, [;]);
        push(~proximar_lsappr, [;]);
        do_approximate_nthroot(3, abs(ss1[2]), x -> [proximar_lsappr[#proximar_lsappr - 1] = matconcat([proximar_lsappr[#proximar_lsappr - 1]; x])], 4);
        do_approximate_nthroot(3, abs(ss2[2]), x -> [proximar_lsappr[#proximar_lsappr] = matconcat([proximar_lsappr[#proximar_lsappr]; x])], 4);
        my(j = 1);
        while((j <= matsize(proximar_lsappr[#proximar_lsappr - 1])[1]) || (j <= matsize(proximar_lsappr[#proximar_lsappr])[1]),
            my(s1apprIdx = min(matsize(proximar_lsappr[#proximar_lsappr - 1])[1], j));
            my(s2apprIdx = min(matsize(proximar_lsappr[#proximar_lsappr])[1], j));
            my(y = t + sign(s1) * ss1[1] * proximar_lsappr[#proximar_lsappr - 1][s1apprIdx, 1] -
            	       sign(s2) * ss2[1] * proximar_lsappr[#proximar_lsappr][s2apprIdx, 1]);
            my(yStr);
            if(is_rational(y),
                yStr = Str(y),
                yStr = Str(t, " + ", ss1[1], "*(", proximar_lsappr[#proximar_lsappr - 1][s1apprIdx, 2], ") - ",
                					 ss2[1], "*(", proximar_lsappr[#proximar_lsappr][s2apprIdx, 2], ")")
            );
            processApprox([y, yStr, abs(valueBeingApproximated - y)]);
            j = j + 1;
        );
        pop(~proximar_lsappr);
        pop(~proximar_lsappr)
        ], 4);
}


/*
 * An approximation is a tuple: [value, approximationAsString, precision]
 */
do_approximate_nthroot(n, a, processApprox, depth) = {
    if((a == 0) || (a == 1),
        processApprox([a, Str(a), 0]);
        return;
    );
    if(depth == [], depth = 10);
    my(valueBeingApproximated = a^(1/n));
    my(d);
    if(a < 1/2, d = 1/(round((1 / a) ^ (1 / n))),
                d = round(a ^ (1 / n)));
    /* d is an approximation */
    processApprox([d, Str(d), abs(valueBeingApproximated - d)]);
    for(i = n, n + depth - 1,
        my(polyn = Mod((X - d)^i, X^n - a).pol);
        my(degPolyn = poldegree(polyn));
        if(degPolyn == 0,
            my(approx = polcoef(polyn, 0));
            processApprox([approx, Str(approx), abs(valueBeingApproximatid - approx)]),
        if(degPolyn == 1,
            my(approx = -polcoef(polyn, 0) / polcoef(polyn, 1));
            processApprox([approx, Str(approx), abs(valueBeingApproximated - approx)]),
        if(degPolyn == 2,
            my(foundRootInfo = findDegree2PolyRoot(polyn, valueBeingApproximated));
            if(#foundRootInfo == 0,
                print("Failed to find a real root for ", polyn);
                next;
            );
            /* Evaluate the roots and find the closest one, it is of the form (p + q * sqrt(r)) / s, perform approximations of sqrt(r) */
            my(polynRoot = foundRootInfo[1]);
            my(polynRootAsStr = foundRootInfo[2]);
            processApprox([polynRoot, polynRootAsStr, abs(valueBeingApproximated - polynRoot)]);
            my(p = foundRootInfo[3][1], q = foundRootInfo[3][2], r = foundRootInfo[3][3], s = foundRootInfo[3][4]);
            do_approximate_nthroot(2, r, x -> [ my(z = (p + q * x[1]) / s); processApprox([z, Str(z), abs(valueBeingApproximated - z)]); 0 ], 4),
        if(degPolyn == 3,
            handleDegree3Poly(polyn, valueBeingApproximated, processApprox),
        if(degPolyn == 4,
        	print("Degree 4 polynomial not supported yet!");
        )))))
    )
}


/**/
approximate_nthroot(n, a, depth) = {
    if((type(n) != "t_INT") || (n < 2) || (n > 5),
    	print("First argument must be an integer in {2, 3, 4, 5}");
    	return;
    );
    if(depth == [], depth = 10);
    do_approximate_nthroot(n, a, x -> [ print("| ", x[2], " | ", strprintf("%.8e", abs(x[3])), " |") ], depth);
}
