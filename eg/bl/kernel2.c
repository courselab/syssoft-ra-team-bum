/*
 *    SPDX-FileCopyrightText: 2021 Monaco F. J. <monaco@usp.br>
 *
 *    SPDX-License-Identifier: GPL-3.0-or-later
 *
 *    This file is part of SYSeg, available at https://gitlab.com/monaco/syseg.
 */

#include "bios1.h"
#include "bounce.h"

void kernel_init(void)
{
  clear();
  
  splash();

  bounce();

  halt();
}
