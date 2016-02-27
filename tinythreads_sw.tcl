#
# tinythreads_sw.tcl -- A description of TinyThreads
#                       for Altera Nios II BSP tools
#

# Create a new operating system called "tinyth"
create_os TINYTH

# Set UI display name
set_sw_property display_name "TinyThreads"

# This OS "extends" HAL BSP type
set_sw_property extends_bsp_type HAL

# The version of this software
set_sw_property version 0.1

# Localtion in generated BSP
set_sw_property bsp_subdirectory TINYTH

# Interrupt properties
set_sw_property isr_preemption_supported true

# C source files
add_sw_property c_source TINYTH/src/alt_env_lock.c
add_sw_property c_source TINYTH/src/alt_malloc_lock.c
add_sw_property c_source TINYTH/src/tth_arch_nios2.c
add_sw_property c_source TINYTH/src/tth_attr.c
add_sw_property c_source TINYTH/src/tth_cond.c
add_sw_property c_source TINYTH/src/tth_mutex.c
add_sw_property c_source TINYTH/src/tth_once.c
add_sw_property c_source TINYTH/src/tth_sched.c
add_sw_property c_source TINYTH/src/tth_sem.c
add_sw_property c_source TINYTH/src/tth_thread.c

# Assembler source files
add_sw_property asm_source TINYTH/src/tth_arch_nios2_asm.S

# Include files
add_sw_property include_source TINYTH/inc/os/alt_hooks.h
add_sw_property include_source TINYTH/inc/os/alt_sem.h
add_sw_property include_source TINYTH/inc/priv/tth_arch_nios2.h
add_sw_property include_source TINYTH/inc/priv/tth_core.h
add_sw_property include_source TINYTH/inc/priv/tth_mutex.h
add_sw_property include_source TINYTH/inc/pthread.h
add_sw_property include_source TINYTH/inc/sched.h
add_sw_property include_source TINYTH/inc/semaphore.h
add_sw_property include_source TINYTH/inc/tthread.h

# Overridden HAL files
add_sw_property excluded_hal_source HAL/src/alt_env_lock.c
add_sw_property excluded_hal_source HAL/src/alt_malloc_lock.c
add_sw_property excluded_hal_source HAL/inc/os/alt_hooks.h
add_sw_property excluded_hal_source HAL/inc/os/alt_sem.h

# Include paths
add_sw_property include_directory TINYTH/inc

# Makefile additions
add_sw_property alt_cppflags_addition "-D__tinythreads__"

#
# TinyThreads settings
#

# Feature enable/disable
add_sw_setting boolean system_h_define feature.enable_cond TTHREAD_ENABLE_COND 1 "Enable pthread_cond*() APIs"
add_sw_setting boolean system_h_define feature.enable_mutex TTHREAD_ENABLE_MUTEX 1 "Enable pthread_mutex*() APIs"
add_sw_setting boolean system_h_define feature.enable_sem TTHREAD_ENABLE_SEM 1 "Enable sem_*() APIs"
add_sw_setting boolean system_h_define feature.enable_once TTHREAD_ENABLE_ONCE 1 "Enable pthread_once*() APIs"
add_sw_setting boolean system_h_define feature.enable_rwlock TTHREAD_ENABLE_RWLOCK 1 "Enable pthread_rwlock*() APIs"
add_sw_setting boolean system_h_define feature.enable_spin TTHREAD_ENABLE_SPIN 1 "Enable pthread_spin*() APIs"

# Scheduling settings
add_sw_setting decimal_number system_h_define scheduling.preemption.interval TTHREAD_PREEMPTION_INTERVAL 10 "Interval of preemption (in tick counts)"
add_sw_setting decimal_number system_h_define scheduling.priority.max SCHED_PRIORITY_MAX 99 "Maximum priority value (1~255)"
add_sw_setting decimal_number system_h_define scheduling.priority.min SCHED_PRIORITY_MIN 1 "Minimum priority value (1~255)"
add_sw_setting decimal_number system_h_define scheduling.priority.default SCHED_PRIORITY_DEFAULT 10 "Default priority value"

# pthread settings
add_sw_setting hex_number system_h_define pthreads.min_stack_size PTHREAD_STACK_MIN 0x1000 "Minimum stack size for threads"

