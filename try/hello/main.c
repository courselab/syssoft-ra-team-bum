/*
 *    SPDX-FileCopyrightText: 2021 Monaco F. J. <monaco@usp.br>
 *   
 *    SPDX-License-Identifier: GPL-3.0-or-later
 *
 *    This file is part of SYSeg, available at https://gitlab.com/monaco/syseg.
 */

#include <stdio.h>

void int_to_string(int num, char *str)
{
    int i = 0;
    int is_negative = 0;

    if (num == 0)
    {
        str[i++] = '0';
        str[i] = '\0';
        return;
    }

    if (num < 0)
    {
        is_negative = 1;
        num = -num;
    }

    // Convert digits to characters in reverse order
    while (num > 0)
    {
        int digit = num % 10;
        str[i++] = digit + '0';
        num /= 10;
    }

    if (is_negative)
        str[i++] = '-';

    str[i] = '\0';

    // Reverse the string
    for (int j = 0; j < i / 2; j++)
    {
        char temp = str[j];
        str[j] = str[i - j - 1];
        str[i - j - 1] = temp;
    }
}

int __attribute__((fastcall, naked)) get_memory_size(); 

int main(void)   
{
  char buffer[10];
  int mem_kb = get_memory_size();
  int_to_string(mem_kb, buffer); 
  printf(buffer);

  return 0;
}
