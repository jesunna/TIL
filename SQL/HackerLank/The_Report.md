https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

데이터 설명 : 학생의 번호, 이름, 점수가 있는 'Students' 테이블과 점수 구간별 등급이 나와있는 Grades table이 있다. 

해야하는 일은 
1) Name, Grade, Mark 쿼리를 짜야한다. 
- 이 때 Grade는 Students 테이블에 없기 때문에 Grades 테이블과 조인해야한다 
- **이 부분이 어려웠는데 Between을 사용해서 해당 값이 그 사이에만 있어도 해당 행으로 Join이 된다는 점을 배웠다.**

2) Grade가 8등 미만인 경우에는 이름을 NULL로 처리하고, 8등급 이상만 이름을 보이게 한다. 정말 무서운 선생님이다.. 
- CASE문을 사용해서 해당되는 경우에는 NAME 값을 출력하고 아닌 경우는 NULL 이 보이게 하자! 
3) 정렬은 등급 순으로 하되, 8~10등급은 같은 등급 안에서 이름으로 ASC 정렬한다. 하지만, 7등급 이하는 이름이 없으므로 같은 등급 안에서는 Marks로 ASC 정렬한다. 
 

``` sql
SELECT CASE WHEN G.Grade >= 8 THEN S.NAME ELSE NULL END AS Name, G.Grade AS Grade, S.Marks as Mark 
FROM Students AS S
JOIN Grades AS G ON S.Marks BETWEEN G.Min_MARK and G.Max_Mark 
ORDER BY Grade DESC, Name ASC, Mark ASC
```
