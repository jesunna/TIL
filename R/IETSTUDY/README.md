## 척도 하위문항들의 평균값을 통해서 대표값 지정하기 `

```
mutate(dat, KOBESM = rowMeans(select(dat, starts_with("KOBES")), na.rm = TRUE))
```

https://stackoverflow.com/a/28745981

-`na.rm` : NA값은 REMOVE하라! (FALSE로 하면 포함해서 계산함)
