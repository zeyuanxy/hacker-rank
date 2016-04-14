/*
* @Author: Zeyuan Shang
* @Date:   2016-04-14 21:16:18
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2016-04-14 21:16:23
*/
SELECT name
FROM Employee 
WHERE (salary >= 2000) AND (months < 10)
ORDER BY employee_id;