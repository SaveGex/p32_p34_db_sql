SELECT
	'const_string',
	department_id,
	COUNT(*)						AS [����� ���-��],
	COUNT(id)						AS [����� ���-��],
	COUNT(DISTINCT department_id)	AS [���-�� ���������� department_id]
FROM employees
GROUP BY department_id;



SELECT
	'const_string',
	department_id,
	position_id,
	SUM(salary),
	COUNT(id)
FROM employees
GROUP BY position_id, department_id



-- ��������� ���-�� �����������, ���������� � ������ ����
-- year | count
SELECT
	YEAR(birthday)	AS [year],
	COUNT(id)		AS [count]
FROM employees
GROUP BY YEAR(birthday)


SELECT
	CASE department_id
		WHEN 1 THEN 'Administration'
		WHEN 2 THEN 'Accounting'
		WHEN 3 THEN 'IT'
		ELSE 'Extra'
	END									AS [department],
	COUNT(DISTINCT position_id)			AS [���-�� ���������� ����������],
	COUNT(id)							AS [���-�� ��������],
	SUM(salary)							AS [����� ��],
	AVG(salary)							AS [������� ��]
FROM employees
GROUP BY department_id;




--TASK
-- �������� ������� ������� � ������� �������,
-- ��������� ��������� �� � �������� �� ����������

-- | department			| bookers | directors | developers | teamleads |
------------------------------------------------------------------------
-- | Administration		| 0		  | 7000      | 0....
-- | Accounting			| 3000	  | 0         | 0....


SELECT
	CASE department_id
		WHEN 1 THEN 'Administration'
		WHEN 2 THEN 'Accounting'
		WHEN 3 THEN 'IT'
		ELSE 'Extra'
	END																	AS [Department],

	SUM(CASE WHEN position_id = 1 THEN ISNULL(salary, 0) ELSE 0 END)	AS [Bookers],
	SUM(CASE WHEN position_id = 2 THEN ISNULL(salary, 0) ELSE 0 END)	AS [Directors],
	SUM(CASE WHEN position_id = 3 THEN ISNULL(salary, 0) ELSE 0 END)	AS [Developers],
	SUM(CASE WHEN position_id = 4 THEN ISNULL(salary, 0) ELSE 0 END)	AS [Teamleads]

FROM employees
GROUP BY department_id





--==== HAVING ====

SELECT
	department_id,
	SUM(salary) AS [Salary_sum]
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 6000;



SELECT
	department_id,
	SUM(salary) AS [Salary_sum]
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 6000 AND COUNT(id) >= 2;




-- :-(((
SELECT
	department_id,
	SUM(salary)   AS [Salary sum]
FROM employees
GROUP BY department_id
HAVING department_id = 3;


-- :-)))
SELECT
	department_id,
	SUM(salary)   AS [Salary sum]
FROM employees
WHERE department_id = 3
GROUP BY department_id;					-- ����� ��������



-- DISTINCT						5
-- TOP							7	
-- SELECT					4
-- FROM				0
-- WHERE			1
-- HAVING				3
-- GROUP BY				2
-- ORDER BY						6