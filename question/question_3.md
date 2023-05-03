# 使用するデータベース
use question3_database

# 社員テーブル
users, follows

| id   | name     | email              | age    |
| ---- | ----     | ----               | ----   |
| 0001 |	もっくん | mokkun@example.com | 19     |
| 0002 |	みみこ 	 | mimiko@example.net | 20     |
| 0003 |	さくら 	 | sakura@example.com | 31     |
| 0004 |	ひよこ 	 | hiyoko@example1.jp | 23     |
| 0005 |	すずき   | suzuki@example.jp  | 28     |

------------------------------------------------
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` int(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

------------------------------------------------

INSERT INTO `users` (`id`, `name`, `email`, `age`)
VALUES
	(1, 'もっくん', 'mokkun@example.com', 19),
	(2, 'みみこ', 'mimiko@example.net', 20),
	(3, 'さくら', 'sakura@example.com', 31),
	(4, 'ひよこ', 'hiyoko@example1.jp', 23),
	(5, 'すずき', 'suzuki@example.jp', 28);

------------------------------------------------

CREATE TABLE `follows` (
  `follower_id` int(11) unsigned NOT NULL,
  `followee_id` int(11) unsigned NOT NULL,
  PRIMARY KEY(`follower_id`, `followee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

------------------------------------------------

INSERT INTO `follows` (`follower_id`, `followee_id`)
VALUES
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(3, 1),
	(3, 2),
	(4, 5),
	(5, 1),
	(5, 2),
	(5, 3),
	(5, 4);


------------------------------------------------

### 全件取得
```
SELECT * FROM employees;
```

# q1.さくらがフォローしているユーザーの名前を一覧で表示

A
```
SELECT
  u2.name
FROM
  users u1
INNER JOIN
  follows
ON
  u1.id = follows.follower_id
INNER JOIN
  users u2
ON
  follows.followee_id = u2.id
WHERE
  u1.id = 3;
```


# q2.誰もフォローしていないユーザーの名前を表示

A
```
SELECT
	u.name
FROM
	users u
LEFT JOIN follows f
	ON u.id = f.follower_id
WHERE
	f.follower_id IS NULL
```

# q3.10代、20代、30代といった年代別にフォロー数の平均を表示

A
```
SELECT
    CONCAT(age_group * 10, '代') AS age_group,
    AVG(count) AS avg_count
FROM (
    SELECT
        FLOOR(age / 10) AS age_group,
        count(f.follower_id) AS count
    FROM
        users u
    LEFT JOIN follows f
        ON u.id = f.follower_id
    GROUP BY
        u.id
) follows_count
GROUP BY
    age_group
```

# q4.相互フォローしているユーザーのIDを表示.ただし、重複は無し

A
```
SELECT 
	f1.follower_id As id1,
	f1.followee_id As id2
FROM
	follows f1
INNER JOIN follows f2
	ON f1.follower_id = f2.followee_id
	AND f1.followee_id = f2.follower_id
WHERE
	f1.follower_id < f1.followee_id
```
