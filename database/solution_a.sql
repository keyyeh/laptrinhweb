--1. L?y ra danh s�ch ng??i d�ng theo th? t? t�n theo Alphabet (A->Z)
SELECT * FROM `users` ORDER BY `user_name`;

--2. L?y ra 07 ng??i d�ng theo th? t? t�n theo Alphabet (A->Z)
SELECT * FROM `users` 
ORDER BY `user_name`
LIMIT 7;

--3. L?y ra danh s�ch ng??i d�ng theo th? t? t�n theo Alphabet (A->Z), trong ?� t�n ng??i d�ng c� ch? a
SELECT * FROM `users`
WHERE `user_name` LIKE '%a%'
ORDER BY `user_name`;

--4. L?y ra danh s�ch ng??i d�ng trong ?� t�n ng??i d�ng b?t ??u b?ng ch? m
SELECT * FROM `users`
WHERE `user_name` LIKE 'm%';

--5. L?y ra danh s�ch ng??i d�ng trong ?� t�n ng??i d�ng k?t th�c b?ng ch? i
SELECT * FROM `users`
WHERE `user_name` LIKE 'i%';

--6. L?y ra danh s�ch ng??i d�ng trong ?� email ng??i d�ng l� Gmail (v� d?:example@gmail.com)
SELECT * FROM `users`
WHERE `user_email` LIKE '%gmail.com';

--7. L?y ra danh s�ch ng??i d�ng trong ?� email ng??i d�ng l� Gmail (v� d?:example@gmail.com), t�n ng??i d�ng b?t ??u b?ng ch? m
SELECT * FROM `users`
WHERE `user_email` LIKE 'm%gmail.com';

--8. L?y ra danh s�ch ng??i d�ng trong ?� email ng??i d�ng l� Gmail (v� d?:example@gmail.com), t�n ng??i d�ng c� ch? i v� t�n ng??i d�ng c� chi?u d�i l?n h?n 5\
SELECT * FROM `users`
WHERE `user_email` LIKE '%gmail.com'
AND `user_name` LIKE '%i%'
AND LENGTH(`user_name`) > 5;

--9. L?y ra danh s�ch ng??i d�ng trong ?� t�n ng??i d�ng c� ch? a, chi?u d�i t? 5 ??n 9, email d�ng d?ch v? Gmail, trong t�n email c� ch? I (trong t�n, ch? kh�ng ph?i domain exampleitest@yahoo.com)
SELECT * FROM users  
WHERE `user_name` LIKE '%a%'  
AND LENGTH(`user_name`) BETWEEN 5 AND 9  
AND `user_email` LIKE '%@gmail.com'  
AND LEFT(`user_email`, LOCATE('@', `user_email`) - 1) LIKE '%I%';

--10. L?y ra danh s�ch ng??i d�ng trong ?� t�n ng??i d�ng c� ch? a, chi?u d�i t? 5 ??n 9 ho?c t�n ng??i d�ng c� ch? i, chi?u d�i nh? h?n 9 ho?c email d�ng d?ch v? Gmail, trong t�n email c� ch? i
SELECT * FROM users  
WHERE (`user_name` LIKE '%a%' AND LENGTH(`user_name`) BETWEEN 5 AND 9)  
   OR (`user_name` LIKE '%i%' AND LENGTH(`user_name`) < 9)  
   OR (`user_email` LIKE '%@gmail.com' AND LEFT(`user_email`, LOCATE('@', `user_email`) - 1) LIKE '%i%');