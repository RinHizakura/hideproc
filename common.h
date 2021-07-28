#ifndef COMMON_H
#define COMMON_H

#include <linux/kernel.h>
#include <linux/sched.h>

#define find_task_by_pid(pid) pid_task(find_vpid(pid), PIDTYPE_PID)
#define get_task_by_pid(pid) get_pid_task(find_get_pid(PID), PIDTYPE_PID)

static inline pid_t get_ppid_by_pid(pid_t pid)
{
    struct task_struct *task = find_task_by_pid(pid);

    if (task->parent)
        return task->parent->pid;

    return 0;
}

#endif
