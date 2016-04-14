/*
* @Author: Zeyuan Shang
* @Date:   2016-04-14 21:23:07
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2016-04-14 21:23:37
*/
SELECT salary * months, count(*)
FROM Employee e1
WHERE NOT EXISTS (SELECT * FROM Employee e2 WHERE e2.salary * e2.months > e1.salary * e1.months);