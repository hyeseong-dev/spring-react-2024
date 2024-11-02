-- 필요한 사용자 추가
INSERT INTO user (email, password, nickname, tel_number, address, address_detail, profile_image)
VALUES ('email@email.com', 'P@ssw0rd', 'nickname', '01012345678', '부산광역시 부산진구', '롯데백화점', NULL);


-- 게시물 10개 추가 (board 테이블)
INSERT INTO board (title, content, write_datetime, favorite_count, comment_count, view_count, writer_email)
VALUES 
('게시물 제목 1', '게시물 내용 1', now(), 0, 0, 0, 'email@email.com'),
('게시물 제목 2', '게시물 내용 2', now(), 0, 0, 0, 'email@email.com'),
('게시물 제목 3', '게시물 내용 3', now(), 0, 0, 0, 'email@email.com'),
('게시물 제목 4', '게시물 내용 4', now(), 0, 0, 0, 'email@email.com'),
('게시물 제목 5', '게시물 내용 5', now(), 0, 0, 0, 'email@email.com'),
('게시물 제목 6', '게시물 내용 6', now(), 0, 0, 0, 'email@email.com'),
('게시물 제목 7', '게시물 내용 7', now(), 0, 0, 0, 'email@email.com'),
('게시물 제목 8', '게시물 내용 8', '2023-08-27 17:00:00', 0, 0, 0, 'email@email.com'),
('게시물 제목 9', '게시물 내용 9', '2023-08-28 18:00:00', 0, 0, 0, 'email@email.com'),
('게시물 제목 10', '게시물 내용 10', '2023-08-29 19:00:00', 0, 0, 0, 'email@email.com');

-- 각 게시물에 대한 예시 이미지 추가 (image 테이블)
INSERT INTO image (board_number, image)
VALUES 
(1, 'https://example.com/image1.jpg'),
(2, 'https://example.com/image2.jpg'),
(3, 'https://example.com/image3.jpg'),
(4, 'https://example.com/image4.jpg'),
(5, 'https://example.com/image5.jpg'),
(6, 'https://example.com/image6.jpg'),
(7, 'https://example.com/image7.jpg'),
(8, 'https://example.com/image8.jpg'),
(9, 'https://example.com/image9.jpg'),
(10, 'https://example.com/image10.jpg');

-- 각 게시물에 대한 예시 댓글 추가 (comment 테이블)
INSERT INTO comment (content, write_datetime, user_email, board_number)
VALUES 
('게시물 1에 대한 첫 댓글', now(), 'email@email.com', 1),
('게시물 2에 대한 첫 댓글', now(), 'email@email.com', 2),
('게시물 3에 대한 첫 댓글', now(), 'email@email.com', 3),
('게시물 4에 대한 첫 댓글', now(), 'email@email.com', 4),
('게시물 5에 대한 첫 댓글', now(), 'email@email.com', 5),
('게시물 6에 대한 첫 댓글', now(), 'email@email.com', 6),
('게시물 7에 대한 첫 댓글', now(), 'email@email.com', 7),
('게시물 8에 대한 첫 댓글', '2023-08-27 17:10:00', 'email@email.com', 8),
('게시물 9에 대한 첫 댓글', '2023-08-28 18:10:00', 'email@email.com', 9),
('게시물 10에 대한 첫 댓글', '2023-08-29 19:10:00', 'email@email.com', 10);

-- 각 게시물에 대해 좋아요 추가 (favorite 테이블)
INSERT INTO favorite (user_email, board_number)
VALUES 
('email@email.com', 1),
('email@email.com', 2),
('email@email.com', 3),
('email@email.com', 4),
('email@email.com', 5),
('email@email.com', 6),
('email@email.com', 7),
('email@email.com', 8),
('email@email.com', 9),
('email@email.com', 10);

-- 좋아요와 댓글 수 업데이트 (board 테이블)
UPDATE board SET favorite_count = 1, comment_count = 1 WHERE board_number BETWEEN 1 AND 10;

-- 데이터 확인을 위한 SELECT 문
SELECT * FROM board;
SELECT * FROM image;
SELECT * FROM comment;
SELECT * FROM favorite;


-- 로그인
SELECT * FROM user WHERE email = 'email@email.com';


-- 게시물 수정 (타이틀과 내용 수정)
UPDATE board 
SET title = '수정된 게시물 제목', 
    content = '수정된 게시물 내용' 
WHERE board_number = 1;

-- 특정 게시물 상세 조회 (게시물 정보와 작성자 정보, 대표 이미지 포함)
SELECT 
    B.board_number AS board_number,
    B.title AS title,
    B.content AS content,
    I.image AS title_image,
    B.favorite_count AS favorite_count,
    B.comment_count AS comment_count,
    B.view_count AS view_count,
    B.write_datetime AS write_datetime,
    U.nickname AS writer_nickname,
    U.profile_image AS writer_profile_image
FROM board AS B
INNER JOIN user AS U ON B.writer_email = U.email
LEFT JOIN (
    SELECT board_number, ANY_VALUE(image) AS image 
    FROM image 
    GROUP BY board_number
) AS I ON B.board_number = I.board_number
WHERE B.board_number = 1;


-- 댓글 작성 시 게시물의 댓글 수 증가
UPDATE board 
SET comment_count = comment_count + 1 
WHERE board_number = 1;


-- 좋아요 수 증가
UPDATE board 
SET favorite_count = favorite_count + 1 
WHERE board_number = 1;

-- 좋아요 취소
DELETE FROM favorite 
WHERE user_email = 'email@email.com' 
AND board_number = 1;

-- 좋아요 수 감소
UPDATE board 
SET favorite_count = favorite_count - 1 
WHERE board_number = 1;

-- 최신 게시물 리스트 불러오기 (작성자 정보와 대표 이미지 포함)
SELECT 
    B.board_number AS board_number,
    B.title AS title,
    B.content AS content,
    I.image AS title_image,
    B.favorite_count AS favorite_count,
    B.comment_count AS comment_count,
    B.view_count AS view_count,
    B.write_datetime AS write_datetime,
    U.nickname AS writer_nickname,
    U.profile_image AS writer_profile_image
FROM board AS B
INNER JOIN user AS U ON B.writer_email = U.email
LEFT JOIN (
    SELECT board_number, ANY_VALUE(image) AS image 
    FROM image 
    GROUP BY board_number
) AS I ON B.board_number = I.board_number
ORDER BY write_datetime DESC;


-- 특정 검색어로 게시물 조회 (title 또는 content에서 검색어 포함)
SELECT 
    B.board_number AS board_number,
    B.title AS title,
    B.content AS content,
    I.image AS title_image,
    B.favorite_count AS favorite_count,
    B.comment_count AS comment_count,
    B.view_count AS view_count,
    B.write_datetime AS write_datetime,
    U.nickname AS writer_nickname,
    U.profile_image AS writer_profile_image
FROM board AS B
INNER JOIN user AS U ON B.writer_email = U.email
LEFT JOIN (
    SELECT board_number, ANY_VALUE(image) AS image 
    FROM image 
    GROUP BY board_number
) AS I ON B.board_number = I.board_number
WHERE B.title LIKE CONCAT('%', "게시물", '%')
   OR B.content LIKE CONCAT('%', "게시물", '%')
ORDER BY B.write_datetime DESC;

-- 주간 상위 3개 게시물 조회 (조회 수 기준)
SELECT 
    B.board_number AS board_number,
    B.title AS title,
    B.content AS content,
    I.image AS title_image,
    B.favorite_count AS favorite_count,
    B.comment_count AS comment_count,
    B.view_count AS view_count,
    B.write_datetime AS write_datetime,
    U.nickname AS writer_nickname,
    U.profile_image AS writer_profile_image
FROM board AS B
INNER JOIN user AS U ON B.writer_email = U.email
LEFT JOIN (
    SELECT board_number, ANY_VALUE(image) AS image 
    FROM image 
    GROUP BY board_number
) AS I ON B.board_number = I.board_number
WHERE B.write_datetime >= DATE_SUB(NOW(), INTERVAL 7 DAY)  -- 최근 7일 내 게시물
ORDER BY favorite_count DESC, comment_count DESC,  view_count DESC, write_datetime DESC  -- 조회 수 기준 정렬
LIMIT 3;  -- 상위 3개 게시물만 가져옴


-- 특정 유저의 게시물 리스트 불러오기
SELECT 
    B.board_number AS board_number,
    B.title AS title,
    B.content AS content,
    I.image AS title_image,
    B.favorite_count AS favorite_count,
    B.comment_count AS comment_count,
    B.view_count AS view_count,
    B.write_datetime AS write_datetime,
    U.nickname AS writer_nickname,
    U.profile_image AS writer_profile_image
FROM board AS B
INNER JOIN user AS U ON B.writer_email = U.email
LEFT JOIN (
    SELECT board_number, ANY_VALUE(image) AS image 
    FROM image 
    GROUP BY board_number
) AS I ON B.board_number = I.board_number
WHERE B.writer_email = 'email@email.com'  -- 특정 유저의 이메일로 필터링
ORDER BY B.write_datetime DESC;  -- 최신 게시물 순으로 정렬


-- 인기 검색어 리스트
SELECT search_word, COUNT(search_word)
FROM search_log
WHERE relation IS FALSE
GROUP BY search_word;
ORDER BY count DESC
LIMIT 15;

-- 설명
-- search_word: 검색어를 나타내는 컬럼입니다.
-- COUNT(search_word): 각 검색어의 빈도수를 계산합니다.
-- WHERE relation IS FALSE: 관련 검색어가 아닌 검색어만 필터링합니다 (relation이 FALSE인 경우).
-- GROUP BY search_word: search_word로 그룹화하여 각각의 검색어별로 집계합니다.
-- 이 쿼리는 search_log 테이블에서 relation이 FALSE인 검색어만 대상으로 하여, 각 검색어의 검색 횟수를 집계하고 인기 검색어 리스트를 생성합니다.

-- 관련 검색어 리스트
SELECT relation_word, COUNT(relation_word) AS count
FROM search_log
WHERE search_word = '검색어'
GROUP BY relation_word
ORDER BY count DESC
LIMIT 15;



-- 관련 검색어 리스트
SELECT relation_word, COUNT(relation_word) AS count
FROM search_log
WHERE search_word = '검색어'
GROUP BY relation_word
ORDER BY count DESC
LIMIT 15;

-- ### 쿼리 설명
-- 1. **SELECT relation_word, COUNT(relation_word) AS count**:
--    - `relation_word` 컬럼을 선택하여 표시하고, 각 `relation_word`가 얼마나 자주 등장했는지 집계하여 `count`라는 별칭으로 표시합니다.
   
-- 2. **FROM search_log**:
--    - `search_log` 테이블에서 데이터를 가져옵니다. 이 테이블은 검색어와 관련 검색어의 기록을 저장하고 있다고 가정됩니다.

-- 3. **WHERE search_word = '검색어'**:
--    - `search_word`가 `'검색어'`인 레코드만 필터링합니다. 즉, `'검색어'`라는 검색어와 관련된 `relation_word`를 가져오려는 조건입니다.
   
-- 4. **GROUP BY relation_word**:
--    - `relation_word`로 그룹화하여, 각 관련 검색어가 얼마나 자주 사용되었는지 집계합니다.

-- 5. **ORDER BY count DESC**:
--    - `count` 값을 기준으로 내림차순 정렬하여, 가장 많이 등장한 `relation_word`가 상단에 오도록 합니다. 이를 통해 가장 자주 검색된 관련 검색어 순으로 결과가 정렬됩니다.
   
-- 6. **LIMIT 15**:
--    - 결과를 상위 15개까지만 제한하여, 가장 빈도가 높은 15개의 `relation_word`를 반환합니다.

-- ### 사용 목적
-- - 이 쿼리는 특정 검색어(`search_word = '검색어'`)에 대해 가장 자주 연관된 검색어(`relation_word`)를 순위별로 확인하고자 할 때 유용합니다.
-- - 예를 들어, 사용자들이 검색어로 `'검색어'`를 입력했을 때 자주 함께 검색된 다른 검색어들을 빈도 순으로 보여줄 수 있습니다. 

-- ### 예시
-- - 만약 `'검색어'`가 "Java"였다면, 이 쿼리는 "Spring", "Hibernate", "MySQL" 등 Java와 자주 연관된 검색어들이 빈도순으로 나열될 것입니다.


-- 유저 정보 불러오기 / 로그인 유저 정보 불러오기
SELECT *
FROM user
WHERE email = 'email@email.com';


-- 닉네임 수정
UPDATE user 
SET nickname = '수정 닉네임' 
WHERE email = 'email@email.com';


-- 프로필 이미지 수정
UPDATE user 
SET profile_image = 'url2' 
WHERE email = 'email@email.com';
