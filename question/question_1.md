
# 使用するテーブル
use question1_database

# 学生テーブル
students

| id   | name          | gender |
| ---- | ----          | ----   |
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

### 全件取得
```
SELECT * FROM students;
```

# 試験結果テーブル
exam_results

| id   | subject   | score |
| ---- | ----      | ----  |
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

### 全件取得
```
SELECT * FROM exam_results;
```

# q1.性別が男性のみ出力

A
```
SELECT
  name
FROM
  students
WHERE
  gender='man';
```

# q2.1教科でも30点以下の点数をとった学生を表示。※重複は不可

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

# q3.性別ごとに、最も高かった試験の点数を表示

A
```
SELECT
  s.gender,
  MAX(er.score) AS max_score
FROM
  students s
INNER JOIN exam_results er
  ON s.id = er.student_id
GROUP BY
  s.gender;
```

# q4.教科ごとの試験の平均点が50点以下である教科を表示

A
```
SELECT
  er.subject,
  AVG(score) AS avg_score
FROM
  exam_results er
GROUP BY
  subject
HAVING
  AVG(score) <= 50;
```

# q5.試験結果テーブルの点数の右に、その教科の平均点を表示

A
```
SELECT
  er1.*,
  (
    SELECT
      AVG(er2.score)
    FROM
      exam_results er2
    WHERE
      er1.subject = er2.subject
  ) AS subject_avg_score
FROM
  exam_results er1;
```

# q6.試験結果に理科が含まれない生徒の名前を一覧で表示

A
```
SELECT
  s.name
FROM
  students s
WHERE
  s.id NOT IN (
    SELECT
      er.student_id
    FROM
      exam_results er
    WHERE
      er.subject = 'science'
  );
```


# [基本構文]
```
SELECT
  [ALL | DISTINCT] 列名
FROM
  テーブル名

[INNER JOIN テーブル名 [ON 条件式]]
[WHERE 条件式]
[GROUP BY 列名 [HAVING 条件式]]
[ORDER BY 列名]
```


# [memo]
###### カラム, レコード, フィールド
https://academy.gmocloud.com/wp/wp-content/uploads/2016/04/x160425_DBword_04.png.pagespeed.ic.zAJ5VUq4AD.webp

###### DISTINCT: 重複を1つにまとめる

###### INNER JOIN: 内部結合(studentsとexam_resultsのidが同じ)

###### GROUP BY: 指定したカラムの値をキーとしてレコードをグループ化する

###### NOT IN: 指定した要素を含んでいないレコード(行)を取得する

・テーブル名を別名にする(ASは省略可能)
FROM
  テーブル名 AS 別名
    → テーブル名 別名
