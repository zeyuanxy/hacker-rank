#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-28 00:48:23
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-28 00:48:35
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
        while (N > 0):
            self.vertices[N] = Vertex()
            N -= 1

    def get_vertices(self):
        return self.vertices

    def get_vertex(self, key):
        return self.vertices[key]

    def add_vertex(self, key, vertex):
        self.vertices[key] = vertex
        
class Prim:
    def __init__(self, graph):
        self.graph = graph
    
    def calculate(self):
        visited = set()
        vertices = queue.PriorityQueue()
        vertices.put((0, 1))
        ans = 0
        while not vertices.empty():
            cost, vertex = vertices.get()
            if vertex in visited:
                continue
            visited.add(vertex)
            ans += cost
            self.update_vertices(vertex, visited, vertices)
        return ans
        
    def update_vertices(self, parent, visited, vertices):
        edges = self.graph.get_vertex(parent).get_edges()
        for vertex, cost in edges.items():
            if vertex in visited:
                continue
            vertices.put((cost, vertex))