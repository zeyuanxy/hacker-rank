#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-28 01:19:40
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-28 01:19:49
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-28 00:48:23
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-28 00:48:28
import sys
import queue

class Vertex:
    def __init__(self):
        self.edges = {}

    def get_edges(self):
        return self.edges

    def add_edge(self, vertex, distance):
        if vertex not in self.edges or distance < self.edges[vertex]:
            self.edges[vertex] = distance


class Graph:
    def __init__(self, N):
        self.vertices = {}
        while N > 0:
            self.vertices[N] = Vertex()
            N -= 1

    def get_vertices(self):
        return self.vertices

    def get_vertex(self, key):
        return self.vertices[key]

    def add_vertex(self, key, vertex):
        self.vertices[key] = vertex
        
class UnionSet:
    def __init__(self, parent, rank):
        self.parent = parent
        self.rank = rank
        
def union(unionSets, x, y):
    if unionSets[x].rank > unionSets[y].rank:
        unionSets[y].parent = x
    elif unionSets[x].rank < unionSets[y].rank:
        unionSets[x].parent = y
    else:
        unionSets[x].parent = y
        unionSets[y].rank += 1
        
def find(unionSets, x):
    if unionSets[x].parent == x:
        return x
    else:
        return find(unionSets, unionSets[x].parent)
        
class Kruskal:
    def __init__(self, graph):
        self.graph = graph
    
    def calculate(self):
        unionSets = {}
        N = len(self.graph.get_vertices())
        while N > 0:
            unionSets[N] = UnionSet(N, 0)
            N -= 1
        edges = queue.PriorityQueue()
        for u in self.graph.get_vertices():
            for v, cost in self.graph.get_vertex(u).get_edges().items():
                if u < v:
                    edges.put((cost, cost + u + v, u, v))
        ans = 0
        while not edges.empty():
            cost, _, u, v = edges.get()
            p_u, p_v = find(unionSets, u), find(unionSets, v)
            if p_u == p_v:
                continue
            union(unionSets, p_u, p_v)
            ans += cost
        return ans