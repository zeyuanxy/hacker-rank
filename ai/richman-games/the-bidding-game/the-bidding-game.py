#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2015-12-04 21:13:26
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2015-12-04 21:13:30
#!/bin/python

INITIAL_MONEY = 100
BOARD_SIZE    = 11

def calculate_bid(player, pos, first_moves, second_moves):
    def calculate(pos, moves, opponent_moves):
        money = INITIAL_MONEY - sum(moves)
        opponent_money = INITIAL_MONEY - sum(opponent_moves)
        
        spots_remaining = BOARD_SIZE - pos
        opponent_spots_remaining = BOARD_SIZE - spots_remaining
        
        winning  = spots_remaining < opponent_spots_remaining
        base_bid = (money / spots_remaining)

        if winning:
            return base_bid
        else:
            return base_bid + 2
    
    if player == '1':
        return calculate(pos, first_moves, second_moves)
    else:
        return calculate(pos, second_moves, first_moves)
    
#gets the id of the player
player = input()

scotch_pos = input()         #current position of the scotch

first_moves = [int(i) for i in raw_input().split()]
second_moves = [int(i) for i in raw_input().split()]
bid = calculate_bid(player,scotch_pos,first_moves,second_moves)
print bid
