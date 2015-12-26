#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-26 16:28:23
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-26 16:28:36
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
        
class Dijkstra:
    def __init__(self, graph):
        self.graph = graph
    
    def calculate(self, start):
        distances = {}
        adjacents = queue.PriorityQueue()
        adjacents.put((0, start))
        while not adjacents.empty():
            (distance, vertex) = adjacents.get()
            if vertex in distances:
                continue
            distances[vertex] = distance
            self.update_adjacents(vertex, distances, adjacents)
        return distances
        
    def update_adjacents(self, parent, distances, adjacents):
        edges = self.graph.get_vertex(parent).get_edges()
        for vertex, distance in edges.items():
            adjacents.put((distances[parent] + distance, vertex)) 