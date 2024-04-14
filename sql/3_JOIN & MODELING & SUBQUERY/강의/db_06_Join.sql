USE `ssafy_corporation`;

# Q1. 카타시안 곱 
-- 데이터 확인
SELECT empno, ename, job
FROM emp;

SELECT deptno, dname
FROM dept;

-- 카타시안
SELECT empno, ename, job, emp.deptno, dname
FROM  emp, dept;

-- WHERE 사용하여 유의미한 데이터 뽑기
SELECT empno, ename, job, emp.deptno, dname
FROM  emp, dept
WHERE emp.deptno = dept.deptno;

# Q2. 사번 7788인 사원의 이름, 업무, 부서번호, 부서이름 조회
SELECT ename, job, deptno
FROM emp
WHERE empno = 7788;

SELECT dname
FROM dept
WHERE deptno = 20;

-- 조인을 이용하여 작성
SELECT ename, job, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno AND empno = 7788;

-- INNER JOIN 키워드 사용해보자.
SELECT ename, job, emp.deptno, dname
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE emp.empno = 7788;

-- USING 사용
SELECT ename, job, emp.deptno, dname
FROM emp
INNER JOIN dept
USING (deptno)
WHERE empno=7788;

-- EMP 테이블에 데이터 추가
INSERT INTO emp
VALUES (7777, "양싸피", "MANAGER", 7839, "2024-03-21", 5000, NULL, NULL);
SELECT * FROM emp;
-- 동등조인으로 이름, 부서번호, 부서 이름 조회하기
-- dept에는 양싸피에 대한 데이터가 없어서 나오지 않음(deptno가 NULL이기 때문)
SELECT e.ename, e.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;


# Q3. OUTER JOIN 사용하기
-- LEFT OUTER JOIN
-- 양싸피 생김 그런데 얘는 deptno, dname이 null이어서 null로 뜸
SELECT e.ename, e.deptno, d.dname
FROM emp e
LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

-- RIGHT OUTER JOIN
-- 양싸피 안나옴 -> 기준이 dept로 넘어가서
-- OPERATIONS에서 일하는 사람이 없으므로 ename에 NULL뜸
SELECT e.ename, d.deptno, d.dname
FROM emp e
RIGHT OUTER JOIN dept d
ON e.deptno = d.deptno;

# Q4. SELF JOIN 사용하기
-- 모든 사원번호, 이름, 매니저 번호, 매니저 이름 
-- 사원 정보는 e1, 매니저 정보는 e2에서 조회 / 조인 조건은 e1.mgr=e2.empno
SELECT e1.empno, e1.ename, e1.mgr, e2.ename AS 'mgr name'
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno
ORDER BY e2.ename;

-- 킹이 없음 -> left join으로 하면 된다.
SELECT e1.empno, e1.ename, e1.mgr, e2.ename AS 'mgr name'
FROM emp e1
LEFT JOIN emp e2
ON e1.mgr = e2.empno
ORDER BY e2.ename;

# Q5. 비 동등 조인 (Non-Equi JOIN)
-- 모든 사원의 사번, 이름, 급여, 급여등급을 조회
SELECT e.empno, e.ename, e.sal, sg.grade
FROM emp e, salgrade sg
WHERE e.sal BETWEEN sg.losal AND sg.hisal
ORDER BY sg.grade DESC, e.sal DESC;

