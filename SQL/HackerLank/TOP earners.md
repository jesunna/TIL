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
  - MAX는 보통 최댓값 만 값으로 나왔으면 좋을 때 쓰지만, ORDER BY / LIMIT는 최댓값 뿐만 아니라 다른 열의 값도 함께 볼 때 사용을 하게 된다고 한다. 한편, MAX를 사용해서도 본 문제를 풀 수 있기는 하나  SUBQUERY 방식을 사용해야한다고 한다. 

- COUNT(*) 대신에 SUM(*)을 해보니 또 오류가 나왔다. 왜 그런지 궁금하다. 

  - COUNT()는 레코드의 개수를 세주는 함수이다. 즉 그 행이 몇개 있는지.... 안의 값과는 상관 없이 사용한다. 다만, SUM()의 경우는 컬럼을 꼭 지정해주어야 한다. 그냥 그 행을 세는게 아니라 그 행 안의 값이 얼마인지도 알아서 합산을 하는 함수이기 때문에, sum(*)와 같이 사용해서는 안된다. 예를 들어, SUM(months)이라고 한다면 에러가 뜨지는 않는다! 

  - https://datarian-camp.slack.com/archives/C02RBF792NL/p1652625071619489

