/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2007 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

/* This file is designed for use with ISim build 0xef153c89 */

#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Designs/MekalTom/rs_232/top.v";



static void A31_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    t1 = (t0 + 1620U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1800);
    *((int *)t2) = 1;
    t3 = (t0 + 1648);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(32, ng0);

LAB5:    xsi_set_current_line(33, ng0);
    t4 = (t0 + 740U);
    t5 = *((char **)t4);
    t4 = (t0 + 1052);
    xsi_vlogvar_generic_wait_assign_value(t4, t5, 2, 0, 0, 1, 0LL);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1052);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t0 + 1144);
    xsi_vlogvar_generic_wait_assign_value(t5, t4, 2, 0, 0, 1, 0LL);
    goto LAB2;

}


extern void work_m_00000000000007196637_3823007873_init()
{
	static char *pe[] = {(void *)A31_0};
	xsi_register_didat("work_m_00000000000007196637_3823007873", "isim/_tmp/work/m_00000000000007196637_3823007873.didat");
	xsi_register_executes(pe);
}
