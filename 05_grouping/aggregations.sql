--COUNT(*)
--COUNT(<expr>)
--COUNT(DISTINCT <expr>)
--SUM(<expr>)
--AVG(<expr>)
--MIN(<expr>)
--MAX(<expr>)

SELECT
	'const_string',
	COUNT(*)							AS [����� ���-�� �������],
	COUNT(department_id)				AS [���-�� �� NULL �������� � ���� department_id],
	COUNT(DISTINCT department_id)		AS [���-�� ���������� �� NULL �������],
	MAX(bonus_percent)					AS [������ ������������� �������� ������],
	SUM(salary / 100 * bonus_percent)	AS [����� ����� �� ������],
	AVG(salary / 100 * bonus_percent)	AS [������� ����� ������]
FROM employees;



SELECT
	'const_string',
	COUNT(*)							AS [����� ���-�� �������],
	COUNT(department_id)				AS [���-�� �� NULL �������� � ���� department_id],
	COUNT(DISTINCT department_id)		AS [���-�� ���������� �� NULL �������],
	MAX(bonus_percent)					AS [������ ������������� �������� ������],
	SUM(salary / 100 * bonus_percent)	AS [����� ����� �� ������],
	AVG(salary / 100 * bonus_percent)	AS [������� ����� ������]
FROM employees
WHERE department_id = 3;



SELECT
	SUM(salary),
	AVG(salary),
	ISNULL(SUM(salary), 0),
	ISNULL(AVG(salary), 0)
FROM employees
WHERE department_id = 100;