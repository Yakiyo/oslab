#include <lib/debug.h>
#include <lib/types.h>
#include "import.h"

#define PAGESIZE     4096
#define VM_USERLO    0x40000000
#define VM_USERHI    0xF0000000
#define VM_USERLO_PI (VM_USERLO / PAGESIZE)
#define VM_USERHI_PI (VM_USERHI / PAGESIZE)

/**
 * Allocate a physical page.
 *
 * 1. First, implement a naive page allocator that scans the allocation table (AT)
 *    using the functions defined in import.h to find the first unallocated page
 *    with normal permissions.
 *    (Q: Do you have to scan the allocation table from index 0? Recall how you have
 *    initialized the table in pmem_init.)
 *    Then mark the page as allocated in the allocation table and return the page
 *    index of the page found. In the case when there is no available page found,
 *    return 0.
 * 2. Optimize the code using memoization so that you do not have to
 *    scan the allocation table from scratch every time.
 *
 * Note: palloc may run on several CPUs at the same time (lab 6), so the
 * allocation table is protected by mem_lock() / mem_unlock(). Keep your code
 * between the two calls and do not return in between.
 */
unsigned int palloc()
{
    unsigned int palloc_free_index = 0;
    static unsigned int next = VM_USERLO_PI;

    mem_lock();

    // TODO [Lab 1]
    unsigned int range = get_nps();
    if (range > VM_USERHI_PI) {
        range = VM_USERHI_PI;
    } 

    if (range > VM_USERLO_PI) {
        for (unsigned int check = 0; check < range - VM_USERLO_PI; check++) {
            unsigned int i = next;
            next++;

            if (next >= range) {
                next = VM_USERLO_PI;
            }

            if (at_is_norm(i) && !at_is_allocated(i)) {
                at_set_allocated(i, 1);
                palloc_free_index = i;
                break;
            }
        }
    }

    // unsigned int nps = get_nps();
    // if (nps > VM_USERHI_PI) {
    //     nps = VM_USERHI_PI;
    // }

    // for (unsigned int i = VM_USERLO_PI; i < nps; i++) {
    //     if (at_is_norm(i) && !at_is_allocated(i)) {
    //         at_set_allocated(i, 1);
    //         palloc_free_index = i;
    //         break;
    //     }
    // }

    mem_unlock();

    return palloc_free_index;
}

/**
 * Free a physical page.
 *
 * This function marks the page with given index as unallocated
 * in the allocation table.
 *
 * Hint: Simple.
 */
void pfree(unsigned int pfree_index)
{
    mem_lock();
    // TODO [Lab 1]
    at_set_allocated(pfree_index, 0);
    mem_unlock();
}
