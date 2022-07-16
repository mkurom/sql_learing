# 使用するデータベース
use question2_database

# 社員テーブル
employees

| id   | name                | department      | hobby     |
| ---- | ----                | ----            | ----      |
| 0001 | sato taro           | sales           | soccer    |
| 0002 | suzuki hanako       | human resources | movie     |
| 0003 | sasaki kozijo       | accounting      | game      |
| 0004 | tanaka yoko         | sales           | dirve     |
| 0005 | kobayakawa jun      | human resources | Null      |
| 0006 | takahashi keisuke   | accounting      | instagram |

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