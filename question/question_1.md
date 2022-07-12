
use question1_database

// 学生テーブル
students

| id   | name          | gender |
| 0001 | sato taro     | man    |
| 0002 | suzuki hanako | woman  |
| 0003 | sasaki kozijo | man    |
| 0004 | tanaka yoko   | woman  |

------------------------------------------------
INSERT INTO `students` (`id`, `name`, `gender`)
VALUES
    (0001, 'sato taro', 'man'),
    (0002, 'suzuki hanako', 'woman'),
    (0003, 'sasaki kozijo', 'man'),
    (0004, 'tanaka yoko', 'woman');

------------------------------------------------


// 試験結果テーブル
exam_results

| id   | subject   | score |
| 0001 | japanese  | 30    |
| 0001 | english   | 30    |
| 0002 | japanese  | 70    |
| 0002 | math      | 80    |
| 0003 | science   | 92    |
| 0004 | sociology | 90    |
| 0004 | science   | 35    |
| 0004 | english   | 22    |

------------------------------------------------
INSERT INTO `exam_results` (`student_id`, `subject`, `score`)
VALUES
    (0001, 'japanese', 30),
    (0001, 'english', 30),
    (0002, 'japanese', 70),
    (0002, 'math', 80),
    (0003, 'science', 92),
    (0004, 'sociology', 90),
    (0004, 'science', 35),
    (0004, 'english', 22);

------------------------------------------------

q1 性別が男性のみ出力

A 
```
SELECT
  name
FROM
  students
WHERE
  gender='man';
```

q2 1教科でも30点以下の点数をとった学生を表示。※重複は不可

A
```
SELECT DISTINCT
  s.name
FROM
  exam_results er
INNER JOIN
  students s
ON
  er.student_id = s.id
WHERE
  er.score <= 30;
```

[memo]

DISTINCT: 重複を1つにまとめる
INNER JOIN: 内部結合(studentsとexam_resultsのidが同じ)


・テーブル名を別名にする(ASは省略可能)
FROM
  テーブル名 AS 別名
    → テーブル名 別名
