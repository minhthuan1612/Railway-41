# Question 1: Thêm ít nhất 10 record vào mỗi table
# sử dụng database của Mentor AN.

#Question 2: lấy ra tất cả các phòng ban 
SELECT 
    *
FROM
    department
ORDER BY DepartmentID ASC
;


#Question 3: lấy ra id của phòng ban "Sale" 
SELECT 
    DepartmentID AS PhongBanID
FROM
    department
WHERE
    DepartmentName = 'Sale'
;


#Question 4: lấy ra thông tin account có full name dài nhất 
SELECT 
    *
FROM
    `account`
WHERE
    LENGTH(FullName) = (SELECT 
            MAX(LENGTH(FullName))
        FROM
            `account`)
;


#Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id   = 3 
SELECT 
    *
FROM
    `account`
WHERE
    LENGTH(FullName) = (SELECT 
            MAX(LENGTH(FullName))
        FROM
            `account`
        WHERE
            DepartmentID = 3)
        AND DepartmentID = 3
;


#Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019 
SELECT 
    *
FROM
    `group`
WHERE
    CreateDate < '2019/12/20'
;


#Question 7: Lấy ra ID của question có >= 4 câu trả lời 
# chưa hiểu câu hỏi.
/*select * from answer;
select * from categoryquestion;
select QuestionID from question
where CategoryID>=4
;*/
#Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày   20/12/2019 
select * from exam;
select Code from exam
where Duration_min>=60 and CreateDate < '2019/12/20'
;
#Question 9: Lấy ra 5 group được tạo gần đây nhất 
select * from `group`
order by CreateDate asc
limit 5
;
#Question 10: Đếm số nhân viên thuộc department có id = 2 
#select * from department;
SELECT 
    COUNT(AccountID)
FROM
    `account`
WHERE
    DepartmentID = 2
;
#Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" 
select * from `account`
where UserName like 'D%o'
;
#Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
#select * from exam;

delete from exam where CreateDate  < '2019/12/20';

# Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" 
select * from question;

delete from question where Content like 'câu hỏi%';
#Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và   email thành loc.nguyenba@vti.com.vn 
 #select * from `account`;
 # thông báo chạy thành công nhưng table không update
 update `account`
 set UserName = 'Nguyễn Bá Lộc', Email='loc.nguyenba@vti.com.vn'
 where AccountID = 5
 ;
#Question 15: update account có id = 5 sẽ thuộc group có id = 4 

#select * from `account`;
#select * from groupaccount;

update groupaccount set GroupID=4 where accountID=5;