여자 양궁 선수들의 BMI 지수 구하기


```SELECT athlete_id, medal, sex, weight, height, weight/power(height/100,2) as bmi
FROM records 
WHERE game_id = 49 AND event_id = 39 AND weight <> '' AND height <> '' ``` 
