<h3>1. Giải nén tệp .zip vào folder chứa source code của project</h3>

<h3>2. Tạo database (utf8mb4-unicode-ci), sau đó execute file DUMP_SQL.sql vào database vừa tạo</h3>

<h3>3. Thay đổi thông số kết nối CSDL trong file .env</h3>

<h3>4. Xóa folder storage (symlink) trong folder public (có đường dẫn là public\storage)</h3>

<h3>5. Chạy command để tạo lại storage link mới trong folder public</h3>
<pre>
php artisan storage:link
</pre>
