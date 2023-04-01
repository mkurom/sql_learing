# 使用するデータベース
use question2_database

# 社員テーブル
employees

| id   | name                | department      | hobby1    | hobby2    | hobby3    |
| ---- | ----                | ----            | ----      | ----      | ----      |
| 0001 | sato taro           | sales           | soccer    | soccer    | soccer    |
| 0002 | suzuki hanako       | human resources | movie     | movie     | movie     |
| 0003 | sasaki kozijo       | accounting      | game      | game      | game      |
| 0004 | tanaka yoko         | sales           | dirve     | dirve     | dirve     |
| 0005 | kobayakawa jun      | human resources | Null      | Null      | Null      |
| 0006 | takahashi keisuke   | accounting      | instagram | instagram | instagram |

↓↓↓↓↓↓
|  1 | 杉山 圭佑     | 営業部     | サッカー     | ドライブ     | 映画鑑賞     |
|  2 | 佐藤 結菜     | 人事部     | 映画鑑賞     | 旅行        | インスタ     |
|  3 | 高橋 絵里     | 経理部     | ゲーム       | NULL       | NULL        |
|  4 | 早川 良太     | 人事部     | ドライブ     | 料理        | NULL        |
|  5 | 佐藤 一弥     | 経理部     | NULL        | NULL       | NULL        |
|  6 | 佐藤 優穂     | 営業部     | インスタ     | TikTok     | NULL        |

------------------------------------------------
CREATE TABLE `employees` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `hobby` varchar(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

------------------------------------------------

INSERT INTO `employees` (`id`, `name`, `department`, `hobby`)
VALUES
  (0001, 'sato taro', 'sales', 'soccer'),
  (0002, 'suzuki hanako', 'human resources', 'movie'),
  (0003, 'sasaki kozijo', 'accounting', 'game'),
  (0004, 'tanaka yoko', 'sales', 'drive'),
  (0005, 'kobayakawa jun', 'human resources', 'NULL'),
  (0006, 'takahashi keisuke', 'accounting', 'instagram');

------------------------------------------------

### 全件取得
```
SELECT * FROM employees;
```

# q1.趣味がmovieの社員の名前を一覧で表示

A
```
SELECT
  name
FROM
  employees
WHERE
  hobby = 'movie';
```

# q2.趣味1～3を縦に表示

A
```
SELECT
  name, hobby
FROM
  employees;
```

```
SELECT
  name, hobby1 AS hobby
FROM
  employees
UNION ALL SELECT
  name, hobby2
FROM
  employees
UNION ALL SELECT
  name, hobby3
FROM
  employees;
```

# q3.名字が佐藤である社員の、趣味の数を表示せよ。

A
```
SELECT
  name, COUNT(hobby1) + COUNT(hobby2) + COUNT(hobby3) AS hobby_count
FROM
  employees
WHERE
  name LIKE '佐藤 %'
GROUP BY
  name;
```

# q4.同じ趣味を持つ社員の一覧を表示せよ。なお、氏名リストの並び順は社員番号の昇順で、区切り文字は「, 」とする。

A
```
SELECT
    hobby,
    GROUP_CONCAT(name ORDER BY id separator ', ') AS name_list
FROM (
    SELECT id, name, hobby1 AS hobby FROM employees
    UNION ALL
    SELECT id, name, hobby2 FROM employees
    UNION ALL
    SELECT id, name, hobby3 FROM employees
) hobby_table
WHERE
    hobby IS NOT NULL
GROUP BY
    hobby
HAVING
    COUNT(*) > 1
```