/*
 *    SPDX-FileCopyrightText: 2021 Monaco F. J. <monaco@usp.br>
 *
 *    SPDX-License-Identifier: GPL-3.0-or-later
 *
 *    This file is part of SYSeg, available at https://gitlab.com/monaco/syseg.
 */

/* eg-07.c - C source file. */

#include <stdio.h>

int main()
{
  char a[5];

  a[0] = 'H';
  a[1] = 'e';
  a[2] = 'l';
  a[3] = 'l';
  a[4] = 'o';

  a[21] = 0x42;
  a[22] = 0x42;
  a[23] = 0x42;
  a[24] = 0x42;

  return 7;
}
