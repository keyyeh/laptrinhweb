--1. Liệt kê các hóa đơn của khách hàng, thông tin hiển thị gồm: mã user, tên user, mã hóa đơn
SELECT users.user_id, users.user_name, orders.order_id
FROM orders
JOIN users ON orders.user_id = users.user_id;

--2. Liệt kê số lượng các hóa đơn của khách hàng: mã user, tên user, số đơn hàng
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_don_hang
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY so_don_hang DESC;

--3. Liệt kê thông tin hóa đơn: mã đơn hàng, số sản phẩm
SELECT `order_id`, COUNT(`product_id`) AS so_san_pham
FROM order_details
GROUP BY `order_id`
ORDER BY `order_id`;

--4. Liệt kê thông tin mua hàng của người dùng: mã user, tên user, mã đơn hàng, tên sản phẩm. Lưu ý: gôm nhóm theo đơn hàng, tránh hiển thị xen kẻ các đơn hàng với nhau
SELECT 
    u.user_id, 
    u.user_name, 
    o.order_id, 
    p.product_name
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
ORDER BY o.order_id, u.user_id;

--5. Liệt kê 7 người dùng có số lượng đơn hàng nhiều nhất, thông tin hiển thị gồm: mã user, tên user, số lượng đơn hàng
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_don_hang
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY so_don_hang DESC
LIMIT 7;

--6. Liệt kê 7 người dùng mua sản phẩm có tên: Samsung hoặc Apple trong tên sản phẩm, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tên sản phẩm
SELECT DISTINCT u.user_id, u.user_name, o.order_id, p.product_name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%'
ORDER BY u.user_id
LIMIT 7;

--7. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền
SELECT 
    u.user_id, 
    u.user_name, 
    o.order_id, 
    SUM(od.quantity * od.price) AS tong_tien
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id, u.user_id, u.user_name
ORDER BY tong_tien DESC;

--8. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền lớn nhất.
SELECT u.user_id, u.user_name, o.order_id, MAX(tong_tien) AS tong_tien
FROM (
    SELECT o.order_id, o.user_id, SUM(od.quantity * od.price) AS tong_tien
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_id, o.user_id
) AS order_totals
JOIN users u ON order_totals.user_id = u.user_id
GROUP BY u.user_id, u.user_name;

--9. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền nhỏ nhất.
SELECT u.user_id, u.user_name, o.order_id, MIN(tong_tien) AS tong_tien, total_products
FROM (
    SELECT o.order_id, o.user_id, SUM(od.quantity * od.price) AS tong_tien, SUM(od.quantity) AS total_products
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_id, o.user_id
) AS order_totals
JOIN users u ON order_totals.user_id = u.user_id
GROUP BY u.user_id, u.user_name;

--10. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền, số sản phẩm. Mỗi user chỉ chọn ra 1 đơn hàng có số sản phẩm là nhiều nhất.
SELECT u.user_id, u.user_name, o.order_id, tong_tien, MAX(total_products) AS so_san_pham
FROM (
    SELECT o.order_id, o.user_id, SUM(od.quantity * od.price) AS tong_tien, SUM(od.quantity) AS total_products
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_id, o.user_id
) AS order_totals
JOIN users u ON order_totals.user_id = u.user_id
GROUP BY u.user_id, u.user_name;
