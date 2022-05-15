## [TOP earners](https://www.hackerrank.com/challenges/earnings-of-employees/problem?h_r=internal-search)

우선 내가 보고싶은 결과값이 무엇인지를 생각해야함- 여기서는 maximum total earnings의 값과 maximum total eargning을 벌고 있는 사람의 값이 출력이 되어야 한다. 

즉 두가지 열이 나와야 하는데 하나는 **total earning의 값**, 나머지 하나는 **각 earning 별로 받고 있는 사람의 수**! 대신, **가장 많이 벌고 있는 사람의 값을 알고 싶음!**

```SQL
SELECT SALARY*MONTHS AS earnings-- (1) earning이라는 열을 새로 만들고 이에 대한 별명 붙여줌.
COUNT(*) --(3)Earning 별로 Group 을 묶었을 때 몇명이 있는지 알고 싶으니 count하기

FROM Employee
GROUP BY earnings --(2) earning 별로 group을 만든 다음에 거기에 해당되는 수를 세고 싶은 것이기에 Group by!

ORDER BY earnings DESC
LIMIT 1 --(4)최대값을 출력하고 싶으니 ORDER BY, DESC, LIMIT. 
```

- 최대값을 알고 싶다! 할 때의 `MAX`와 `ORDER BY` 한 후 `DESC` `LIMIT` 주는 방법의 차이가 궁금하다. 
  - https://datarian-camp.slack.com/archives/C02RBF792NL/p1652625071619489

