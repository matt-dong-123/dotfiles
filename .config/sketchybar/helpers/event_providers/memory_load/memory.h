#include <mach/mach.h>
#include <mach/vm_statistics.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdio.h>

struct memory {
  host_t host;
  mach_msg_type_number_t count;
  vm_statistics_data_t vm_stats;

  int used_percent;
  uint64_t used_bytes;
  uint64_t total_bytes;
};

static inline void memory_init(struct memory* memory) {
  memory->host = mach_host_self();
  memory->count = HOST_VM_INFO_COUNT;
}

static inline void memory_update(struct memory* memory) {
  kern_return_t error = host_statistics(memory->host,
                                       HOST_VM_INFO,
                                       (host_info_t)&memory->vm_stats,
                                       &memory->count);

  if (error != KERN_SUCCESS) {
    printf("Error: Could not read memory host statistics.\n");
    // Set safe defaults
    memory->used_percent = 0;
    memory->used_bytes = 0;
    memory->total_bytes = 0;
    return;
  }

  // Calculate memory usage
  // Total memory = free + active + inactive + wired + speculative
  uint64_t total = memory->vm_stats.free_count +
                   memory->vm_stats.active_count +
                   memory->vm_stats.inactive_count +
                   memory->vm_stats.wire_count +
                   memory->vm_stats.speculative_count;

  // Used memory = active + wired (similar to Activity Monitor)
  uint64_t used = memory->vm_stats.active_count +
                  memory->vm_stats.wire_count;

  memory->total_bytes = total * vm_page_size;
  memory->used_bytes = used * vm_page_size;
  memory->used_percent = total > 0 ? (double)used / (double)total * 100.0 : 0;
}
