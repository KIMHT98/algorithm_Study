# 정규화(Normalization)
# 데이터베이스 설계에서 중복을 최소화하고 데이터의 무결성을 보장하기 위한 과정
# 1. 중복제거 : 데이터의 중복을 최소화 하여 저장공간을 절약하고 일관성을 유지한다.
# 2. 검색 및 조작 용이 : 테이블을 적절하게 나누어 두었기 때문에 데이터를 쉽게 검색하고 조작할 수 있다.
# 3. 확장성 : 데이터베이스의 확장이나 변경을 용이하게 해준다.

# 제 1정규화(1NF) : Atomic columns

# Q. 제 1정규화에 대해 학습을 하고 간단한 설명을 작성해 봅시다.
# 정규화에서 하나의 속성에는 하나의 값만을 저장할 수 있다.
# 따라서 1차 졍규화를 통해 테이블 내의 속성값을 더는 분리되지 않는 값으로 구성한다.
# 이싸피라는 학생의 언어가 C,Java라면 이를 분리하여 
# 이싸피라는 학생을 두 개의 행으로 분리하여 저장한다.

# Q. [문제 2] 그림을 참고하여 데이터 테이블이 있을 때 제 1정규화 과정을 진행하고 난 뒤의 테이블을 작성해 봅시다. (자유롭게)
/*
id  /user_id   / name  /pl
1   /1         /양싸피  /Java
2   /1         /양싸피  /Python
3   /2         /김싸피  /Java
4   /3         /박싸피  /SQL
5   /4         /홍싸피  /JavaScript
*/

