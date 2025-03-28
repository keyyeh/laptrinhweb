--1. L?y ra danh sách ng??i dùng theo th? t? tên theo Alphabet (A->Z)
SELECT * FROM `users` ORDER BY `user_name`;

--2. L?y ra 07 ng??i dùng theo th? t? tên theo Alphabet (A->Z)
SELECT * FROM `users` 
ORDER BY `user_name`
LIMIT 7;

--3. L?y ra danh sách ng??i dùng theo th? t? tên theo Alphabet (A->Z), trong ?ó tên ng??i dùng có ch? a
SELECT * FROM `users`
WHERE `user_name` LIKE '%a%'
ORDER BY `user_name`;

--4. L?y ra danh sách ng??i dùng trong ?ó tên ng??i dùng b?t ??u b?ng ch? m
SELECT * FROM `users`
WHERE `user_name` LIKE 'm%';

--5. L?y ra danh sách ng??i dùng trong ?ó tên ng??i dùng k?t thúc b?ng ch? i
SELECT * FROM `users`
WHERE `user_name` LIKE 'i%';

--6. L?y ra danh sách ng??i dùng trong ?ó email ng??i dùng là Gmail (ví d?:example@gmail.com)
SELECT * FROM `users`
WHERE `user_email` LIKE '%gmail.com';

--7. L?y ra danh sách ng??i dùng trong ?ó email ng??i dùng là Gmail (ví d?:example@gmail.com), tên ng??i dùng b?t ??u b?ng ch? m
SELECT * FROM `users`
WHERE `user_email` LIKE 'm%gmail.com';

--8. L?y ra danh sách ng??i dùng trong ?ó email ng??i dùng là Gmail (ví d?:example@gmail.com), tên ng??i dùng có ch? i và tên ng??i dùng có chi?u dài l?n h?n 5\
SELECT * FROM `users`
WHERE `user_email` LIKE '%gmail.com'
AND `user_name` LIKE '%i%'
AND LENGTH(`user_name`) > 5;

--9. L?y ra danh sách ng??i dùng trong ?ó tên ng??i dùng có ch? a, chi?u dài t? 5 ??n 9, email dùng d?ch v? Gmail, trong tên email có ch? I (trong tên, ch? không ph?i domain exampleitest@yahoo.com)
SELECT * FROM users  
WHERE `user_name` LIKE '%a%'  
AND LENGTH(`user_name`) BETWEEN 5 AND 9  
AND `user_email` LIKE '%@gmail.com'  
AND LEFT(`user_email`, LOCATE('@', `user_email`) - 1) LIKE '%I%';

--10. L?y ra danh sách ng??i dùng trong ?ó tên ng??i dùng có ch? a, chi?u dài t? 5 ??n 9 ho?c tên ng??i dùng có ch? i, chi?u dài nh? h?n 9 ho?c email dùng d?ch v? Gmail, trong tên email có ch? i
SELECT * FROM users  
WHERE (`user_name` LIKE '%a%' AND LENGTH(`user_name`) BETWEEN 5 AND 9)  
   OR (`user_name` LIKE '%i%' AND LENGTH(`user_name`) < 9)  
   OR (`user_email` LIKE '%@gmail.com' AND LEFT(`user_email`, LOCATE('@', `user_email`) - 1) LIKE '%i%');