#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-01-15 20:48:57
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-01-15 20:49:05
import json
import math

subjects = 'English, Physics, Chemistry, Mathematics, ComputerScience, Biology, PhysicalEducation, Economics, Accountancy, BusinessStudies'.split(', ')
count = {}
coefficients = {
    'Biology': 1.0,
    'BusinessStudies': 3.0,
    'Economics': 5.0,
    'ComputerScience': 5.0,
    'Chemistry': 5.0,
    'Physics': 8.0,
    'Accountancy': 10.0}

trash = ['serial', 'SerialNumber', 'English', 'PhysicalEducation']

def get_list(student):
    for t in trash:
        student.pop(t, None)
    res = []
    for sub in subjects:
        if sub in student:
            res.append(student[sub])
        else:
            res.append(0)
    return tuple(res)

def train():
    f = open('training.json')
    students = [json.loads(line) for line in f.readlines()[1:]]
    for student in students:
        grades = get_list(student)
        if grades not in count:
            count[grades] = 0
        count[grades] += 1

def test():
    n = input()
    full_grade = [0] * n
    dist = [0,1.2,2,3,4.1,5.1,6,7,8]
    for i in range(n):
        student = json.loads(raw_input())
        total = 0
        for math_grade in range(1,9):
            student['Mathematics'] = math_grade
            grades_list = get_list(student)
            if grades_list in count:
                total += count[grades_list]
                full_grade[i] += dist[math_grade] * 1.0 * count[grades_list]
        if total != 0:
            full_grade[i] /= total
        else:
            for sub in student:
                if sub in trash or sub == 'Mathematics': 
                    continue
                full_grade[i] += coefficients[sub] * student[sub]
                total += coefficients[sub]
            full_grade[i] /= total
        full_grade[i] = round(full_grade[i], 3)
        
    grade = [0] * n
    t = sorted(range(n), key = lambda x: full_grade[x])
    last_grade = 2
    last_full_grade = 0
    grades_table = [-1, -1, 2*n/8+n/20, 3*n/8+n/11, 4*n/8+n/9, 5*n/8+n/19, 6*n/8-n/18, n, n]
    for i in xrange(n):
        if full_grade[t[i]] != last_full_grade:
            last_full_grade = full_grade[t[i]]
            g = 0
            while i > grades_table[g]:
                g += 1
            last_grade = g
        grade[t[i]] = last_grade
    for i in xrange(n):
        print grade[i]
        
def main():
    train()
    test()
    
if __name__ == "__main__":
    main()